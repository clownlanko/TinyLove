package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.AuthorityMapper;
import top.genitalbean.vi.pojo.ViAuthority;
import top.genitalbean.vi.service.BaseService;

import java.util.List;

@Service
public class AuthorityService implements BaseService {
    @Autowired AuthorityMapper authorityMapper;
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
        return authorityMapper.query();
    }
    public List<ViAuthority> queryGroupByAuthority(Integer parentId){
        return authorityMapper.queryGroupByAuthority(parentId);
    }
    public Integer findByUserId(String userId) throws NoDataMatchException{
        Integer authorityId = authorityMapper.findByUserId(userId);
        if(authorityId!=null && authorityId>0)
            return authorityId;
        else
            throw new NoDataMatchException("No user of userId as "+userId);
    }
}
