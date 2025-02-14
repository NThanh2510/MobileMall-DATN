package com.datn_phonestore.reponsitory;

import com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse;
import com.datn_phonestore.entity.SalesOrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SaleOrderDetailRepository extends JpaRepository<SalesOrderDetail, Long> {
    @Query("SELECT NEW com.datn_phonestore.dto.admin.sale.response.SaleOrderDetailResponse(" +
            "CONCAT(p.name, ' ', po.color, ' ', po.storageRam), sd.quantity, p.basePrice, po.finalPrice) " +
            "FROM SalesOrderDetail sd " +
            "JOIN Product p ON sd.productId = p.productId " +
            "JOIN ProductOption po ON sd.optionId = po.optionId " +
            "JOIN SalesOrder s ON s.salesOrderId = sd.salesOrderId " +
            "WHERE s.salesOrderId = ?1" )
    List<SaleOrderDetailResponse> findBySalesOrderDetailId(Long salesOrderId);

}
