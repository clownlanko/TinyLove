package top.genitalbean.vi.service.impl;

import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.JobMapper;
import top.genitalbean.vi.pojo.JobEntity;

import java.util.List;

@Service
public class JobService {
    @Autowired private JobMapper jobMapper;
    public JobEntity findBuJob(@NonNull String jobName) throws NoDataMatchException{
        JobEntity job = jobMapper.findByJob(jobName);
        if(job!=null)
            return job;
        else
            throw new NoDataMatchException("There's not any job named "+jobName);
    }
    public List<JobEntity> query(){
        return jobMapper.query();
    }
}
