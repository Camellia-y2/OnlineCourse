package org.example.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.example.pojo.Manager;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ManagerDao {


        // 更新管理员信息
        @Update("update manager set mpwd = #{mpwd} where mname = #{mname}")
        void updateManager(Manager manager);

        // 根据用户名查询管理员
        @Select("select * from manager where mname = #{mname}")
        Manager selectManagerByMname(String mname);

        // 查询所有管理员
        @Select("select * from manager")
        List<Manager> selectAllManagers();
}
