package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.JobEntity;
import top.genitalbean.vi.service.impl.JobService;

import java.util.List;

@Controller
@RequestMapping("/vij.vi")
public class JobController {
    @Autowired private JobService jobService;
    @GetMapping("/query.vi")
    @ResponseBody
    public ResponseResult<List<JobEntity>> query(){
        return new ResponseResult<>(jobService.query());
    }
}
