package org.example.service.impl;

import org.example.mapper.StudentGradeDao;
import org.example.mapper.StudentStatisticsDao;
import org.example.pojo.StudentStatistics;
import org.example.service.StatisticsService;
import org.example.service.StudentGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class StatisticsServiceImpl implements StatisticsService {

    @Autowired
    private StudentStatisticsDao studentStatisticsDao;
    @Autowired
    private StudentGradeDao studentGradeDao;

    @Override
    public List<StudentStatistics> findAllStatistics() {
        return studentStatisticsDao.selectAllStatistics();
    }

    @Override
    public StudentStatistics findStatisticsBySno(String sno) {
        return studentStatisticsDao.selectStatisticsBySno(sno);
    }

    @Override
    public StudentStatistics findStatisticsBySname(String sname) {
        return studentStatisticsDao.selectStatisticsBySname(sname);
    }


//    通过课程数
    @Override
    public int calculatePassedCourses(String sno) {
        return studentStatisticsDao.selectPassedCourses(sno);
    }

//    不及格课程数
    @Override
    public int calculateFailedCourses(String sno) {
        return studentStatisticsDao.selectFailedCourses(sno);
    }

//    总学分
    @Override
    public double calculateTotalCredits(String sno) {
        double credits=studentStatisticsDao.selectTotalCredits(sno);
        return credits != 0 ? credits : 0.0; // 检查并返回默认值 ;
    }

//    平均分
    @Override
    public double calculateAvgScores(String sno) {
        return studentStatisticsDao.selectAvgScores(sno);
    }

    //更新
    @Override
    @Transactional
    public void updateStatistics(StudentStatistics studentStatistics) {
        // 在这里实现更新逻辑
        StudentStatistics existingStats = (StudentStatistics) studentStatisticsDao.selectStatisticsBySno(studentStatistics.getSno());
        if (existingStats != null) {
            studentStatisticsDao.updateStatistics(studentStatistics);
        } else {
            studentStatisticsDao.insertStatistics(studentStatistics);
        }
    }

    @Autowired
    StudentGradeService studentGradeService;
    @Autowired
    StatisticsService statisticsService;
    public void updateAllStatistics(){
        List<String> snoList =studentGradeService.findAllSnoDistinctly();//查找所有sg表里的学号
        for(String sno:snoList ){
            String sname= studentGradeService.findSnameBySnoDistinctly(sno);//查找sg表里的姓名
            int PassedCourses=statisticsService.calculatePassedCourses(sno);
            int FailedCourses=statisticsService.calculateFailedCourses(sno);
            double TotalCredits=statisticsService.calculateTotalCredits(sno);
            double AvgScores=statisticsService.calculateAvgScores(sno);

            StudentStatistics studentStatistics=new StudentStatistics(sno,sname,TotalCredits,
                    PassedCourses,FailedCourses,AvgScores);
            statisticsService.updateStatistics(studentStatistics);
        }
    }
}
