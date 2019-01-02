package top.genitalbean.vi.mapper.impl;

import top.genitalbean.vi.mapper.BaseRepository;
import top.genitalbean.vi.pojo.ViJob;

public interface JobMapper extends BaseRepository {
    ViJob findByJob(String jobName);
}
