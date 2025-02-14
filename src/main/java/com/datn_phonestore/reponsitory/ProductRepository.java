package com.datn_phonestore.reponsitory;

import com.datn_phonestore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
//    @Query("select new com.datn_phonestore.dto.")
//    Optional<Product> findById(Long aLong);
}
