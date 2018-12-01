package top.genitalbean.vi.mapper.impl;

import org.apache.ibatis.annotations.Param;
import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;

import java.util.List;

public interface ManagerMapper extends BaseRepository<ManagerEntity>{
	Manager_Role findByUser(@Param("name") String name,@Param("password") String password);
	List<Manager_Role> findById(Integer authorityId);
}
