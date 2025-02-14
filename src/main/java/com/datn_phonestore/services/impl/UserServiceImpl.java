package com.datn_phonestore.services.impl;

import com.datn_phonestore.dto.user.identity.TokenExchangeParam;
import com.datn_phonestore.dto.user.identity.TokenLoginExchangeParam;
import com.datn_phonestore.dto.user.request.LoginRequest;
import com.datn_phonestore.dto.user.request.RegistrationRequest;
import com.datn_phonestore.dto.user.request.UpdateUserRequest;
import com.datn_phonestore.dto.user.response.LoginResponse;
import com.datn_phonestore.dto.user.response.UserResponse;
import com.datn_phonestore.entity.User;
import com.datn_phonestore.exception.AppException;
import com.datn_phonestore.exception.ErrorCode;
import com.datn_phonestore.exception.ErrorNormalizer;
import feign.FeignException;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import com.datn_phonestore.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.datn_phonestore.reponsitory.IdentityClient;
import com.datn_phonestore.reponsitory.UserRepository;
import com.datn_phonestore.services.UserService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserServiceImpl implements UserService {


    UserRepository userRepository;

    UserMapper userMapper;

    IdentityClient identityClient;

    ErrorNormalizer errorNormalizer;

    @Value("${idp.client-secret}")
    @NonFinal
    String clientSecret;

    @Value("${idp.client-id}")
    @NonFinal
    String clientId;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


    @Override
    public UserResponse getMyUser() {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String kcid = authentication.getName();
        log.info("kcId: {}", kcid);
        var user = userRepository.findByKcid(kcid).orElseThrow(
                () -> new AppException(ErrorCode.USER_NOT_EXISTED));
        return userMapper.toUserResponse(user);
    }

    @Override
    public List<UserResponse> getAllProfiles() {
        var users = userRepository.findAll();
        return users.stream().map(userMapper::toUserResponse).collect(Collectors.toList());
    }

    @Override
    public UserResponse register(RegistrationRequest request) {

        var token = identityClient.exchangeToken(TokenExchangeParam.builder()
                .grant_type("client_credentials")
                .client_id(clientId)
                .client_secret(clientSecret)
                .scope("openid")
                .build());
        log.info("Token: {}", token);



        userRepository.findByEmail(request.getEmail())
                .ifPresent(user -> {
                    throw new AppException(ErrorCode.EMAIL_EXISTED);
                });

        userRepository.findByUsername(request.getUsername())
                .ifPresent(user -> {
                    throw new AppException(ErrorCode.USER_EXISTED);
                });

        User newUser = new User();
        newUser.setUsername(request.getUsername());
        newUser.setPassword(passwordEncoder.encode(request.getPassword()));
        newUser.setEmail(request.getEmail());
        newUser.setFirstName(request.getFirstName());
        newUser.setLastName(request.getLastName());
        newUser = userRepository.save(newUser);
        log.info("đã save user");

        //Gán giá trị kcid
        String kcid = "f:db48927c-2cf8-4f23-a16a-569b17069134:" + newUser.getId();
        log.info(passwordEncoder.encode(newUser.getPassword()));
        newUser.setKcid(kcid);
        newUser = userRepository.save(newUser);
//        log.info("kcUserId đã được cập nhật cho User: {}", newUser);

         identityClient.sendmail("Bearer "+ token.getAccessToken(),kcid );
        return null;
    }

    @Override
    public LoginResponse login(LoginRequest request) {

        Optional<User> user = userRepository.findByUsername(request.getUsername());
        if (user.isEmpty()) {
            // Nếu không tìm thấy người dùng, thực hiện hành động
            System.out.println("Không tìm thấy người dùng");
            throw new AppException(ErrorCode.USER_NOT_EXISTED);
        } else {
            // Nếu tìm thấy người dùng, kiểm tra mật khẩu
            String storedPassword = user.get().getPassword();
            if (passwordEncoder.matches(request.getPassword(), storedPassword)) {
                System.out.println("Mật khẩu đúng");
                try {
                    var token = identityClient.exchangeTokenLogin(TokenLoginExchangeParam.builder()
                            .grant_type("password")
                            .client_id(clientId)
                            .client_secret(clientSecret)
                            .username(request.getUsername())
                            .password(request.getPassword())
                            .scope("openid")
                            .build());
                    log.info("Token response: {}", token.getAccessToken());

                    return LoginResponse.builder()
                            .accessToken(token.getAccessToken())
                            .refreshToken(token.getRefreshToken())
                            .expiresIn(token.getExpiresIn())
                            .build();
                } catch (FeignException exception) {
                    String errorMessage = exception.contentUTF8();
                    log.error("Feign Exception occurred: {}", errorMessage);
                    throw new AppException(ErrorCode.VERIFY_MAIL);
                }
            } else {
                System.out.println("Mật khẩu sai");
                throw new AppException(ErrorCode.USERAPASS_NOT_EXISTED);
            }
        }
    }




    @Override
    public void Logout(String id) {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String kcUserId = authentication.getName();
        identityClient.logOut(kcUserId);
    }

    @Override
    public void UpdateUser(UpdateUserRequest request) {
        try {
            var authentication = SecurityContextHolder.getContext().getAuthentication();
            String kcUserId = authentication.getName();
            log.info("KcUserId: {}", kcUserId);
            User user = userRepository.findByKcid(kcUserId).orElseThrow();

            user.setFirstName(request.getFirstName());
            user.setLastName(request.getLastName());
            user.setEmail(request.getEmail());


            userRepository.save(user);

        } catch (FeignException exception) {
            throw errorNormalizer.handleKeyCloakException(exception);
        }
    }

    @Override
    public void addRoleToUser(String username, String role) {

    }

    @Override
    public void isAdmin() {

    }
}
