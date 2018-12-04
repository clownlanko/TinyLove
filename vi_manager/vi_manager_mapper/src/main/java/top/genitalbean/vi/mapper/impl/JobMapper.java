package top.genitalbean.vi.mapper.impl;

import top.genitalbean.vi.pojo.JobEntity;

public interface JobMapper {
    JobEntity findByJob(String jobName);
}
