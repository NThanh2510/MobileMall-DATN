package com.datn_phonestore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "purchase_orders")
public class PurchaseOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purchase_order_id")
    Long purchaseOrderId;
    @Column(name = "order_date")
    LocalDate orderDate;
    @Column(name = "total_cost")
    BigDecimal totalCost;
    @Column(name = "supplier_name")
    String supplierName;
    @Column(name = "contact_info")
    String contactInfo;
    String address;
    @Column(name = "user_name")
    String userName;
}
