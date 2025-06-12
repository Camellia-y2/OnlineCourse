package org.example.service;

import org.example.pojo.Course;
import java.util.List;

public interface CourseService {
    // 添加课程
    int addCourse(Course course);

    // 删除课程
    int deleteCourse(String cno);

    // 更新课程信息
    int updateCourse(Course course);

    // 根据课程编号查询课程
    Course findCourseByCno(String cno);

    // 查询所有课程
    List<Course> findAllCourses();

    String findCourseNameByCno(String cno);

    //?
    List<Course> findCoursesByCname(String cname);
}
