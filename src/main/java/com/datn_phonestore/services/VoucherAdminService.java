package com.datn_phonestore.services;

import com.datn_phonestore.dto.admin.voucher.request.CreateVoucherRequest;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.entity.Voucher;

import java.util.List;

public interface VoucherAdminService {
   List<VoucherResponse> getAllVouchers();
   VoucherResponse createVoucher(CreateVoucherRequest request);
   VoucherResponse updateVoucher(CreateVoucherRequest request, Long id);
}
