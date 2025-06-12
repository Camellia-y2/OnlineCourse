package org.example.service.impl;

import org.example.mapper.ManagerDao;
import org.example.pojo.Manager;
import org.example.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;

    @Override
    @Transactional
    public void updateManager(Manager manager) {
        managerDao.updateManager(manager);
    }

    @Override
    public Manager findManagerByMname(String mname) {
        return managerDao.selectManagerByMname(mname);
    }

    @Override
    public List<Manager> findAllManagers() {
        return managerDao.selectAllManagers();
    }
}