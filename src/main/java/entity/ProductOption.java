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
@Table(name = "product_options")
public class ProductOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "option_id")
    Long optionId;
    String color;
    @Column(name = "color_price_adjustment")
    BigDecimal colorPriceAdjustment;
    @Column(name = "storage_ram")
    String storageRam;
    @Column(name = "storage_price_adjustment")
    BigDecimal storagePriceAdjustment;
    Integer quantity;
    @Column(name = "final-price")
    BigDecimal finalPrice;
    @Column(name = "product_id")
    Long productId;


}
