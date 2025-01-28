package entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "accounts")
public class PurchaseOrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "purchase_order_detail_id")
    Long purchaseOrderDetailId;
    Integer quantity;
    @Column(name = "unit_cost")
    BigDecimal unitCost;
    @Column(name = "sub_total")
    BigDecimal subTotal;
    @Column(name = "product_id")
    BigDecimal productId;
    @Column(name = "option_id")
    Long optionId;
    @Column(name = "purchase_order_id")
    Long purchaseOrderId;
}
