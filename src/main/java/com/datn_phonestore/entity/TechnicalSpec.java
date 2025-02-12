package com.datn_phonestore.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "technical_specs")
@Data
public class TechnicalSpec {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "technical_specs_id")
    private Integer technicalSpecsId;

    @Column(name = "screen_size")
    private String screenSize;

    @Column(name = "screen_resolution")
    private String screenResolution;

    @Column(name = "processor")
    private String processor;

    @Column(name = "rear_camera")
    private String rearCamera;

    @Column(name = "front_camera")
    private String frontCamera;

    @Column(name = "battery")
    private String battery;

    @Column(name = "fast_charging")
    private Boolean fastCharging;

    @Column(name = "water_resistance")
    private Boolean waterResistance;

    @Temporal(TemporalType.DATE)
    @Column(name = "release_date")
    private Date releaseDate;

    @Column(name = "product_id")
    private Integer productId; // Chỉ lưu trữ ID của `Product`

    @Column(name = "os")
    private Integer osId; // Chỉ lưu trữ ID của `OS`

    @Column(name = "connectivity")
    private Integer connectivityId; // Chỉ lưu trữ ID của `Connectivity`
}
