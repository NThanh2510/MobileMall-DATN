package com.datn_phonestore.services;

import com.datn_phonestore.dto.admin.products.request.CreateProductRequest;
import com.datn_phonestore.dto.admin.products.response.ProductResponseInfo;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.entity.Product;

import java.util.List;

public interface ProductService {
    public ProductResponseInfo create(CreateProductRequest request);
    List<Product> getAllProduct();

}
