package com.tinhoc.nhathuoc.service.serviceImpl;

import com.tinhoc.nhathuoc.entity.HopDong;
import com.tinhoc.nhathuoc.repository.HopDongRepository;
import com.tinhoc.nhathuoc.service.HopDongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HopDongServiceImpl implements HopDongService {
    @Autowired
    HopDongRepository hopDongRepository;

    @Override
    public Iterable<HopDong> getAllHopDong() {
        return hopDongRepository.findAll();
    }

    @Override
    public HopDong getHopDong(Long IdHopDong) {
        return hopDongRepository.findById(IdHopDong).orElse(null);
    }

    @Override
    public void saveHopDong(HopDong hopDong) {
        hopDongRepository.save(hopDong);
    }

    @Override
    public void deleteHopDong(Long idHopDong) {
        hopDongRepository.deleteById(idHopDong);
    }

    @Override
    public Iterable<HopDong> findAllByIdKhachHang(Long id) {
        return hopDongRepository.findAllByIdKhachHang(id);
    }

}
