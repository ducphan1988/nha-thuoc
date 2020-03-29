package com.tinhoc.nhathuoc.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "loai_dich_vu")
public class LoaiDichVu {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_loai_dich_vu")
    private int idLoaiDichVu;

    @Column(name = "ten_loai_dich_vu")
    private String tenLoaiDichVu;

    @OneToMany(targetEntity = DichVu.class)
    private List<DichVu> listDichVu;

    public LoaiDichVu() {
    }

    public LoaiDichVu(String tenLoaiDichVu, List<DichVu> listDichVu) {
        this.tenLoaiDichVu = tenLoaiDichVu;
        this.listDichVu = listDichVu;
    }

    public int getIdLoaiDichVu() {
        return idLoaiDichVu;
    }

    public void setIdLoaiDichVu(int idLoaiDichVu) {
        this.idLoaiDichVu = idLoaiDichVu;
    }

    public String getTenLoaiDichVu() {
        return tenLoaiDichVu;
    }

    public void setTenLoaiDichVu(String tenLoaiDichVu) {
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public List<DichVu> getListDichVu() {
        return listDichVu;
    }

    public void setListDichVu(List<DichVu> listDichVu) {
        this.listDichVu = listDichVu;
    }
}
