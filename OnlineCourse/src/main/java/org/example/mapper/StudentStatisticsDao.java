package org.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.example.pojo.Course;
import org.example.pojo.StudentStatistics;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface StudentStatisticsDao {

    // 更新统计信息
    @Transactional
    @Update("UPDATE studentStatistics SET totalCredits = #{totalCredits}, passedCourses = #{passedCourses}, " +
            "failedCourses = #{failedCourses}, averageScore = #{averageScore}, sname = #{sname} WHERE sno = #{sno}")
    void updateStatistics(StudentStatistics studentStatistics);

    // 插入新统计信息的方法
    @Insert("INSERT INTO studentStatistics (sno, sname, totalCredits, passedCourses, failedCourses, averageScore) " +
            "VALUES (#{sno}, #{sname}, #{totalCredits}, #{passedCourses}, #{failedCourses}, #{averageScore})")
    void insertStatistics(StudentStatistics studentStatistics);

    //查询所有统计信息
    @Select("select * from studentStatistics")
    List<StudentStatistics> selectAllStatistics();

    //根据学号查询统计表
    @Select("select * from studentStatistics where sno=#{sno}")
    StudentStatistics selectStatisticsBySno(String sno);

    //根据姓名查询统计表
    @Select("select * from studentStatistics where sname=#{sname}")
    StudentStatistics selectStatisticsBySname(String sname);

    //根据课程号查询学分
    @Select("select credit from sg where cno=#{cno}")
    double selectCreditsByCno(String cno);

//    根据学号查询总学分
    @Select("SELECT SUM(course.credit) FROM sg JOIN course ON sg.cno = course.cno " +
            "WHERE sg.sno=#{sno} GROUP BY sg.sno")
    double selectTotalCredits(String sno);

    //根据学号查询平均分
    @Select("SELECT AVG(score) FROM sg WHERE sg.sno = #{sno} GROUP BY sg.sno")
    double selectAvgScores(String sno);

    // 根据学号查询及格（score >= 60）课程数量
    @Select("SELECT COUNT(*) FROM sg WHERE sno = #{sno} AND score >= 60")
    int selectPassedCourses(String sno);

    // 根据学号查询不及格（score < 60）课程数量
    @Select("SELECT COUNT(*) FROM sg WHERE sno = #{sno} AND score < 60")
    int selectFailedCourses(String sno);

}
