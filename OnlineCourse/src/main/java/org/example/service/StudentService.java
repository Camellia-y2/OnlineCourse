package org.example.service;

import org.example.pojo.Student;

import java.util.List;

public interface StudentService {
    // 添加学生
    int addStudent(Student student);

    // 删除学生
    void deleteStudent(String sno);

    // 更新学生信息
    void updateStudent(Student student);

    // 根据学号查询学生
    Student findStudentBySno(String sno);

    // 查询所有学生
    List<Student> findAllStudents();

    /*新增查询方法*/
    List<Student> findStudentByConditions(String sno, String sname);
}
