package com.datn_phonestore.dto.user.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdateUserRequest {

    private String firstName;
    private String lastName;
    private String email;
//    private boolean enabled;
}

