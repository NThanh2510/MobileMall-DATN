package com.datn_phonestore.services.impl;

import com.datn_phonestore.dto.admin.voucher.request.CreateVoucherRequest;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.entity.Voucher;
import com.datn_phonestore.mapper.VoucherMapper;
import com.datn_phonestore.reponsitory.VoucherRepository;
import com.datn_phonestore.services.VoucherAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class VoucherServiceImpl implements VoucherAdminService {

    @Autowired
     VoucherRepository voucherRepository;
    @Autowired
     VoucherMapper voucherMapper;

    @Override
        public List<VoucherResponse> getAllVouchers() {
            var vouchers = voucherRepository.findAll();
           return vouchers.stream()
                    .map(voucherMapper::toVoucherResponse)
                   .collect(Collectors.toList());
        }

    @Override
    public VoucherResponse createVoucher(CreateVoucherRequest request) {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String kcid = authentication.getName();
        log.info("KCID: {}", kcid);
        Voucher voucher = new Voucher();
        voucher.setName(request.getName());
        voucher.setDiscountType(request.getDiscountType());
        voucher.setDiscountValue(request.getDiscountValue());
        voucher.setGift(request.getGift());
        voucher.setEndDate(request.getEndDate());
        voucher.setStartDate(request.getStartDate());
        voucher.setStatus(request.getStatus());
        voucher.setKcid(kcid);
        voucherRepository.save(voucher);
        return null;
    }

    @Override
    public VoucherResponse updateVoucher(CreateVoucherRequest request, Long id) {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String kcid = authentication.getName();
        log.info("KCID: {}", kcid);
        Voucher voucher = voucherRepository.findById(id).orElseThrow(() -> new RuntimeException("Voucher not found"));
        voucher.setName(request.getName());
        voucher.setDiscountType(request.getDiscountType());
        voucher.setDiscountValue(request.getDiscountValue());
        voucher.setGift(request.getGift());
        voucher.setEndDate(request.getEndDate());
        voucher.setStartDate(request.getStartDate());
        voucher.setStatus(request.getStatus());
        voucher.setProductId(request.getProductId());
        voucher.setKcid(kcid);
        voucherRepository.save(voucher);
        log.info("Update thanh cong:");
        return null;
    }


}


