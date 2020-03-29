package com.tinhoc.nhathuoc.controllers;

import com.tinhoc.nhathuoc.entity.KhachHang;
import com.tinhoc.nhathuoc.entity.LoaiKhach;
import com.tinhoc.nhathuoc.service.KhachHangService;
import com.tinhoc.nhathuoc.service.LoaiKhachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class KhachHangController {
    @Autowired
    KhachHangService khachHangService;

    @Autowired
    LoaiKhachService loaiKhachService;

    @ModelAttribute("listLoaiKhach")
    public Iterable<LoaiKhach> getListLoaiKhach() {
        return loaiKhachService.getAllLoaiKhach();
    }


    @GetMapping("/dangkykhachhang")
    public String getTrangDangKy(Model model) {
        model.addAttribute("khachhang", new KhachHang());
        return "khachhang/dang-ky";
    }

    @PostMapping("/dangky")
    public String saveKhachHang(@Valid @ModelAttribute("khachhang") KhachHang furamaKhachHang, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "khachhang/dang-ky";
        } else {
            khachHangService.saveKhachHang(furamaKhachHang);
            return "khachhang/dang-ky-thanh-cong";
        }


    }
}
