package org.example.controller;

import org.example.pojo.Student;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/welcome") // 公共请求路径
public class welcomeController {

    @RequestMapping("/welcome")  // 映射到这个路径
    public String showWelcome() {
            return "welcome/welcome"; // 或者重定向到一个错误页
    }

    // 其他控制器方法...
}