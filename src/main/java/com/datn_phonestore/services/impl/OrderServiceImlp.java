package com.datn_phonestore.services.impl;

import com.datn_phonestore.dto.admin.sale.request.SaleDetailRequest;
import com.datn_phonestore.dto.admin.sale.response.SaleListResponse;
import com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse;
import com.datn_phonestore.dto.admin.sale.response.SalesOrderResponse;
import com.datn_phonestore.entity.SalesOrder;
import com.datn_phonestore.entity.SalesOrderDetail;
import com.datn_phonestore.reponsitory.SaleOrderDetailRepository;
import com.datn_phonestore.reponsitory.SalesOrderRepository;
import com.datn_phonestore.services.OrderService;
import jakarta.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class OrderServiceImlp implements OrderService {
    @Autowired
    SaleOrderDetailRepository saleOrderDetailRepository;
    @Autowired
    SalesOrderRepository salesOrderRepository;


    @Override
    public List<SaleListResponse> getSalesOrders() {
        List<SaleListResponse> salesOrder = salesOrderRepository.findAllDTO();
       return salesOrder;
    }

    @Override
    public List<SaleOrderDetailResponse> getOderDetailById(Long salesOrderId) {

        return  saleOrderDetailRepository.findBySalesOrderDetailId(salesOrderId);
//        return null;
    }


    @Transactional
    @Override
    public SalesOrder createOrder(List<SaleDetailRequest> details) {

        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String kcid = authentication.getName();

        SalesOrder salesOrder = new SalesOrder();
        salesOrder.setKcid(kcid);
        salesOrder.setOrderDate(LocalDate.now());
        salesOrder.setStatus("Đã thanh toán");

        BigDecimal totalPrice = details.stream()
                .map(d -> d.getPrice().multiply(new BigDecimal(d.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        salesOrder.setTotalPrice(totalPrice);

        // Lưu đơn hàng trước để lấy ID
        SalesOrder savedOrder = salesOrderRepository.save(salesOrder);
        Long orderId = savedOrder.getSalesOrderId();

        // Chuyển đổi SaleDetailRequest → SalesOrderDetail
        List<SalesOrderDetail> salesOrderDetails = details.stream()
                .map(d -> {
                    SalesOrderDetail detail = new SalesOrderDetail();
                    detail.setSalesOrderId(orderId);
                    detail.setProductId(d.getProductId());
                    detail.setQuantity(d.getQuantity());
                    detail.setPrice(d.getPrice());
                    detail.setOptionId(d.getOptionId());
                    return detail;
                })
                .collect(Collectors.toList());

        // Lưu danh sách chi tiết đơn hàng
        saleOrderDetailRepository.saveAll(salesOrderDetails);

        return savedOrder;
    }


}
