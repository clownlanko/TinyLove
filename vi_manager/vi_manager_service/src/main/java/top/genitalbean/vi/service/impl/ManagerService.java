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
		Manager_Role manager = managerMapper.findByUser(name, password);
		if(manager.getUserName().equals(name) && manager.getPassword().equals(password)) {
			return manager;
		}else {
			throw new NoDataMatchException("No manager of named "+name +" or the password is missing.");
		}
	}

	/**
	 * 根据用户id查询管理员
	 * @param userId
	 * @return
	 */
	public ManagerEntity findById(String userId)throws NoDataMatchException{
        ManagerEntity manager = managerMapper.findById(userId);
        if(manager!=null)
            return manager;
        else
            throw new NoDataMatchException("No manager of userId as "+userId);
    }
    /**根据用户id和职务id查找
     */
	public ManagerEntity findByUserIdAndJobId(String userId,Integer jobId)throws NoDataMatchException{
		ManagerEntity manager = managerMapper.findByUserIdAndJobId(userId,jobId);
		if(manager!=null)
			return manager;
		else
			throw new NoDataMatchException("No manager of userId as "+userId);
	}
	/**
     * 根据用户id查找
	 */
    public Manager_Role findByUserId(String userId)throws NoDataMatchException{
        Manager_Role manager=managerMapper.findByUserId(userId);
        if(manager==null){
            throw new NoDataMatchException("No manager of userId as "+userId);
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
	public boolean deleteByMultipartId(String[] userId){
		Integer integer = managerMapper.deleteByMultipartId(userId);
		System.out.println(integer+"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		return integer ==userId.length;
	}
	@Override
	public <T> boolean insert(T t) {
		return managerMapper.insert(t)==1;
	}

	@Override
	public <T> boolean delete(T e) {
		return false;
	}

	@Override
	public <T> boolean update(T t) {
		return managerMapper.update(t)==1;
	}

	@Override
	public <T> List<T> query() {
		return null;
	}
}
