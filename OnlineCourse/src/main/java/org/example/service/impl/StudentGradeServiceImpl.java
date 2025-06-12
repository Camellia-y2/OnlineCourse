package org.example.service.impl;

import org.example.mapper.CourseDao;
import org.example.mapper.StudentGradeDao;
import org.example.pojo.StudentGrade;
import org.example.service.StudentGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
public class StudentGradeServiceImpl implements StudentGradeService {

    @Autowired
    private StudentGradeDao studentGradeDao;
    @Autowired
    private CourseDao courseDao;

//    @Override
//    @Transactional
//    public void addStudentGrade(StudentGrade studentGrade) {
//        studentGradeDao.insertStudentGrade(studentGrade);
//    }

    @Override
    public int deleteStudentGrade(String sno, String cno) {
        return studentGradeDao.deleteStudentGrade(sno, cno);
    }
    // 更新学生成绩信息
    @Override
    public int updateStudentGrade(StudentGrade studentGrade) {
        return studentGradeDao.updateStudentGrade(studentGrade);
    }

    @Override
    public List<StudentGrade> findStudentGradeBySno(String sno) {
        return studentGradeDao.selectStudentGradeBySno(sno);
    }

    @Override
    public List<StudentGrade> findStudentGradeByCno(StudentGrade studentGrade) {
        return studentGradeDao.selectStudentGradeByCno(studentGrade);
    }

    @Override
    public List<StudentGrade> findStudentGradeByCname(StudentGrade studentGrade) {
        return studentGradeDao.selectStudentGradeByCname(studentGrade);
    }

    @Override
    public List<StudentGrade> findStudentAllGrades(String sno) {
        return studentGradeDao.selectStudentAllGrades(sno);
    }

    @Override
    public List<StudentGrade> findStudentFailingCourses(String sno) {
        return studentGradeDao.selectStudentFailingCourses(sno);
    }

    @Override
    @Transactional
    public void studentSelectCourses(StudentGrade studentGrade) {
         studentGradeDao.insertStudentSelectCourses(studentGrade);
    }
    @Override
    public List<StudentGrade> findAllStudentGrades() {
        return studentGradeDao.selectAllStudentGrade();
    }

    @Override
    public List<StudentGrade> findStuSelectedCourses(String sno){
        return studentGradeDao.selectStuSelectedCourses(sno);
    }

    //？？
// 根据多个条件进行查询
    @Override
    public List<StudentGrade> selectStudentGradeByConditions(String sno, String sname, String cno, String cname) {
    return studentGradeDao.selectStudentGradeByConditions(sno, sname, cno, cname);
}
    // 查询所有学生成绩
    @Override
    public List<StudentGrade> selectAllStudentGrade() {
        return studentGradeDao.selectAllStudentGrade();
    }
//？？

    // 查询所有学号
    @Override
    public <List> String findAllSno() {
        return studentGradeDao.selectAllsno().toString();
    }

    //查询学号对应的姓名（去重）
    @Override
    public  String findSnameBySnoDistinctly(String sno) {
        return studentGradeDao.selectStudentName(sno);
    }

    //查询学号（去重）
    @Override
    public <List> java.util.List<String> findAllSnoDistinctly() {
        return studentGradeDao.selectAllSnoDistinctly();
    }
}