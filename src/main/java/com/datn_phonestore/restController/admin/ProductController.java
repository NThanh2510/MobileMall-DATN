package com.datn_phonestore.restController.admin;

import com.datn_phonestore.dto.ApiResponse;
import com.datn_phonestore.dto.admin.products.option.request.OptionRequest;
import com.datn_phonestore.dto.admin.products.request.CreateProductRequest;
import com.datn_phonestore.dto.admin.products.response.OptionResponse;
import com.datn_phonestore.dto.admin.products.response.ProductResponseInfo;
import com.datn_phonestore.dto.admin.voucher.request.CreateVoucherRequest;
import com.datn_phonestore.dto.admin.voucher.response.VoucherResponse;
import com.datn_phonestore.entity.Product;
import com.datn_phonestore.services.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping ("/product")
public class ProductController {
    @Autowired
     ProductService productService;


    @PutMapping("/create")
    public ApiResponse<ProductResponseInfo> createVoucher(@RequestBody @Valid CreateProductRequest request) {
        return ApiResponse.<ProductResponseInfo>builder()
                .result(productService.create(request))
                .message("success")
                .build();
    }

    @GetMapping("/list")
    public ResponseEntity<List<Product>> getAllProducts() {
        List<Product> products = productService.getAllProduct();
        return ResponseEntity.ok(products);
    }

    @PutMapping("/createoption")
    public ApiResponse<OptionResponse> createVoucher(@RequestBody @Valid OptionRequest request) {
        return ApiResponse.<OptionResponse>builder()
                .result(productService.createOptionProduct(request))
                .message("success")
                .build();
    }


}
