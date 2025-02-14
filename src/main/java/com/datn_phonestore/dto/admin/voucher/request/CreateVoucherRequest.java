package com.datn_phonestore.dto.admin.voucher.request;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CreateVoucherRequest {
    String name;
    String discountType;
    BigDecimal discountValue;
    String gift;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "d/M/yyyy")
    LocalDate startDate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "d/M/yyyy")
    LocalDate endDate;
    Boolean status;
    Long productId;
    String kcid;
}
