package top.genitalbean.vi.mapper.impl;

import org.apache.ibatis.annotations.Param;
import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.UserEntity;

public interface UserMapper extends BaseRepository<UserEntity> {
    Integer changePassword(@Param("userId") String userId, @Param("password")String password);
}
