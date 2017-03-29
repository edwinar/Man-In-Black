package com.eagle.men_in_black.service;

import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.repository.UserMypageDao;
import org.springframework.beans.factory.annotation.Autowired;

public class UserMypageSvcImpl implements UserMypageSvc {
    @Autowired
    private UserMypageDao UserMypageDao;

    @Override
    public UserMypageDto mib_myreview(String id) {
        return UserMypageDao.mib_myreview(id);
    }
}
