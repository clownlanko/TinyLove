package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.mapper.impl.UserMapper;
import top.genitalbean.vi.service.BaseService;

import java.util.List;

@Service
public class UserService implements BaseService {
    @Autowired UserMapper userMapper;
    public boolean changePassword(String userId,String pwd){
        return userMapper.changePassword(userId,pwd)==1;
    }
    @Override
    public <T> boolean insert(T t) {
        return false;
    }

    @Override
    public <T> boolean delete(T e) {
        return false;
    }

    @Override
    public <T> boolean update(T t) {
        return false;
    }

    @Override
    public <T> List<T> query() {
        return null;
    }
}
