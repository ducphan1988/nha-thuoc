package com.tinhoc.nhathuoc.service.serviceImpl;

import com.tinhoc.nhathuoc.entity.DichVu;
import com.tinhoc.nhathuoc.repository.DichVuRepository;
import com.tinhoc.nhathuoc.service.DichVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DichVuServiceImpl implements DichVuService {

    @Autowired
    DichVuRepository dichVuRepository;

    @Override
    public Iterable<DichVu> getAllDichVu() {
        return dichVuRepository.findAll();
    }

    @Override
    public DichVu getDichVu(Long idDichVu) {
        return dichVuRepository.findById(idDichVu).orElse(null);
    }

    @Override
    public void saveDichVu(DichVu dichVu) {
        dichVuRepository.save(dichVu);
    }

    @Override
    public void deleteDichVu(Long idDichVu) {
        dichVuRepository.deleteById(idDichVu);
    }

    @Override
    public Iterable<DichVu> findAllByChiPhiThueBetween(Integer fromPrice, Integer toPrice) {
        return dichVuRepository.findAllByChiPhiThueBetween(fromPrice,toPrice);
    }

}
