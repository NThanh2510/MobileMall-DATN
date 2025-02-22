package com.datn_phonestore.dto.user.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductResponse {
    Integer productId;
    String name;
    Double basePrice;
    String mainImage;
    Date createdDate;
    Integer warranty;
    Integer subCategoryId;
    Integer promotionId;
}
