package com.datn_phonestore.dto.admin.voucher.response;

import com.datn_phonestore.entity.Voucher;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class VoucherResponse {
    Long voucherId;
    String name;
     String discountType;
     BigDecimal discountValue;
     String gift;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
     LocalDate startDate;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
     LocalDate endDate;
     Boolean status;

}
