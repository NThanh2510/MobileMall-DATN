package com.datn_phonestore.reponsitory;

import com.datn_phonestore.entity.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VoucherRepository extends JpaRepository<Voucher,Long> {


    //    Optional<Voucher> findAllBy();
}
