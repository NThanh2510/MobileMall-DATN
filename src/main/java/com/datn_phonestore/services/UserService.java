package com.datn_phonestore.services;

import com.datn_phonestore.dto.user.request.LoginRequest;
import com.datn_phonestore.dto.user.request.RegistrationRequest;
import com.datn_phonestore.dto.user.request.UpdateUserRequest;
import com.datn_phonestore.dto.user.response.LoginResponse;
import com.datn_phonestore.dto.user.response.UserResponse;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;

public interface UserService {
    public UserResponse getMyUser();

    public List<UserResponse> getAllProfiles();

    public UserResponse register(RegistrationRequest request);

    public LoginResponse login (LoginRequest response);

    public void Logout(String id);

    public void  UpdateUser(UpdateUserRequest request);

    public void  addRoleToUser(String username, String role);

    @PreAuthorize("hasRole('ADMIN')")
    public void isAdmin();
}

