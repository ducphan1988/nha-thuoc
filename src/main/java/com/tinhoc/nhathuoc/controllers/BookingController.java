package com.tinhoc.nhathuoc.controllers;

import com.tinhoc.nhathuoc.entity.DichVu;
import com.tinhoc.nhathuoc.entity.HopDong;
import com.tinhoc.nhathuoc.service.DichVuService;
import com.tinhoc.nhathuoc.service.HopDongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;

@Controller
public class BookingController {

    @Autowired
    DichVuService dichVuService;

    @Autowired
    HopDongService hopDongService;

    @GetMapping("booking/{id}")
    public ModelAndView getBookingPage(@PathVariable(value = "id") Long id) {
        ModelAndView modelAndView = new ModelAndView("dichvu/booking");
        DichVu furamaDichVu = dichVuService.getDichVu(id);
        modelAndView.addObject("dichvu", furamaDichVu);
        return modelAndView;

    }

    @PostMapping("booking")
    public ModelAndView saveBooking(@RequestParam(value = "idDichVu") Long idDichVu, @RequestParam(value = "ngaybatdau") Date ngaybatdau
            , @RequestParam(value = "ngayketthuc") Date ngayketthuc, HttpServletRequest request, HttpServletResponse response) {
        HopDong furamaHopDong = new HopDong();
        furamaHopDong.setIdDichVu(idDichVu);
        furamaHopDong.setNgayBatDau(ngaybatdau);
        furamaHopDong.setNgayKetThuc(ngayketthuc);
        furamaHopDong.setIdKhachHang((long) 1);
        furamaHopDong.setIdNhanVien((long) 1);
        hopDongService.saveHopDong(furamaHopDong);
         Iterable<HopDong> listHopDong = hopDongService.findAllByIdKhachHang((long) 1);
          for (HopDong hopdong : listHopDong){
              String cookieValue = hopdong.getIdHopDong() + "_" + hopdong.getIdDichVu() + "_" + hopdong.getNgayBatDau() +
                      "_" + hopdong.getNgayKetThuc();
              Cookie cookie = new Cookie("hopdong" + hopdong.getIdHopDong(),cookieValue);
              cookie.setMaxAge(60*60);
              cookie.setPath("/history");
              response.addCookie(cookie);
          }

        ModelAndView modelAndView = new ModelAndView("dichvu/booking-success");
        return modelAndView;
    }
}
