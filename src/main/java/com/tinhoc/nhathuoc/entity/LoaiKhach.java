package com.tinhoc.nhathuoc.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "loai_khach")
public class LoaiKhach {

    @Id
    @Column(name = "id_loai_khach")
    private Long idLoaiKhach;

    @Column(name = "ten_loai_khach")
    private String tenLoaiKhach;

    @OneToMany(targetEntity = KhachHang.class)
    private List<KhachHang> khachHangList;

    public LoaiKhach() {
    }

    public Long getIdLoaiKhach() {
        return idLoaiKhach;
    }

    public void setIdLoaiKhach(Long idLoaiKhach) {
        this.idLoaiKhach = idLoaiKhach;
    }

    public String getTenLoaiKhach() {
        return tenLoaiKhach;
    }

    public void setTenLoaiKhach(String tenLoaiKhach) {
        this.tenLoaiKhach = tenLoaiKhach;
    }

    public List<KhachHang> getKhachHangList() {
        return khachHangList;
    }

    public void setKhachHangList(List<KhachHang> khachHangList) {
        this.khachHangList = khachHangList;
    }
}
