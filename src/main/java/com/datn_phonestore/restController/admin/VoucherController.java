package com.datn_phonestore.restController.admin;

import com.datn_phonestore.dto.ApiResponse;
import com.datn_phonestore.dto.admin.voucher.request.CreateVoucherRequest;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.dto.user.response.UserResponse;
import com.datn_phonestore.entity.Voucher;
import com.datn_phonestore.reponsitory.VoucherRepository;
import com.datn_phonestore.services.impl.VoucherServiceImpl;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/voucher")
public class VoucherController {
    @Autowired
    VoucherServiceImpl voucherService;


    @GetMapping("/list")
    public ApiResponse<List<VoucherResponse>> listVoucher() {
        return ApiResponse.<List<VoucherResponse>>builder()
                .result(voucherService.getAllVouchers())
                .build();
    }

    @PutMapping("/create")
    public ApiResponse<VoucherResponse> createVoucher(@RequestBody @Valid CreateVoucherRequest request) {
        return ApiResponse.<VoucherResponse>builder()
                .result(voucherService.createVoucher(request))
                .message("success")
                .build();
    }

    @PutMapping("/update/{id}")
    public ApiResponse<VoucherResponse> updateVoucher(@RequestBody @Valid CreateVoucherRequest request,@PathVariable Long id) {
        return ApiResponse.<VoucherResponse>builder()
                .result(voucherService.updateVoucher(request, id))
                .message("success")
                .build();
    }

}
