package org.example.controller;

import org.example.pojo.Course;
import org.example.pojo.Student;
import org.example.pojo.StudentGrade;
import org.example.pojo.StudentStatistics;
import org.example.service.CourseService;
import org.example.service.StatisticsService;
import org.example.service.StudentGradeService;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class managerController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private StudentGradeService studentGradeService;
    @GetMapping("/courses")
    public ModelAndView showCourses() {
        ModelAndView modelAndView = new ModelAndView("courses");
        return modelAndView;
    }

    @GetMapping("/courseInfo")
    public String showCourseInfo() {
        return "manager/CourseInfo"; // 返回视图名称
    }
    @GetMapping("/studentGradeInfo")
    public String showStudentGradeInfo() {
        return "manager/StudentGradeInfo"; // 返回视图名称
    }
    //    查询课程
    @RequestMapping(value = "/queryCourses", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryCourses(@RequestParam(required = false) String flag,
                               @RequestParam(required = false) String cno,
                               @RequestParam(required = false) String cname) {
        List<Course> courses = new ArrayList<>();
        if ( cno != null && !cno.isEmpty()) {
            // 根据课程号查询
            Course course = courseService.findCourseByCno(cno);
            courses.add(course);
        } else if (cname != null && !cname.isEmpty()) {
            // 根据课程名查询
            courses = courseService.findCoursesByCname(cname);
        } else {
            // 查询所有课程
            courses = courseService.findAllCourses();
        }
        //当不输入查询条件时查询所有||cname.isEmpty()&&cname.isEmpty()
        if("1".equals(flag)){
            courses = courseService.findAllCourses();
        }
        StringBuilder result = new StringBuilder();
        for (Course c : courses) {
            result.append("<tr>")
                    .append("<td>").append(c.getCno()).append("</td>")
                    .append("<td>").append(c.getCname()).append("</td>")
                    .append("<td>").append(c.getCredit()).append("</td>")
                    .append("<td>").append(c.getTtime()).append("</td>")
                    .append("<td>").append(c.getPtime()).append("</td>")
                    .append("<td>").append(c.getExam()).append("</td>")
                    .append("<td><a href='#' class='updateBt' " +
                            "data-cno='").append(c.getCno()).append("' " +
                            "data-cname='").append(c.getCname()).append("' " +
                            "data-credit='").append(c.getCredit()).append("' " +
                            "data-ttime='").append(c.getTtime()).append("' " +
                            "data-ptime='").append(c.getPtime()).append("' " +
                            "data-exam='").append(c.getExam()).append("'>更新</a></td>")
                    .append("<td><a href='deleteCourse?cno=").append(c.getCno()).append("' class='deleteBt'>删除</a></td>")
                    .append("</tr>");
        }
        return result.toString();
    }
    //    删除课程
    @GetMapping("/deleteCourse")
    @ResponseBody // 表示这个方法返回的是一个响应体
    public String deleteCourse(@RequestParam String cno) {
        int success = courseService.deleteCourse(cno); // 假设 deleteCourse 返回 boolean
        boolean flag = false;
        if(success>0){
            flag = true;
        }
        return flag ? "success" : "error"; // 根据删除结果返回对应的字符串
    }
    //添加课程

    @GetMapping("/addCourse")
    @ResponseBody
    public String addCourse(@RequestParam String cno,@RequestParam  String cname,@RequestParam  double credit,
                            @RequestParam int ttime,@RequestParam  int ptime,@RequestParam  String exam) {
        // 创建课程对象
        Course course = new Course(cno, cname, credit, ttime, ptime, exam);
        System.out.println(course);
        Course findCno = courseService.findCourseByCno(cno);
        System.out.println(findCno);
        int success=0;
        if (findCno != null) {

        }else{
            success = courseService.addCourse(course);
        }
        return success>0 ? "success" : "error"; // 根据新增结果返回对应的字符串
    }
    @GetMapping("/updateCourse")
    @ResponseBody
    public String updateCourse(@RequestParam String cno, @RequestParam String cname,
                               @RequestParam double credit, @RequestParam int ttime,
                               @RequestParam int ptime, @RequestParam String exam) {
        // 创建课程对象
        Course course = new Course(cno, cname, credit, ttime, ptime, exam);
        boolean flag = false;
        int success = courseService.updateCourse(course);
        if (success > 0) {
            flag = true;
        }
        return flag ? "success" : "error"; // 根据新增结果返回对应的字符串
    }
    //StudentGradeInfo页面
    // 查询学生成绩
    @RequestMapping(value = "/queryGrades", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryGrades(@RequestParam(required = false) String flag,
                              @RequestParam(required = false) String sno,
                              @RequestParam(required = false) String sname,
                              @RequestParam(required = false) String cno,
                              @RequestParam(required = false) String cname) {
        List<StudentGrade> studentGrades;

        // 根据 flag 的值判断查询方式
        if ("1".equals(flag)||((sno==null||!sno.isEmpty())&&(sname==null|| !sname.isEmpty())
                &&(cno==null||!cno.isEmpty())&&(cname==null||!cname.isEmpty()) )) {
            // 查询所有成绩
            studentGrades = studentGradeService.selectAllStudentGrade();
        } else {
            // 根据条件查询
            studentGrades = studentGradeService.selectStudentGradeByConditions(sno, sname, cno, cname);
        }

        StringBuilder result = new StringBuilder();
        for (StudentGrade grade : studentGrades) {
            result.append("<tr>")
                    .append("<td>").append(grade.getSno()).append("</td>")
                    .append("<td>").append(grade.getSname()).append("</td>")
                    .append("<td>").append(grade.getCno()).append("</td>")
                    .append("<td>").append(grade.getCname()).append("</td>")
                    .append("<td>").append(grade.getScore()).append("</td>")
                    .append("<td>").append(grade.getExamtime()).append("</td>")
                    .append("<td><a href='#' class='updateBt' " +
                            "data-sno='").append(grade.getSno()).append("' " +
                            "data-sname='").append(grade.getSname()).append("' " +
                            "data-cno='").append(grade.getCno()).append("' " +
                            "data-cname='").append(grade.getCname()).append("' " +
                            "data-score='").append(grade.getScore()).append("' " +
                            "data-examtime='").append(grade.getExamtime()).append("'>更新</a></td>")
                    .append("<td><a href='#' class='deleteBt' "+
                            "data-sno='").append(grade.getSno()).append("' " +
                            "data-cno='").append(grade.getCno()).append("'>删除</a></td>")
                    .append("</tr>");
        }
        return result.toString();
    }

    // 删除学生成绩
    @GetMapping("/deleteGrade")
    @ResponseBody
    public String deleteGrade(@RequestParam String sno, @RequestParam String cno) {
        try {
            int success = studentGradeService.deleteStudentGrade(sno, cno);
            if (success > 0) {
                // Log the success
                System.out.println("Delete successful. Rows affected: " + success);
                return "success";
            } else {
                // Log the failure
                System.out.println("Delete failed. No rows affected.");
                return "error";
            }
        } catch (Exception e) {
            // Log the exception
            System.out.println("Error during delete operation: " + e.getMessage());
            return "error";
        }
    }
    //    更新成绩信息
    @PostMapping("/updateGrade")
    @ResponseBody
    public String updateGrade(@RequestParam String sno,
                              @RequestParam String sname,
                              @RequestParam String cno,
                              @RequestParam String cname,
                              @RequestParam int score,
                              @RequestParam String examtime) {
        // 更新课程信息
        StudentGrade  studentGrade = new StudentGrade();
        studentGrade.setSno(sno);
        studentGrade.setSname(sname);
        studentGrade.setCno(cno);
        studentGrade.setCname(cname);
        studentGrade.setScore(score);
        studentGrade.setExamtime(examtime);
        int isUpdated = studentGradeService.updateStudentGrade(studentGrade);
        return isUpdated >0? "success" : "error";
    }

    @Autowired
    StudentService studentService;
    /*学生信息service还要auTo*还要管理员页面的路径*/
    @GetMapping("/userInfo")
    public String showUserInfo() {
        return "manager/UserInfo"; // 返回视图名称
    }

    @RequestMapping(value = "/queryUsers", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryUsers(@RequestParam(required = false) String flag,
                             @RequestParam(required = false) String sno,
                             @RequestParam(required = false) String sname) {
        List<Student> students = new ArrayList<>();

        if ("1".equals(flag)||((sno==null||sno.isEmpty())&&(sname==null|| sname.isEmpty()) )) {
            // 查询
            students=studentService.findAllStudents();
        } else {
            // 根据条件查询
            students = studentService.findStudentByConditions(sno,sname);
        }
        StringBuilder result = new StringBuilder();
        for (Student s : students) {
            result.append("<tr>")
                    .append("<td>").append(s.getSno()).append("</td>")
                    .append("<td>").append(s.getSname()).append("</td>")
                    .append("<td>").append("</td>")
                    .append("</tr>");
        }
        return result.toString();
    }


}