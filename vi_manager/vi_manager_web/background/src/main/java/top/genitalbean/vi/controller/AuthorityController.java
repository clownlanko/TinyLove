package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.AuthorityEntity;
import top.genitalbean.vi.service.impl.AuthorityService;

import java.util.List;

@Controller
@RequestMapping("/via.vi")
public class AuthorityController {
    @Autowired private AuthorityService authorityService;
    @ResponseBody
    @GetMapping("/show.vi")
    public ResponseResult<List<AuthorityEntity>> showDetaile(){
        ResponseResult<List<AuthorityEntity>> result = new ResponseResult<>();
        result.setState(4);
        result.setData(authorityService.queryGroupByAuthority());
        return result;
    }
}
