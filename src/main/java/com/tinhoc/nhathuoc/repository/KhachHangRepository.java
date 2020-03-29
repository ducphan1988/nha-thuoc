package com.tinhoc.nhathuoc.repository;

import com.tinhoc.nhathuoc.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KhachHangRepository extends JpaRepository<KhachHang, Long> {
    Page<KhachHang> findAllByHoTenContaining(String firstname, Pageable pageable);
}
