package top.genitalbean.vi.mapper.impl;

import org.apache.ibatis.annotations.Param;
import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ViUser;

public interface UserMapper extends BaseRepository {
    Integer changePassword(@Param("userId") String userId, @Param("password")String password);
    ViUser queryByAccountAndPhone(@Param("userName")String userName, @Param("phone")String phone);
    ViUser queryByKeywords(@Param("keywords") String keywords, @Param("password")String password);
    ViUser queryByPhone(@Param("phone")String phone);
}
