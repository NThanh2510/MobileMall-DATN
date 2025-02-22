package com.datn_phonestore.reponsitory;

import com.datn_phonestore.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = "select * from product p where p.product_price = (select MIN(p.product_price) from product p)" , nativeQuery = true)
    Product findByKeywordsBySQL();


    @Query(value = "select * from product p where p.product_id not in (select i.product_id from inventory i where i.quantity = 0) and p.product_price not in (select min(p.product_price) from product p)" , nativeQuery = true)
    List<Product> findByKeywordsAllBySQL();

    @Query(value = "select * from product p where p.product_name like %?1%" , nativeQuery = true)
    List<Product> findByKeywordsAllBySQL(String name);
}
