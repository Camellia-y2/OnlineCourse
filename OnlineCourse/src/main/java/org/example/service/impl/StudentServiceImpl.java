package org.example.service.impl;
import org.example.mapper.StudentDao;
import org.example.pojo.Student;
import org.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    @Transactional
    public int addStudent(Student student) {
        return studentDao.insertStudent(student);
    }

    @Override
    @Transactional
    public void deleteStudent(String sno) {
        studentDao.deleteStudent(sno);
    }

    @Override
    @Transactional
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Override
    public Student findStudentBySno(String sno) {
        return studentDao.selectStudentBySno(sno);
    }

    @Override
    public List<Student> findAllStudents() {
        return studentDao.selectAllStudents();
    }

    @Override
    public List<Student> findStudentByConditions(String sno, String sname) {
        return studentDao.selectStudentByConditions(sno,sname);
    }
}
