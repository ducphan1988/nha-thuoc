package com.tinhoc.nhathuoc.service;

import com.tinhoc.nhathuoc.entity.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface KhachHangService {
    Page<KhachHang> getAllKhachHang(Pageable pageable);

    KhachHang getKhachHang(Long IdKhachHang);

    void saveKhachHang(KhachHang khachHang);

    void deleteKhachHang(Long idKhachHang);

    Page<KhachHang> findAllByHoTenContaining(String name, Pageable pageable);
}
