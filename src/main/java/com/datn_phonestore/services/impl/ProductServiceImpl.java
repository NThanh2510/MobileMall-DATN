package com.datn_phonestore.services.impl;

import com.datn_phonestore.dto.admin.products.request.CreateProductRequest;
import com.datn_phonestore.dto.admin.products.response.ProductResponseInfo;
import com.datn_phonestore.entity.Product;
import com.datn_phonestore.entity.TechnicalSpec;
import com.datn_phonestore.reponsitory.ProductRepository;
import com.datn_phonestore.reponsitory.TechnicalSpecRepository;
import com.datn_phonestore.services.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
     ProductRepository productRepository;
    @Autowired
    TechnicalSpecRepository technicalSpecRepository;

    @Override
    public ProductResponseInfo create(CreateProductRequest request) {
        Product product = new Product();
        product.setName(request.getName());
        product.setBasePrice(request.getBasePrice());
        product.setMainImage(request.getMainImg());
        product.setCreatedDate(LocalDate.now());
        product.setWarranty(request.getWarranty());
        product.setSubCategoryId(request.getSubCategoryId());
        productRepository.save(product);

        Long Product_id = product.getProductId();
        TechnicalSpec technicalSpec = new TechnicalSpec();
        technicalSpec.setProductId(Product_id);
        technicalSpec.setScreenSize(request.getScreenSize());
        technicalSpec.setScreenResolution(request.getScreenResolution());
        technicalSpec.setProcessor(request.getProcessor());
        technicalSpec.setRearCamera(request.getRearCamera());
        technicalSpec.setFrontCamera(request.getFrontCamera());
        technicalSpec.setBattery(request.getBattery());
        technicalSpec.setFastCharging(request.isFastCharging());
        technicalSpec.setWaterResistance(request.isWater_resistance());
        technicalSpec.setOsId(request.getOs());
        technicalSpec.setDesign(request.getDesign());
        technicalSpec.setMaterial(request.getMaterial());
        technicalSpec.setWeight(request.getWeight());
        technicalSpec.setBatteryType(request.getBatteryType());
        technicalSpec.setSim(request.getSim());
        technicalSpec.setWifi(request.getWifi());
        technicalSpec.setGps(request.getGps());
        technicalSpec.setNfc(request.isNfc());
        technicalSpecRepository.save(technicalSpec);

        log.info("info: {}", technicalSpec);

        return null;
    }

    @Override
    public List<Product> getAllProduct() {
    var products = productRepository.findAll();
    return  products;
    }
}
