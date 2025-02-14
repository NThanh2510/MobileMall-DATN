package com.datn_phonestore.dto.admin.invoice.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SaleRequest {
    BigDecimal totalPrice;
    String status;
    LocalDate orderDate;
    Long kcid;
    List<SaleDetailRequest> invoiceDetailRequests;
}
