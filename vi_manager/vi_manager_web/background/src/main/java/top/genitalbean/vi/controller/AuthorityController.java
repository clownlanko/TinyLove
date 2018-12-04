package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.AuthorityEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.impl.AuthorityService;
import top.genitalbean.vi.service.impl.ManagerService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/via.vi")
public class AuthorityController {
    @Autowired private AuthorityService authorityService;

    /**
     * 查询直系管理员
     * @param userId
     * @return
     */
    @ResponseBody
    @GetMapping("/show.vi")
    public ResponseResult<List<AuthorityEntity>> showDetaile(String userId){
        Integer authorityId = null;
        ResponseResult<List<AuthorityEntity>> result = new ResponseResult<>();
        try {
            authorityId = authorityService.findByUserId(userId);
        }catch (NoDataMatchException ex){
            result.setState(-1);
            result.setMessage("你没有权限哦<br>或者你的登录信息已过期，请重新登录");
            System.out.println("AuthorityController.showDetaile(...):"+ex.getMessage());
        }
        System.out.println("AuthorityController.showDetaile(...):"+authorityId);
        result.setState(4);
        result.setData(authorityService.queryGroupByAuthority(authorityId));
        return result;
    }
}
