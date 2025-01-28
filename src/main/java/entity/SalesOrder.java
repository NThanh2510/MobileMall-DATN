package entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "sales_orders")
@Data
public class SalesOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sales_order_id")
    private Integer salesOrderId;

    @Column(name = "total_price")
    private Double totalPrice;

    @Column(name = "status")
    private String status;

    @Temporal(TemporalType.DATE)
    @Column(name = "order_date")
    private Date orderDate;

    @Column(name = "user_name")
    private String userName; // Chỉ lưu ID của bảng `accounts`
}
