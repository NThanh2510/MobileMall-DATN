package com.datn_phonestore.services;
import com.datn_phonestore.dto.admin.sale.request.SaleDetailRequest;
import com.datn_phonestore.dto.admin.sale.response.SaleListResponse;
import com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse;
import com.datn_phonestore.dto.admin.sale.response.SalesOrderResponse;
import com.datn_phonestore.entity.SalesOrder;
import jakarta.transaction.Transactional;

import java.util.List;


public interface OrderService {


    public List<SaleListResponse> getSalesOrders();
    public List<SaleOrderDetailResponse> getOderDetailById(Long salesOrderId);
    @Transactional
    SalesOrder createOrder(List<SaleDetailRequest> details);
}
