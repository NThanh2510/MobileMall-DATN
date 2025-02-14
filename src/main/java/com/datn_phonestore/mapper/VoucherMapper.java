package com.datn_phonestore.mapper;

import com.datn_phonestore.dto.admin.voucher.request.CreateVoucherRequest;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.entity.Voucher;
import org.mapstruct.Mapper;

@Mapper(componentModel= "spring")
public interface VoucherMapper {
    Voucher toVoucher( CreateVoucherRequest request);

    VoucherResponse toVoucherResponse(Voucher voucher);
}
