package com.datn_phonestore.dto.admin.products.option.request;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Setter
@Getter
public class OptionRequest {
    String color;
    BigDecimal colorPriceAdjustment;
    String storageRam;
    BigDecimal storageRamPriceAdjustment;
    Integer quantity;
    BigDecimal finalPrice;
    Long productId;
}
