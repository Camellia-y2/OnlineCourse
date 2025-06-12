package org.example.controller;
import org.example.mapper.CourseDao;
import org.example.pojo.Course;
import org.example.pojo.Student;
import org.example.pojo.StudentGrade;
import org.example.service.CourseService;
import org.example.service.StudentGradeService;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/student") // 公共请求路径
public class studentController {

    @Autowired
    private StudentService studentService;

    //退出主页面
    @RequestMapping("/toIndex")
    public String toIndex() {
        return "redirect:/index.jsp";
    }
    @RequestMapping("/showStuInfo")  // 映射到这个路径
    public String showStudentInfo(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号
        Student student = studentService.findStudentBySno(sno); // 通过服务获取学生信息
            model.addAttribute("student", student); // 将学生对象放入模型中
            return "student/showStuInfo"; // 返回 JSP 文件路径
    }

    @RequestMapping("/infoUpdate")
    public String infoUpdate(HttpSession session, Model model) {
        String sno = (String) session.getAttribute("sno");
        if (sno != null) {
            Student student = studentService.findStudentBySno(sno);
            if (student != null) {
                // 将学生信息添加到模型中，以便在 JSP 页面中访问
                model.addAttribute("student", student);
            } else {
                // 如果没有找到学生信息，可以选择添加一个错误消息
                model.addAttribute("errorMsg", "未找到学生信息");
            }
        } else {
            model.addAttribute("errorMsg", "请登录后再进行修改");
        }
        // 返回修改个人信息页面
        return "student/infoUpdate"; // 返回 infoUpdate.jsp 页面
    }

    @RequestMapping("/infoDoUpdate")
    public String infoDoUpdate(HttpSession session, Model model,
                               @RequestParam("sname") String sname,
                               @RequestParam("spwd") String spwd) {
        String sno = (String) session.getAttribute("sno"); // 获取学号

        // 根据学号从数据库获取学生信息
        Student student = studentService.findStudentBySno(sno);

        if (student != null) {
            // 确保密码不为空
            if (spwd != null && !spwd.trim().isEmpty()) {
                student.setSpwd(spwd); // 设置新的密码
            } else {
                model.addAttribute("errorMsg", "密码不能为空");
                return "student/infoUpdate"; // 返回错误信息
            }

            // 调用更新方法
            try {
                studentService.updateStudent(student); // 更新学生信息
                model.addAttribute("student", student); // 添加到模型用于显示
            } catch (DataIntegrityViolationException e) {
                model.addAttribute("errorMsg", "数据库操作失败: " + e.getMessage());
                return "student/infoUpdate"; // 返回错误信息
            }
        } else {
            model.addAttribute("errorMsg", "未找到学生信息");
        }
        return "student/infoUpdate"; // 返回更新后的 JSP 名称
    }

    //跳转总成绩单页面stuAllScore.jsp
    @Autowired
    private StudentGradeService studentGradeService;
    @RequestMapping("/getStuAllScore")
    public String getStuAllScores(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号
        List<StudentGrade> studentGrade= studentGradeService. findStudentGradeBySno(sno);
        model.addAttribute("studentGrade", studentGrade); // 将学生对象放入模型中
        // 返回成绩页面
        return "student/stuAllScore"; // 返回 JSP 页面名称
    }

    //跳转查询成绩页面stuRequireScore.jsp
    @RequestMapping("/getStuRequireScore")
    public String getStuRequireScore(HttpServletRequest request, Model model) {
        return "student/stuRequireScore"; // 返回 JSP 页面名称
    }

    @RequestMapping("/stuRequireScoreByCno")
    public String stuRequireScoreByCno(HttpServletRequest request, Model model) {
        String cno = request.getParameter("cno"); // 获取课程编号
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号

        StudentGrade studentGrade = new StudentGrade();
        studentGrade.setSno(sno);
        studentGrade.setCno(cno);

        List<StudentGrade> scoreList = studentGradeService.findStudentGradeByCno(studentGrade); // 根据课程编号查询
        model.addAttribute("scoreList", scoreList); // 将成绩列表添加到模型中
        return "student/stuRequireScore"; // 返回 JSP 页面名称
    }

    @RequestMapping("/stuRequireScoreByCname")
    public String stuRequireScoreByCname(HttpServletRequest request, Model model) {
        String cname = request.getParameter("cname"); // 获取课程名
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号

        StudentGrade studentGrade = new StudentGrade();
        studentGrade.setSno(sno);
        studentGrade.setCname(cname);
        List<StudentGrade> scoreList = studentGradeService.findStudentGradeByCname(studentGrade); // 根据课程名查询
        model.addAttribute("scoreList", scoreList); // 将成绩列表添加到模型中
        return "student/stuRequireScore"; // 返回 JSP 页面名称
    }

    // 查询所有成绩
    @RequestMapping("/stuRequireAllScores")
    public String stuRequireAllScores(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号
        List<StudentGrade> scoreList = studentGradeService.findStudentAllGrades(sno); // 查询所有成绩
        model.addAttribute("scoreList", scoreList); // 将成绩列表添加到模型中
        return "student/stuRequireScore"; // 返回 JSP 页面名称
    }

    // 查询不及格科目
    @RequestMapping("/stuRequireFailingCourses")
    public String stuRequireFailingScores(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        String sno = (String) session.getAttribute("sno");  // 从session中获取学号
        List<StudentGrade> scoreList = studentGradeService.findStudentFailingCourses(sno); // 查询不及格成绩
        model.addAttribute("scoreList", scoreList); // 将成绩列表添加到模型中
        return "student/stuRequireScore"; // 返回 JSP 页面名称
    }

    //跳转选课页面stuSelectCourse.jsp
    @Autowired
    private CourseService courseService;
    @RequestMapping("/getStuSelectCourse")
    public String getStuSelectCourse(HttpServletRequest request, Model model) {
        List<Course> courseList = courseService.findAllCourses(); // 查找所有课程
        System.out.println("查询所有课程");
        model.addAttribute("courseList", courseList);
        return "student/stuSelectCourse"; // 返回 JSP 页面名称
    }

    // 学生选课
    @PostMapping("/selectCourses")
    public String selectCourses(HttpServletRequest request, Model model) {
        String[] selectedCourses = request.getParameterValues("courseCheckbox");
        System.out.println("选中的课程: " + Arrays.toString(selectedCourses)); // 打印选中的课程
        String sno = (String) request.getSession().getAttribute("sno");
        String sname = (String) request.getSession().getAttribute("sname");
        
        // 查找该学生已选的课程
        List<StudentGrade> stuSelectedCourses = studentGradeService.findStuSelectedCourses(sno);
        Set<String> selectedCourseNumbers = stuSelectedCourses.stream()
                .map(StudentGrade::getCno)
                .collect(Collectors.toSet()); // 使用 Set 存储已选课程号以便快速查找

        if (selectedCourses != null) {
            for (String cno : selectedCourses) {
                // 检查课程是否已经被选中
                if (selectedCourseNumbers.contains(cno)) {
                    System.out.println("课程号 " + cno + " 已经被选择，跳过插入。");
                    continue; // 如果已经选择，跳过当前循环
                }

                // 根据 cno 查找 cname
                String cname = courseService.findCourseNameByCno(cno);

                if (cname != null) { // 确保 cname 不为 null
                    StudentGrade studentGrade = new StudentGrade();
                    studentGrade.setSno(sno);
                    studentGrade.setSname(sname);
                    studentGrade.setCno(cno);
                    studentGrade.setCname(cname);
                    studentGradeService.studentSelectCourses(studentGrade);
                } else {
                    System.out.println("未找到课程号: " + cno);
                }
            }
        }
        String sno1 = (String) request.getSession().getAttribute("sno");
        List<StudentGrade> studentGrade = studentGradeService.findStuSelectedCourses(sno1);
        model.addAttribute("studentGrade", studentGrade);
        return "student/showStuSelectedCourses";
    }


    @GetMapping("/getShowStuSelectedCourses")
    public String getShowStuSelectedCourses(Model model, HttpServletRequest request) {
        String sno = (String) request.getSession().getAttribute("sno"); // 获取学生学号
        List<StudentGrade> studentGrade = studentGradeService.findStuSelectedCourses(sno);
        model.addAttribute("studentGrade", studentGrade); // 将选课记录添加到模型中
        return "student/showStuSelectedCourses"; // 返回显示所选课程的 JSP 页面
    }
}