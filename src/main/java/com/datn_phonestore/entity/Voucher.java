package com.datn_phonestore.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "voucher")
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "voucher_id")
    Long voucherId;
    @Column(name = "name")
    String name;
    @Column(name = "discount_type")
    String discountType;
    @Column(name = "discount_value")
    BigDecimal discountValue;
    @Column(name = "gift")
    String gift;
    @Column(name = "start_date")
    Date startDate;
    @Column(name = "end_date")
    Date endDate;
    @Column(name = "status")
    Boolean status;
    @Column(name = "product_id")
    Long productId;

}