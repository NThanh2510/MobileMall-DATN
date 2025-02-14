package com.datn_phonestore.dto.admin.products.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDate;



@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductOptionResponse {
    String productId;
    String name;
    String basePrice;
    String mainImg;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "d/M/yyyy")
    LocalDate CreateDate;
    Long warranty;
    Long subCategoryId;
    String screenSize;
    String screenResolution;
    String processor;
    String rearCamera;
    String frontCamera;
    String battery;
    boolean fastCharging;
    boolean water_resistance;
    LocalDate releaseDate;
    Long productIdfordetali;
    Long os;
    String design;
    String material;
    BigDecimal weight;
    String batteryType;
    String network;
    String sim;
    String wifi;
    String gps;
    boolean nfc;
    String color;
    BigDecimal colorPriceAdjustment;
    String storageRam;
    BigDecimal storageRamPriceAdjustment;


}
