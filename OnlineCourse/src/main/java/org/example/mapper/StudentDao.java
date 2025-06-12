package org.example.mapper;
import org.apache.ibatis.annotations.*;
import org.example.pojo.Student;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StudentDao {

    // 添加学生
    @Insert("insert into student (sno, sname, spwd) values (#{sno}, #{sname}, #{spwd})")
     int insertStudent(Student student);

    // 删除学生
    @Delete("delete from student where sno = #{sno}")
    void deleteStudent(String sno);

    // 更新学生信息
    @Update("update student set sname = #{sname}, spwd = #{spwd} where sno = #{sno}")
    void updateStudent(Student student);

    // 根据学号查询学生
    @Select("select * from student WHERE sno = #{sno}")
    Student selectStudentBySno(String sno);

    // 查询所有学生
    @Select("select * from student")
    List<Student> selectAllStudents();

    @Select({
            "<script>",
            "select * from student",
            "where 1=1",
            "<if test='sno != null and sno.trim() != \"\"'> and sno = #{sno} </if>",
            "<if test='sname != null and sname.trim() != \"\"'> and sname like CONCAT('%', #{sname}, '%') </if>",
            "</script>"
    })
    List<Student> selectStudentByConditions(
            @Param("sno") String sno,
            @Param("sname") String sname
    );
}

