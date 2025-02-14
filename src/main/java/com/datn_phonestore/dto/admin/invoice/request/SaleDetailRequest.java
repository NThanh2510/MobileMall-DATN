package com.datn_phonestore.dto.admin.invoice.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;



@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SaleDetailRequest {
    Integer quantity;
    BigDecimal price;
    BigDecimal subPrice;
    Long productId;
    Long optionId;
    Long saleOrderId;

}
