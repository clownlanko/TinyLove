package top.genitalbean.vi.mapper.impl;

import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ViAuthority;

import java.util.List;

public interface AuthorityMapper extends BaseRepository {
    List<ViAuthority> queryGroupByAuthority(Integer parentId);
    Integer findByUserId(String userId);
}
