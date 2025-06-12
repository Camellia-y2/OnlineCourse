package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.Course;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseDao {

    //    插入课程信息
    @Insert("insert into course(cno, cname, credit, ttime, ptime, exam) " +
            "values (#{cno}, #{cname}, #{credit}, #{ttime}, #{ptime}, #{exam})")
    int insertCourse(Course course);

    @Delete("delete from course where cno = #{cno}")
    int deleteCourse(String cno);

    @Update("update course set cname = #{cname}, credit = #{credit}, ttime = #{ttime}, " +
            "ptime = #{ptime}, exam = #{exam} where cno = #{cno}")
    int updateCourse(Course course);

//    根据课程号查询课程
    @Select("select * from course where cno = #{cno}")
    Course selectCourseByCno(String cno);

//    查询所有课程
    @Select("select * from course")
    List<Course> selectAllCourses();

    //    根据课程名查询
    @Select("select * from course where cname like CONCAT('%', #{cname}, '%')")
    List<Course> selectCoursesByCname(String cname);


    @Select("SELECT cname FROM course WHERE cno = #{cno}")
    String findCourseNameByCno(String cno);
}
