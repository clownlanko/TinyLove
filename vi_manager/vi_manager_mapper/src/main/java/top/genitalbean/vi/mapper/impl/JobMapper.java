package top.genitalbean.vi.mapper.impl;

import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.JobEntity;

public interface JobMapper extends BaseRepository {
    JobEntity findByJob(String jobName);
}
