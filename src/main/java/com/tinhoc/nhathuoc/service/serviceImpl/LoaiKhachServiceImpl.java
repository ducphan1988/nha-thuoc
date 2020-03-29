package com.tinhoc.nhathuoc.service.serviceImpl;

import com.tinhoc.nhathuoc.entity.LoaiKhach;
import com.tinhoc.nhathuoc.repository.LoaiKhachRepository;
import com.tinhoc.nhathuoc.service.LoaiKhachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoaiKhachServiceImpl implements LoaiKhachService {

    @Autowired
    LoaiKhachRepository loaiKhachRepository;

    @Override
    public Iterable<LoaiKhach> getAllLoaiKhach() {
        return loaiKhachRepository.findAll();
    }

    @Override
    public LoaiKhach getLoaiKhach(Long idLoaiKhach) {
        return loaiKhachRepository.findById(idLoaiKhach).orElse(null);
    }

    @Override
    public void saveLoaiKhach(LoaiKhach loaiKhach) {
        loaiKhachRepository.save(loaiKhach);
    }

    @Override
    public void deleteLoaiKhach(Long idLoaiKhach) {
        loaiKhachRepository.deleteById(idLoaiKhach);
    }
}
