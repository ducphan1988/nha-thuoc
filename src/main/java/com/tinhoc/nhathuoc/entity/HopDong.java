package com.tinhoc.nhathuoc.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "hop_dong")
public class HopDong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_hop_dong")
    private Long idHopDong;

    @Column(name = "ngay_bat_dau")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayBatDau;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngay_ket_thuc")
    private Date ngayKetThuc;

    @Column(name = "tien_dat_coc")
    private double tienDatCoc;

    @Column(name = "tong_tien")
    private double tongTien;

    @Column(name = "id_khach_hang")
    private Long idKhachHang;

    @Column(name = "id_dich_vu")
    private Long IdDichVu;

    @Column(name = "id_nhan_vien")
    private Long IdNhanVien;



    public HopDong() {
    }

    public Long getIdHopDong() {
        return idHopDong;
    }

    public void setIdHopDong(Long idHopDong) {
        this.idHopDong = idHopDong;
    }

    public Date getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public double getTienDatCoc() {
        return tienDatCoc;
    }

    public void setTienDatCoc(double tienDatCoc) {
        this.tienDatCoc = tienDatCoc;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public Long getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(Long idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public Long getIdDichVu() {
        return IdDichVu;
    }

    public void setIdDichVu(Long idDichVu) {
        IdDichVu = idDichVu;
    }

    public Long getIdNhanVien() {
        return IdNhanVien;
    }

    public void setIdNhanVien(Long idNhanVien) {
        IdNhanVien = idNhanVien;
    }
}
