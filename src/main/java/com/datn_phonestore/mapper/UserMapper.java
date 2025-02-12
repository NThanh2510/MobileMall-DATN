package com.datn_phonestore.mapper;

import com.datn_phonestore.dto.user.request.RegistrationRequest;
import com.datn_phonestore.dto.user.response.UserResponse;
import com.datn_phonestore.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {
    User toUser(RegistrationRequest request);

    UserResponse toUserResponse(User user);
}
