package com.datn_phonestore.dto.admin.sale.response;

import com.datn_phonestore.entity.SalesOrder;
import com.datn_phonestore.entity.SalesOrderDetail;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.checkerframework.checker.units.qual.N;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SalesOrderResponse {
    private Long salesOrderId;
    private String kcid;
    private LocalDate orderDate;
    private BigDecimal totalPrice;
    private List<SalesOrderDetail> details;


}
