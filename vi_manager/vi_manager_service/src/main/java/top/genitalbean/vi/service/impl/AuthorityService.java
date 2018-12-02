package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import top.genitalbean.vi.mapper.impl.AuthorityMapper;
import top.genitalbean.vi.pojo.AuthorityEntity;
import top.genitalbean.vi.service.BaseService;

import java.util.List;

public class AuthorityService implements BaseService {
    @Autowired
    AuthorityMapper authorityMapper;
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
    public List<AuthorityEntity> queryGroupByAuthority(){
        return authorityMapper.queryGroupByAuthority();
    }
}
