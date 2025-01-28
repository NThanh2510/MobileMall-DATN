package entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "promotion_details")
public class PromotionDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "promotion_detail_id")
    Long promotionDetailId;
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

}