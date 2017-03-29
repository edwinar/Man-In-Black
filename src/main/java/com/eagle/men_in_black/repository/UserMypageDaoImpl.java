package com.eagle.men_in_black.repository;

import com.eagle.men_in_black.model.UserMypageDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class UserMypageDaoImpl implements UserMypageDao {
    private final String namespace="com.eagle.repository.mapper.UserMypage";
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public UserMypageDto mib_myreview(String id) {
        String statement = namespace+".mib_myreview";
        return sqlSession.selectOne(statement,id);
    }
}
