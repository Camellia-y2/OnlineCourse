package org.example.controller;

import org.example.pojo.Manager;
import org.example.pojo.Student;
import org.example.service.ManagerService;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class loginController {
    @Autowired
    private StudentService studentServiceImpl;
    @Autowired
    private ManagerService managerServiceImpl;
    // 学生登录
    @RequestMapping("/tologin")
    public String loginStudent(String account, String pwd, String person,
                               Model model, HttpSession session) {
        // 判断用户角色并进行验证
        if (person.equals("0")) { // 学生
            Student student = studentServiceImpl.findStudentBySno(account);
            if (student != null && student.getSpwd().equals(pwd)) {
                session.setAttribute("sno", account);
                session.setAttribute("sname", student.getSname());
                return "student/studentIndex"; // 重定向到学生主页
            } else {
                model.addAttribute("msg", "账号或密码不正确，登录失败!");
                return "../../index"; // 返回到登录页面
            }
        } else if (person.equals("1")) { // 管理员
            Manager manager = managerServiceImpl.findManagerByMname(account);
            if (manager!=null&&manager.getMpwd().equals(pwd)) {
                session.setAttribute("mname", account);
                return "manager/managerIndex"; // 重定向到管理员主页
            } else {
                model.addAttribute("msg", "账号或密码不正确，登录失败!");
                return "../../index"; // 返回到登录页面
            }
        }

        return "../../index"; // 返回到登录页面
    }
    //注册
    @RequestMapping("/toregister")
    public String register(String account, String sname, String pwd, String pwd2,
                           Model model, HttpSession session) {
        Student student = new Student();
        Student s = new Student();
        student.setSno(account);
        student.setSname(sname);
        student.setSpwd(pwd);
        model.addAttribute("student", student);
        if (pwd == null || pwd.isEmpty() || sname == null || sname.isEmpty() || account == null || account.isEmpty()) {
            model.addAttribute("msg", "账号和密码错误！");
            return "../../register"; // 返回到注册页面
        }

        s=studentServiceImpl.findStudentBySno(account);
        if(s != null){
            model.addAttribute("msg", "账号已存在,请重新注册!");
            return "../../register"; // 返回到注册页面
        }
        int result = studentServiceImpl.addStudent(student);
        System.out.println("result:"+result);
        if(result>0){
            model.addAttribute("msg", "注册成功！");
            return "../../register"; // 返回到注册页面
        }else{
            model.addAttribute("msg", "注册失败！");
            return "../../register"; // 返回到注册页面
        }

    }

    // 学生退出登录
    @RequestMapping("/studentLogout")
    public String studentLogout(HttpSession session) {
        session.invalidate(); // 使session失效，等同于完全移除session
        return "redirect:index"; // 返回到登录页面
    }

    // 管理员退出登录
    @RequestMapping("/adminlogout")
    public String adminLogout(HttpSession session) {
        session.invalidate(); // 使session失效，等同于完全移除session
        return "redirect:index";
    }
}
//package org.example.controller;
//
//import org.example.pojo.Manager;
//import org.example.pojo.Student;
//import org.example.service.ManagerService;
//import org.example.service.StudentService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class loginController {
//    @Autowired
//    private StudentService studentServiceImpl;
//    @Autowired
//    private ManagerService managerServiceImpl;
//    // 学生登录
//    @RequestMapping("/tologin")
//    public String loginStudent(String account, String pwd, String person,
//                               Model model, HttpSession session) {
//        // 判断用户角色并进行验证
//        if (person.equals("0")) { // 学生
//            Student student = studentServiceImpl.findStudentBySno(account);
//            if (student != null && student.getSpwd().equals(pwd)) {
//                session.setAttribute("sno", account);
//                session.setAttribute("sname", student.getSname());
//                return "student/studentIndex"; // 重定向到学生主页
//            } else {
//                model.addAttribute("msg", "账号或密码不正确，登录失败!");
//                return "../../index"; // 返回到登录页面
//            }
//        } else if (person.equals("1")) { // 管理员
//            Manager manager = managerServiceImpl.findManagerByMname(account);
//            if (manager != null && manager.getMpwd().equals(pwd)) {
//                session.setAttribute("mname", account);
//                return "manager/managerIndex"; // 重定向到管理员主页
//            } else {
//                model.addAttribute("msg", "账号或密码不正确，登录失败!");
//                return "../../index"; // 返回到登录页面
//            }
//        }
//
//        return "../../index"; // 返回到登录页面
//    }
//    //注册
//    @RequestMapping("/toregister")
//    public String register(String account, String sname, String pwd, String pwd2,
//                           Model model, HttpSession session) {
//        Student student = new Student();
//        Student s = new Student();
//        student.setSno(account);
//        student.setSname(sname);
//        student.setSpwd(pwd);
//        model.addAttribute("student", student);
//        if (pwd == null || pwd.isEmpty() || sname == null || sname.isEmpty() || account == null || account.isEmpty()) {
//            model.addAttribute("msg", "账号和密码错误！");
//            return "../../register"; // 返回到注册页面
//        }
//
//        s=studentServiceImpl.findStudentBySno(account);
//        if(s != null){
//            model.addAttribute("msg", "账号已存在,请重新注册!");
//            return "../../register"; // 返回到注册页面
//        }
//        int result = studentServiceImpl.addStudent(student);
//        System.out.println("result:"+result);
//        if(result>0){
//            model.addAttribute("msg", "注册成功！");
//            return "../../register"; // 返回到注册页面
//        }else{
//            model.addAttribute("msg", "注册失败！");
//            return "../../register"; // 返回到注册页面
//        }
//
//    }
//
//    // 学生退出登录
//    @RequestMapping("/studentLogout")
//    public String studentLogout(HttpSession session) {
//        session.invalidate(); // 使session失效，等同于完全移除session
//        return "redirect:index"; // 返回到登录页面
//    }
//
//    // 管理员退出登录
//    @RequestMapping("/adminlogout")
//    public String adminLogout(HttpSession session) {
//        session.invalidate(); // 使session失效，等同于完全移除session
//        return "redirect:index";
//    }
//}