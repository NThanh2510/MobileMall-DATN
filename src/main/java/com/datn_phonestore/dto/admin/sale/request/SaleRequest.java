package com.datn_phonestore.dto.admin.sale.request;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SaleRequest {
//    BigDecimal totalPrice;
//    String status;
//    LocalDate orderDate;
//    Long kcid;
//    List<SaleDetailRequest> invoiceDetailRequests;
//    String kcid;
    List<SaleDetailRequest> details;
}
