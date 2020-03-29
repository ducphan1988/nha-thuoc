package com.tinhoc.nhathuoc.entity;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.Date;


@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_khach_hang")
    private Long idKhachHang;

    @NotEmpty(message = "Khong được để trống")
    @Column(name = "ho_ten")
    private String hoTen;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @Column(name = "gioi_tinh")
    private boolean gioiTinh;

    @NotEmpty(message = "vui lòng điền thông tin cmnd")
    @Column(name = "so_cmnd")
    private String soCMND;

    @NotEmpty(message = "vui lòng điền thông tin sdt")
    @Column(name = "so_dt")
    private String soDT;

    @NotEmpty(message = "vui lòng điền thông tin email")
    @Pattern(regexp = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$", message = "Email chưa đúng định dạng")
    @Column(name = "email")
    private String email;

    @ManyToOne(targetEntity = LoaiKhach.class)
    @JoinColumn(name = "id_loai_khach")
    private LoaiKhach loaiKhach;

    @NotEmpty(message = "vui lòng điền thông tin địa chỉ")
    @Column(name = "dia_chi")
    private String diaChi;

    public KhachHang() {
    }

    public Long getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(Long idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getSoCMND() {
        return soCMND;
    }

    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LoaiKhach getLoaiKhach() {
        return loaiKhach;
    }

    public void setLoaiKhach(LoaiKhach loaiKhach) {
        this.loaiKhach = loaiKhach;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
