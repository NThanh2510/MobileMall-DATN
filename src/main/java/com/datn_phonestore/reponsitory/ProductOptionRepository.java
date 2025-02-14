package com.datn_phonestore.reponsitory;

import com.datn_phonestore.entity.ProductOption;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductOptionRepository extends JpaRepository<ProductOption, Integer> {
    
}
