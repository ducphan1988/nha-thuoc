package com.tinhoc.nhathuoc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecutityController {

    @GetMapping("/admin")
    public String getAdminPage(){
        return "security/admin";
    }

    @GetMapping("/403")
    public String get403Page(){
        return "security/403";
    }

    @GetMapping("/review")
    public String getReviewPage(){
        return "dichvu/review";
    }
}
