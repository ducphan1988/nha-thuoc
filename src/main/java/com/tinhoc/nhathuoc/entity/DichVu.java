package com.tinhoc.nhathuoc.entity;

import javax.persistence.*;

@Entity
@Table(name = "dich_vu")
public class DichVu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_dich_vu")
    private Long idDichVu;

    @Column(name = "ten_dich_vu")
    private String tenDichVu;

    @Column(name = "dien_tich_su_dung")
    private int dienTichSuDung;

    @Column(name = "chi_phi_thue")
    private double chiPhiThue;

    @Column(name = "so_tang")
    private int soTang;

    @Column(name = "so_nguoi_toi_da")
    private int soNguoiToiDa;

    @Column(name = "trang_thai")
    private String trangThai;

    @ManyToOne
    @JoinColumn(name = "id_loai_dich_vu")
    private LoaiDichVu loaiDichVu;

    @Column(name = "id_kieu_thue")
    private int idKieuThue;



    public DichVu() {
    }

    public DichVu(String tenDichVu, int dienTichSuDung, double chiPhiThue, int soTang, int soNguoiToiDa, String trangThai, LoaiDichVu loaiDichVu, int idKieuThue) {
        this.tenDichVu = tenDichVu;
        this.dienTichSuDung = dienTichSuDung;
        this.chiPhiThue = chiPhiThue;
        this.soTang = soTang;
        this.soNguoiToiDa = soNguoiToiDa;
        this.trangThai = trangThai;
        this.loaiDichVu = loaiDichVu;
        this.idKieuThue = idKieuThue;
    }

    public Long getIdDichVu() {
        return idDichVu;
    }

    public void setIdDichVu(Long idDichVu) {
        this.idDichVu = idDichVu;
    }

    public String getTenDichVu() {
        return tenDichVu;
    }

    public void setTenDichVu(String tenDichVu) {
        this.tenDichVu = tenDichVu;
    }

    public int getDienTichSuDung() {
        return dienTichSuDung;
    }

    public void setDienTichSuDung(int dienTichSuDung) {
        this.dienTichSuDung = dienTichSuDung;
    }

    public double getChiPhiThue() {
        return chiPhiThue;
    }

    public void setChiPhiThue(double chiPhiThue) {
        this.chiPhiThue = chiPhiThue;
    }

    public int getSoTang() {
        return soTang;
    }

    public void setSoTang(int soTang) {
        this.soTang = soTang;
    }

    public int getSoNguoiToiDa() {
        return soNguoiToiDa;
    }

    public void setSoNguoiToiDa(int soNguoiToiDa) {
        this.soNguoiToiDa = soNguoiToiDa;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public LoaiDichVu getLoaiDichVu() {
        return loaiDichVu;
    }

    public void setLoaiDichVu(LoaiDichVu loaiDichVu) {
        this.loaiDichVu = loaiDichVu;
    }

    public int getIdKieuThue() {
        return idKieuThue;
    }

    public void setIdKieuThue(int idKieuThue) {
        this.idKieuThue = idKieuThue;
    }
}
