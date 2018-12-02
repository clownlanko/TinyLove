package top.genitalbean.vi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.ManagerMapper;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.BaseService;

@Service
public class ManagerService implements BaseService{
	@Autowired private ManagerMapper managerMapper;

	/**
	 * 根据用户名和密码查找管理员
	 * @param name
	 * @param password
	 * @return
	 * @throws NoDataMatchException
	 */
	public Manager_Role findByUser(String name,String password) throws NoDataMatchException{
		System.out.println("ManagerService.findByUser():name="+name+"password="+password);
		Manager_Role manager = managerMapper.findByUser(name, password);
		System.out.println("ManagerService.findByUser():"+manager);
		if(manager.getUserName().equals(name) && manager.getPassword().equals(password)) {
			return manager;
		}else {
			throw new NoDataMatchException("No user of named "+name +" or the password is missing.");
		}
	}
	/**
     * 根据用户id查找
	 */
    public Manager_Role findByUserId(String userId){
        Manager_Role manager=managerMapper.findByUserId(userId);
        if(manager==null){
            throw new NoDataMatchException("No user of userId as "+userId);
        }else
            return manager;
	}
	/**
	 * 根据权限id查找所有可以直接管辖的管理员
	 * @param id
	 * @return
	 * @throws NoDataMatchException
	 */
	public List<Manager_Role> findByAuthorityId(Integer id) throws NoDataMatchException{
		List<Manager_Role> roleList = managerMapper.findByAuthorityId(id);
		if(roleList.size()>0)
			return roleList;
		else
			throw new NoDataMatchException("the "+id+"wasn't manager just one");
	}

	/**
	 * 根据用户名查找权限
	 * @param userId
	 * @return
	 */
	public Integer queryAuthorityId(String userId) throws NoDataMatchException {
		int authorityId=managerMapper.queryAuthoirityId(userId);
		if(authorityId>0)
			return authorityId;
		else
			throw new NoDataMatchException("the "+userId+"wasn't manager just one");
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
