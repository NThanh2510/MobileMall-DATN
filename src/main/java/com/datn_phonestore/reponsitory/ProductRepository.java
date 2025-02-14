package com.datn_phonestore.reponsitory;

import com.datn_phonestore.dto.admin.products.response.ProductResponseInfo;
import com.datn_phonestore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
//    @Query("select new com.datn_phonestore.dto.")
//    Optional<Product> findById(Long aLong);
//    @Query("SELECT new com.datn_phonestore.dto.admin.products.response.ProductResponseInfo(" +
//            ")" +
//            "FROM Product p " +
//            " JOIN ProductImage pi ON p.productId = pi.productId" +
//            " JOIN TechnicalSpec ts on p.productId = ts.productId" +
//            " JOIN ProductOption po on p.productId = po.productId" +
//            " WHERE p.productId = ?1 ")
//    ProductResponseInfo findByNameId(Long id);
}
