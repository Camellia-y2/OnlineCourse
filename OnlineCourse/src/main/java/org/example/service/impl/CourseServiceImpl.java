package org.example.service.impl;

import org.example.mapper.CourseDao;
import org.example.pojo.Course;
import org.example.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Override
    @Transactional
    public int addCourse(Course course) {
        return courseDao.insertCourse(course);
    }

    @Override
    @Transactional
    public int deleteCourse(String cno) {
        return courseDao.deleteCourse(cno);
    }

    @Override
    @Transactional
    public int updateCourse(Course course) {
        return courseDao.updateCourse(course);
    }

    @Override
    public Course findCourseByCno(String cno) {
        return courseDao.selectCourseByCno(cno);
    }

    @Override
    public List<Course> findAllCourses() {
        return courseDao.selectAllCourses();
    }

    public String findCourseNameByCno(String cno) {
        return courseDao.findCourseNameByCno(cno); // 通过课程号找到课程名称的方法
    }

//    ？
    @Override
    public List<Course> findCoursesByCname(String cname) {
    return courseDao.selectCoursesByCname(cname);
}
}