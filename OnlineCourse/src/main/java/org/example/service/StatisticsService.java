package org.example.service;

import org.example.pojo.StudentStatistics;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface StatisticsService {
    //查询所有统计信息
    List<StudentStatistics> findAllStatistics();

    //根据学号查询
    StudentStatistics findStatisticsBySno(String sno);

    //根据姓名查询
    StudentStatistics findStatisticsBySname(String sname);

    //更新
    @Transactional
    void updateStatistics(StudentStatistics studentStatistics);

    //计算通过课程数
    int calculatePassedCourses(String sno);

    //计算未通过课程数
   int calculateFailedCourses(String sno);

   //计算总学分
    double calculateTotalCredits(String sno);

    //计算平均分
    double calculateAvgScores(String sno);

    //总方法
    void updateAllStatistics();
}
