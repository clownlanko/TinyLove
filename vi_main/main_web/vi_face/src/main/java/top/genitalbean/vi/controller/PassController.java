package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.util.*;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.ViUser;
import top.genitalbean.vi.service.impl.UserService;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/pc")
public class PassController extends BaseController {
    @Autowired private CheckPhoneNumber checkPhoneNumber;
    @Autowired private SendVerificationCode sendVerificationCode;
    @Autowired private UserService userService;
    /**
     * 检查手机号是否可用
     * @param phone
     * @return
     * @throws IOException
     */
    @ResponseBody@GetMapping("/cp")
    public ResponseResult<Void> checkPhoneNumber(@RequestParam("phone")String phone) throws IOException {
        ResponseResult<Void> result = new ResponseResult<>();
        if(!checkPhoneNumber.check(phone)) {
            result.setState(-1);
            result.setMessage(phone+"不可用，请检查!");
        }else{
            result.setState(4);
        }
        return result;
    }

    /**
     * 发送验证码
     * @param session
     * @param phone
     * @return
     * @throws IOException
     */
    @ResponseBody@GetMapping("/sac")
    public ResponseResult<Void> sendActiveCode(HttpSession session,@RequestParam("phone")String phone) throws IOException {
        ResponseResult<Void> result = new ResponseResult<>();
        String code = IDFactory.generateVerificationCode();
        System.err.println(phone+"的验证码:"+code);
        if(!sendVerificationCode.send(phone,  code)){
            result.setState(-1);
            result.setMessage("当前访问用户较多，请稍后再试!");
        }else{
            result.setState(4);
            session.setMaxInactiveInterval(5*60);
            session.setAttribute(phone,code);
            result.setMessage("验证码已发送");
        }
        return result;
    }

    /**
     * 注册用户
     * @param session
     * @param user
     * @param code
     * @return
     */
    @ResponseBody@GetMapping("/reg")
    public ResponseResult<Void> register(HttpSession session, ViUser user, @RequestParam("activeCode")String code){
        ResponseResult<Void> result = new ResponseResult<>();
        if(session.getAttribute(user.getPhone())==null || !session.getAttribute(user.getPhone()).equals(code)){
            result.setState(-1);
            result.setMessage("验证码输入错误<br>或验证码已失效");
        }else{
            //判断该手机号是否已被绑定
            try {
                userService.queryByPhone(user.getPhone());
                result.setState(-1);
                result.setMessage(user.getPhone()+"已经被绑定,请更换!<br>若忘记密码,请尝试点击忘记密码做更改.<br>验证码在有效时间内依然可用哦");
            } catch (NoDataMatchException e) {
                user.setPassword(DigestContent.encode(user.getPassword()));
                user.setUserId(IDFactory.generateUserId());
                user.setCreateTime(DateFormat.now());
                user.setModifyTime(DateFormat.now());
                if(userService.insert(user)){
                    session.removeAttribute(user.getPhone());
                    session.setAttribute("user",user);
                    result.setState(4);
                    result.setMessage("注册成功即将跳转...");
                }else {
                    result.setState(1);
                    result.setMessage("当前注册用户较多,请稍后再试!");
                }
            }
        }
        return result;
    }

    /**
     * 忘记密码作修改密码
     * @param session
     * @param user
     * @param code
     * @return
     */
    @ResponseBody@GetMapping("/cps")
    public ResponseResult<Void> changePassword(HttpSession session, ViUser user, @RequestParam("activeCode")String code){
        ResponseResult<Void> result = new ResponseResult<>();
        if(session.getAttribute(user.getPhone())==null || !session.getAttribute(user.getPhone()).equals(code)){
            result.setState(-1);
            result.setMessage("验证码输入错误<br>或验证码已失效");
        }else{
            try {
                if(userService.changePassword(userService.queryByAccountAndPhone(user.getUserName(), user.getPhone()).getUserId(),DigestContent.encode(user.getPassword()))){
                    session.removeAttribute(user.getPhone());
                    result.setState(4);
                    result.setMessage("更改成功");
                }
            } catch (NoDataMatchException e) {
                result.setState(1);
                result.setMessage("你还没有注册哦,请先注册!<br>验证码在有效时间内依然可用于注册哦(^v^)");
            }
        }
        return result;
    }

    /**
     * 登陆
     * @param session
     * @param key
     * @param password
     * @return
     */
    @ResponseBody@GetMapping("/log")
    public ResponseResult<Void> login(HttpSession session,@RequestParam("key")String key,@RequestParam("password")String password) {
        ResponseResult<Void> result = new ResponseResult<>();
        try {
            session.setAttribute("user",userService.queryByKeywords(key, DigestContent.encode(password)));
            result.setState(4);
            result.setMessage("登陆成功，即将跳转...");
        } catch (NoDataMatchException e) {
            result.setState(-1);
            result.setMessage("用户名或密码错误,请检查后再试");
        }
        return result;
    }
}
