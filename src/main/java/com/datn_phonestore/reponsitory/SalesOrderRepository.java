package com.datn_phonestore.reponsitory;

import com.datn_phonestore.dto.admin.sale.response.SaleListResponse;
import com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse;
import com.datn_phonestore.entity.SalesOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SalesOrderRepository extends JpaRepository<SalesOrder, Long> {
    @Query("Select new com.datn_phonestore.dto.admin.sale.response.SaleListResponse" +
            "(s.salesOrderId, CONCAT(u.firstName, ' ',u.lastName), u.email, s.totalPrice, s.status, s.orderDate )" +
            "FROM SalesOrder s " +
            "JOIN User u ON s.kcid = u.kcid")
    List<SaleListResponse> findAllDTO();

}
