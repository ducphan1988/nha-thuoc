package com.tinhoc.nhathuoc.service.serviceImpl;

import com.tinhoc.nhathuoc.entity.KhachHang;
import com.tinhoc.nhathuoc.repository.KhachHangRepository;
import com.tinhoc.nhathuoc.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class KhachHangServiceImpl implements KhachHangService {

    @Autowired
    KhachHangRepository khachHangRepository;

    @Override
    public Page<KhachHang> getAllKhachHang(Pageable pageable) {
        return khachHangRepository.findAll(pageable);
    }

    @Override
    public KhachHang getKhachHang(Long IdKhachHang) {
        return khachHangRepository.findById(IdKhachHang).orElse(null);
    }

    @Override
    public void saveKhachHang(KhachHang khachHang) {
        khachHangRepository.save(khachHang);
    }

    @Override
    public void deleteKhachHang(Long idKhachHang) {
        khachHangRepository.deleteById(idKhachHang);
    }

    @Override
    public Page<KhachHang> findAllByHoTenContaining(String name, Pageable pageable) {
        return khachHangRepository.findAllByHoTenContaining(name,pageable);
    }


}
