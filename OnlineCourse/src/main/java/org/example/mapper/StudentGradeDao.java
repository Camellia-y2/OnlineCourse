package org.example.mapper;

import org.apache.ibatis.annotations.*;
import org.example.pojo.StudentGrade;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Repository
public interface StudentGradeDao {

    // 删除学生成绩
    @Delete("delete from sg where sno = #{sno} and cno = #{cno}")
    int deleteStudentGrade(@Param("sno") String sno, @Param("cno") String cno);
    // 更新学生成绩
    @Update("update sg set score = #{score}, examtime = #{examtime} " +
            "where sno = #{sno} and cno = #{cno}")
    int updateStudentGrade(StudentGrade studentGrade);

    // 根据学号查询学生成绩
    @Select("select * from sg where sno = #{sno}")
    List<StudentGrade> selectStudentGradeBySno(String sno);

    // 根据课程编号查询学生成绩
    @Select("select * from sg where cno = #{cno} and sno =#{sno}")
    List<StudentGrade> selectStudentGradeByCno(StudentGrade studentGrade);

    // 根据课程名查询学生成绩
    @Select("select * from sg where cname = #{cname} and sno =#{sno}")
    List<StudentGrade> selectStudentGradeByCname(StudentGrade studentGrade);

    // 根据多个条件进行查询
    @Select({
            "<script>",
            "SELECT * FROM sg",
            "WHERE 1=1",
            "<if test='sno != null and sno != \"\"'> AND sno = #{sno} </if>",
            "<if test='sname != null and sname != \"\"'> AND sname LIKE CONCAT('%', #{sname}, '%') </if>",
            "<if test='cno != null and cno != \"\"'> AND cno = #{cno} </if>",
            "<if test='cname != null and cname != \"\"'> AND cname LIKE CONCAT('%', #{cname}, '%') </if>",
            "</script>"
    })
    List<StudentGrade> selectStudentGradeByConditions(
            @Param("sno") String sno,
            @Param("sname") String sname,
            @Param("cno") String cno,
            @Param("cname") String cname
    );


    // 学生根据学号查询自己成绩
    @Select("select * from sg where sno = #{sno}")
    List<StudentGrade> selectStudentAllGrades(String sno);

    // 学生根据学号查询挂科课程
    @Select("select * from sg where score < 60 and sno=#{sno}")
    List<StudentGrade> selectStudentFailingCourses(String sno);

    // 查询所有学生成绩
    @Select("select * from sg")
    List<StudentGrade> selectAllStudentGrade();

    //学生选课
    @Transactional
    @Insert("insert into sg (sno, sname, cno, cname) " +
            "values (#{sno}, #{sname}, #{cno}, #{cname})")
    void insertStudentSelectCourses(StudentGrade studentGrade);

    //查询学生所选课程
    @Select("select * from sg where sno=#{sno}")
    List<StudentGrade> selectStuSelectedCourses(String sno);

    //查找所有学生学号
    @Select("select sno from sg")
    List<String> selectAllsno();

    // 根据学号查询姓名
    @Select("select DISTINCT sname  from sg where sno=#{sno} ")
    String selectStudentName(String sno);


    @Select("select DISTINCT sno  from sg ")
    List<String> selectAllSnoDistinctly();


}

