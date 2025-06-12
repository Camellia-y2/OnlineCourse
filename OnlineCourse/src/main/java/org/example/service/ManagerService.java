package org.example.service;

import org.example.pojo.Manager;
import java.util.List;

public interface ManagerService {
    // 更新管理员信息
    void updateManager(Manager manager);

    // 根据用户名查询管理员
    Manager findManagerByMname(String mname);

    // 查询所有管理员
    List<Manager> findAllManagers();
}
