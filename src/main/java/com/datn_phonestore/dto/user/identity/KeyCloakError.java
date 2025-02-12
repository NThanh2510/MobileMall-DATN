package com.datn_phonestore.dto.user.identity;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)

public class KeyCloakError {
    String errorMessage;
}
