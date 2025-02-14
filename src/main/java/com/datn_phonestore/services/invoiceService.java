package com.datn_phonestore.services;
import com.datn_phonestore.dto.admin.invoice.request.SaleDetailRequest;
import com.datn_phonestore.dto.admin.invoice.request.SaleRequest;


public interface invoiceService {
    public void call(SaleRequest invokeRequest, SaleDetailRequest invoiceDetailRequest);
}
