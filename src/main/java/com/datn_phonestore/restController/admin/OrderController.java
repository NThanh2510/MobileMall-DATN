package com.datn_phonestore.restController.admin;


import com.datn_phonestore.dto.ApiResponse;
import com.datn_phonestore.dto.admin.sale.request.SaleRequest;
import com.datn_phonestore.dto.admin.sale.response.SaleListResponse;
import com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse;
import com.datn_phonestore.dto.admin.sale.response.SalesOrderResponse;
import com.datn_phonestore.entity.SalesOrder;
import com.datn_phonestore.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService salesOrderService;

    @PostMapping("/create")
    public ApiResponse<SalesOrder> createVoucher(@RequestBody SaleRequest request) {
        return ApiResponse.<SalesOrder>builder()
                .result(salesOrderService.createOrder(request.getDetails()))
                .message("success")
                .build();
    }

    @GetMapping("/list")
    public ApiResponse<List<SaleListResponse>> listOrders() {
        return ApiResponse.<List<SaleListResponse>>builder()
                .result(salesOrderService.getSalesOrders())
                .message("success")
                .build();
    }

    @GetMapping("/orderdetail/{id}")

    public ApiResponse<List<SaleOrderDetailResponse>> orderDetail(@PathVariable Long id) {
        return ApiResponse.<List<SaleOrderDetailResponse>>builder()
                .result(salesOrderService.getOderDetailById(id))

                .message("success")
                .build();
    }




}
