package com.datn_phonestore.restController;


import com.datn_phonestore.dto.ApiResponse;
import com.datn_phonestore.dto.user.request.LoginRequest;
import com.datn_phonestore.dto.user.request.RegistrationRequest;
import com.datn_phonestore.dto.user.request.UpdateUserRequest;
import com.datn_phonestore.dto.user.response.LoginResponse;
import com.datn_phonestore.dto.user.response.UserResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import com.datn_phonestore.services.UserService;

import java.util.List;

@RestController
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping("/register")
    ApiResponse<UserResponse> register(@RequestBody @Valid RegistrationRequest request) {
        return ApiResponse.<UserResponse>builder()
                .result(userService.register(request))
                .build();
    }

//    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/user/list")
    ApiResponse<List<UserResponse>> getAllProfiles() {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return ApiResponse.<List<UserResponse>>builder()
                .result(userService.getAllProfiles())
                .build();
    }
    @GetMapping("/user/my-profile")
    ApiResponse<UserResponse> getMyProfiles() {
        return ApiResponse.<UserResponse>builder()
                .result(userService.getMyUser())
                .build();
    }


    @PostMapping("/login")
    ApiResponse<LoginResponse> login(@RequestBody @Valid LoginRequest request) {
        return ApiResponse.<LoginResponse>builder()
                .result(userService.login(request))
                .build();
    }
    @PutMapping("/user/update")
    public ResponseEntity<ApiResponse<String>> updateUser(
            @RequestBody @Valid UpdateUserRequest request) {
        try {
            userService.UpdateUser( request);
            ApiResponse<String> response = ApiResponse.<String>builder()
                    .code(200)
                    .message("User updated successfully")
                    .result("")
                    .build();
            return ResponseEntity.ok(response);
        } catch (Exception ex) {

            ApiResponse<String> response = ApiResponse.<String>builder()
                    .code(500)
                    .message("Error updating user")
                    .result("Failed to update user: " + ex.getMessage())
                    .build();
            return ResponseEntity.status(500).body(response);
        }
    }
}
