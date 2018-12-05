package top.genitalbean.vi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.DataAreadyExistsException;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.RoleMapper;
import top.genitalbean.vi.service.BaseService;

import java.util.List;

@Service
public class RoleService implements BaseService {
    @Autowired private RoleMapper roleMapper;
    /**
     * 根据用户名查找权限
     * @param userId
     * @return
     */
    public Integer queryAuthorityId(String userId) throws NoDataMatchException {
        Integer authorityId=roleMapper.queryAuthoirityId(userId);
        if(authorityId!=null && authorityId>0)
            return authorityId;
        else
            throw new NoDataMatchException("the "+userId+" not exists manager just one");
    }
    @Override
    public <T> boolean insert(T t) {
        Integer count = roleMapper.insert(t);
        if(count!=1){
            throw new DataAreadyExistsException("The role alreay exists!");
        }
        return count ==1;
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
