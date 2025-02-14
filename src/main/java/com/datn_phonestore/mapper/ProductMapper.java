package com.datn_phonestore.mapper;

import com.datn_phonestore.dto.admin.products.response.ProductResponseInfo;
import com.datn_phonestore.dto.user.response.UserResponse;
import com.datn_phonestore.entity.Product;
import com.datn_phonestore.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    ProductResponseInfo toProductResponseInfo(Product product);
}
