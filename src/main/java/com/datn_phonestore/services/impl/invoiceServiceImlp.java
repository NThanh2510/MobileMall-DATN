package com.datn_phonestore.services.impl;

import com.datn_phonestore.dto.admin.invoice.request.SaleDetailRequest;
import com.datn_phonestore.dto.admin.invoice.request.SaleRequest;
import com.datn_phonestore.entity.SalesOrder;
import com.datn_phonestore.entity.SalesOrderDetail;
import com.datn_phonestore.reponsitory.SaleOrderDetailRepository;
import com.datn_phonestore.reponsitory.SalesOrderRepository;
import com.datn_phonestore.services.invoiceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class invoiceServiceImlp implements invoiceService {
    @Autowired
    SaleOrderDetailRepository saleOrderDetailRepository;
    @Autowired
    SalesOrderRepository salesOrderRepository;

    @Override
    public void call(SaleRequest invokeRequest, SaleDetailRequest invoiceDetailRequest) {
//        // Lấy thông tin người dùng từ SecurityContext
//        var authentication = SecurityContextHolder.getContext().getAuthentication();
//        String kcid = authentication.getName();  // Mã khách hàng (hoặc tên người dùng)
//
//        // Khởi tạo đơn hàng bán
//        SalesOrder salesOrder = new SalesOrder();
//        salesOrder.setKcid(kcid);
//        salesOrder.setOrderDate(LocalDate.now());
//
//        // Khởi tạo danh sách chi tiết đơn hàng
//        List<SalesOrderDetail> salesOrderDetailList = new ArrayList<>();
//
//        for (SaleDetailRequest invoiceDetailRequests : invoiceDetailRequests) {
//            SalesOrderDetail salesOrderDetail = new SalesOrderDetail();
//            salesOrderDetail.setQuantity(invoiceDetailRequest.getQuantity());
//            salesOrderDetail.setProductId(invoiceDetailRequest.getProductId());
//            salesOrderDetail.setPrice(invoiceDetailRequest.getPrice());
//            salesOrderDetail.setOptionId(invoiceDetailRequest.getOptionId());
//            salesOrderDetail.setSalesOrderId(salesOrder.getSalesOrderId());
//
//            salesOrderDetailList.add(salesOrderDetail);
//        }
//
//        // Gán danh sách chi tiết vào đơn hàng
//        salesOrder.setSalesOrderDetails(salesOrderDetailList);
//
//        // Tính toán tổng giá trị đơn hàng
//        double totalPrice = salesOrderDetailList.stream()
//                .mapToDouble(detail -> detail.getPrice() * detail.getQuantity())
//                .sum();
//
//        // Gán tổng giá trị vào đơn hàng
//        salesOrder.setTotalPrice(totalPrice);
//
//        // Lưu đơn hàng (ví dụ, gọi dịch vụ để lưu vào cơ sở dữ liệu)
//        // salesOrderService.save(salesOrder);
    }
}
