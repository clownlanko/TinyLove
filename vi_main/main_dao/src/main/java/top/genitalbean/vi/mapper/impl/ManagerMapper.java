package top.genitalbean.vi.mapper.impl;

import org.apache.ibatis.annotations.Param;
import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ViManager;
import top.genitalbean.vi.pojo.vo.ManagerRole;

import java.util.List;

public interface ManagerMapper extends BaseRepository{
    ManagerRole findByUserId(String userId);
	ManagerRole findByUser(@Param("name") String name, @Param("password") String password);
	List<ManagerRole> findByAuthorityId(Integer authorityId);
	ViManager findById(String userId);
	Integer deleteByMultipartId(String[] userId);
	ViManager findByUserIdAndJobId(@Param("userId") String userId, @Param("jobId") Integer jobId);
}
