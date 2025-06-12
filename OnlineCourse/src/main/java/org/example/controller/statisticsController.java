package org.example.controller;

import org.example.pojo.StudentStatistics;
import org.example.service.StatisticsService;
import org.example.service.StudentGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/manager") // 公共请求路径
public class statisticsController {

    /*跳转学生成绩统计并显示所有信息*/
    @Autowired
    StatisticsService statisticsService;
    @Autowired
    StudentGradeService studentGradeService;

    //进入统计表页面并更新表并显示
    @GetMapping("/getGradeSummary")
    public String getGradeSummary(HttpServletRequest request, Model model) {
        statisticsService.updateAllStatistics();
        List<StudentStatistics> statisticsList= statisticsService.findAllStatistics(); // 查找所有课程
        model.addAttribute("statisticsList", statisticsList);
        return "manager/GradeSummary"; // 返回视图名称
    }

    //根据学号姓名查询统计表
    @RequestMapping("/queryStatistics")
    public String queryStatistics(HttpServletRequest request, Model model) {
        String sno = request.getParameter("sno"); // 获取输入的学号
        String sname = request.getParameter("sname"); // 获取输入的姓名
        System.out.println("sno：" + sno + " sname:" + sname);
        List<StudentStatistics> statisticsList = new ArrayList<>();

        if (sno != null && !sno.isEmpty()) {
            StudentStatistics statistics = statisticsService.findStatisticsBySno(sno);
            if (statistics != null) {
                statisticsList.add(statistics);
            }
        }
        else if (sname != null && !sname.isEmpty()) {
            StudentStatistics statistics = statisticsService.findStatisticsBySname(sname);
            if (statistics != null) {
                statisticsList.add(statistics);
            }
        }
        // 如果学号和姓名都为空，查询所有统计信息
        else {
            statisticsList = statisticsService.findAllStatistics(); // 查找所有统计信息
        }
        model.addAttribute("statisticsList", statisticsList);
        return "manager/GradeSummary"; // 返回显示结果的 JSP 页面
    }

}
