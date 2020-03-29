package com.tinhoc.nhathuoc.repository;

import com.tinhoc.nhathuoc.entity.HopDong;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface HopDongRepository extends PagingAndSortingRepository<HopDong, Long> {

    Iterable<HopDong> findAllByIdKhachHang(Long id);
}
