package top.genitalbean.vi.service.impl;

import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.mapper.impl.JobMapper;
import top.genitalbean.vi.pojo.ViJob;

import java.util.List;

@Service
public class JobService {
    @Autowired private JobMapper jobMapper;
    public ViJob findBuJob(@NonNull String jobName) throws NoDataMatchException{
        ViJob job = jobMapper.findByJob(jobName);
        if(job!=null)
            return job;
        else
            throw new NoDataMatchException("There's not any job named "+jobName);
    }
    public List<ViJob> query(){
        return jobMapper.query();
    }
}
