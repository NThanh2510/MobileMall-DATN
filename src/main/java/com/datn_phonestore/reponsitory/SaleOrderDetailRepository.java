package com.datn_phonestore.reponsitory;

import com.datn_phonestore.entity.SalesOrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SaleOrderDetailRepository extends JpaRepository<SalesOrderDetail, Long> {
}
