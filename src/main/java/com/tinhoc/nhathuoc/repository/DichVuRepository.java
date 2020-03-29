package com.tinhoc.nhathuoc.repository;

import com.tinhoc.nhathuoc.entity.DichVu;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DichVuRepository extends PagingAndSortingRepository<DichVu,Long> {

    Iterable<DichVu> findAllByChiPhiThueBetween(Integer fromPrice, Integer toPrice);
}
