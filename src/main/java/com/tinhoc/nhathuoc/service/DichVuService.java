package com.tinhoc.nhathuoc.service;

import com.tinhoc.nhathuoc.entity.DichVu;

public interface DichVuService {

    Iterable<DichVu> getAllDichVu();

    DichVu getDichVu(Long idDichVu);

    void saveDichVu(DichVu dichVu);

    void deleteDichVu(Long idDichVu);

    Iterable<DichVu> findAllByChiPhiThueBetween(Integer fromPrice, Integer toPrice);
}
