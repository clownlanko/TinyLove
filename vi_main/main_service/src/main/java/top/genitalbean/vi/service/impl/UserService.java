package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.UserMapper;
import top.genitalbean.vi.pojo.ViUser;
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
        return userMapper.insert(t)==1;
    }
    public ViUser queryByAccountAndPhone(String userName, String phone)throws NoDataMatchException{
        ViUser user=userMapper.queryByAccountAndPhone(userName,phone);
        if(user==null){
            throw new NoDataMatchException(userName+"不存在,或"+phone+"不是"+userName+"绑定的手机.");
        }
        return user;
    }
    public ViUser queryByKeywords(String keywords, String password)throws NoDataMatchException{
        ViUser user=userMapper.queryByKeywords(keywords,password);
        if(user==null){
            throw new NoDataMatchException(keywords+"不存在,或密码错误.");
        }
        return user;
    }
    public ViUser queryByPhone(String phone)throws NoDataMatchException{
        ViUser user=userMapper.queryByPhone(phone);
        if(user==null){
            throw new NoDataMatchException();
        }
        return user;
    }
    @Override
    public <T> boolean delete(T e) {
        return false;
    }

    @Override
    public <T> boolean update(T t) {
        return userMapper.update(t)==1;
    }

    @Override
    public <T> List<T> query() {
        return null;
    }
}
