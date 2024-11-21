package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

//    @RequestMapping(value = "/hien-thi", method = RequestMethod.GET)
    @GetMapping("/hien-thi")
    public String hienThi(
//            @RequestParam("username") String username,
            @RequestParam("y") int y,
            Model model){
        int x = 1 + y;
        // java 4 => Các request lấy được giá trị sẽ có kiểu String => part
        // java 5 thì có thể gắn kiểu dữ liệu mặc định cho biến request đó
//        model.addAttribute("fullname", username);
        model.addAttribute("age", x);
        return "index";
    }

    // Ví dụ pathvariable
    @GetMapping("/hien-thi1/{y}")
    public String hienThi1(
            @PathVariable("y") int y,
            Model model){
        int x = 1 + y;
        model.addAttribute("age", x);
        return "index";
    }
    // ==> So sánh request param vs path variable
    // request: phân trang, các yêu cầu muốn hiển thị thông tin lên url
    // path khi xóa, update, che dấu thông tin




//    @RequestMapping("/index.php")
//    public String index(Model model){
//        model.addAttribute("message", "Chao mung e den voi nha cua bon anh !!!");
//        return "index";
//    }
}
