package com.tinhoc.nhathuoc.service;

import com.tinhoc.nhathuoc.entity.LoaiKhach;

public interface LoaiKhachService {
    Iterable<LoaiKhach> getAllLoaiKhach();

    LoaiKhach getLoaiKhach(Long idLoaiKhach);

    void saveLoaiKhach(LoaiKhach loaiKhach);

    void deleteLoaiKhach(Long idLoaiKhach);


}
