package com.tinhoc.nhathuoc.service;

import com.tinhoc.nhathuoc.entity.HopDong;

public interface HopDongService {
    Iterable<HopDong> getAllHopDong();

    HopDong getHopDong(Long IdHopDong);

    void saveHopDong(HopDong hopDong);

    void deleteHopDong(Long idHopDong);

    Iterable<HopDong> findAllByIdKhachHang(Long id);
}
