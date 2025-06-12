package org.example.service;

import org.example.pojo.StudentGrade;
import java.util.List;

public interface StudentGradeService {
    // 添加学生成绩
    //    int addStudentGrade(StudentGrade studentGrade);

    int deleteStudentGrade(String sno, String cno);

    int updateStudentGrade(StudentGrade studentGrade);

//    List<StudentGrade> selectStudentGradeBySno(String sno);
//
//    List<StudentGrade> selectStudentGradeByCno(String cno);

//    ？？
    List<StudentGrade> selectStudentGradeByConditions(String sno, String sname, String cno, String cname);
    List<StudentGrade> selectAllStudentGrade();
//    ？？

    // 根据学号查询学生成绩
    List<StudentGrade> findStudentGradeBySno(String sno);

    // 根据课程编号查询学生成绩
    List<StudentGrade> findStudentGradeByCno(StudentGrade studentGrade);

    // 根据课程名查询学生成绩
    List<StudentGrade> findStudentGradeByCname(StudentGrade studentGrade);

    // 学生查询自己所有成绩（根据学号）
    List<StudentGrade> findStudentAllGrades(String sid);

    // 学生查询挂科课程（根据学号）
    List<StudentGrade> findStudentFailingCourses(String sno);

    //学生选课
    void studentSelectCourses(StudentGrade studentGrade);

    // 查询所有学生成绩
    List<StudentGrade> findAllStudentGrades();

    //查询所有所选课程
    List<StudentGrade> findStuSelectedCourses(String sno);

    //查询sg所有的学号
    <List>String findAllSno();

    //查询sg所有的姓名(去重)
    String findSnameBySnoDistinctly(String sno);

    //查询sg所有的学号(去重)
    <List> java.util.List<String> findAllSnoDistinctly();
}