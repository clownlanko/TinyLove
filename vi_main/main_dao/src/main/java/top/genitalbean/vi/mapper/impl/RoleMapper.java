package top.genitalbean.vi.mapper.impl;

import top.genitalbean.vi.mapper.BaseRepository;

public interface RoleMapper extends BaseRepository {
    Integer queryAuthoirityId(String userId);
}
