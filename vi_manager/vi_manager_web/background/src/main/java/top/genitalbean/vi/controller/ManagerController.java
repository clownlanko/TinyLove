package top.genitalbean.vi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.UserService;

import java.util.List;

@Controller
@RequestMapping("/vim.vi")
public class ManagerController extends BaseController{
	@Autowired private ManagerService managerService;
	@Autowired private UserService userService;
	/**
	 * 用户登陆
	 * @param name
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/login.vi")
	@ResponseBody
	public ResponseResult<Manager_Role> login(@RequestParam("name") String name,
											  @RequestParam("password") String password,
											  HttpSession session) {
		Manager_Role manager;
		ResponseResult<Manager_Role> result  = new ResponseResult<>();
		try {
			manager = managerService.findByUser(name, password);
			result.setState(4);
			result.setMessage("登陆成功");
			result.setData(manager);
			session.setAttribute("vim",manager);
		} catch (NoDataMatchException e) {
			result.setState(-1);
			result.setMessage("请检查你的用户名或密码");
		}
		return result;
	}

	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@DeleteMapping("/logout.vi")
	@ResponseBody
	public ResponseResult<Void> logout(HttpSession session){
		session.removeAttribute("vim");
		ResponseResult<Void> rr=new ResponseResult<>();
		rr.setState(4);
		rr.setMessage("欢迎再次登陆");
		return rr;
	}
	/**
	 * 修改密码
	 * @param username
	 * @param oldPwd
	 * @param newPwd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/changepwd.vi")
	public ResponseResult<Void> changePassword(String username,String oldPwd,String newPwd){
		ResponseResult<Void> result=new ResponseResult<>();
		System.out.println("===========================");
		System.out.println(username+"==="+oldPwd+"=="+newPwd);
		Manager_Role user = null;
		try{
			user = managerService.findByUser(username, oldPwd);
		} catch (NoDataMatchException e) {
			result.setState(-1);
			result.setMessage("请检查你的用户名或密码");
			return result;
		}
		if(user !=null?userService.changePassword(user.getId(),newPwd):false){
			result.setState(4);
			result.setMessage("修改成功");
		}
		return result;
	}
	/**
	 * 查询所有能直接管辖的员工
	 * @param authorityId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/vimall.vi")
	public ResponseResult<List<Manager_Role>> queryByAuthority(Integer authorityId){
		System.out.println("不知道她来了没有");
		ResponseResult<List<Manager_Role>> result = new ResponseResult<>();
		try {
			result.setData(managerService.findById(authorityId));
			result.setState(4);
			result.setMessage("请尊重别人的隐私！");
		} catch (NoDataMatchException e) {
			result.setMessage("你没有权限哦");
			result.setState(3);
		}
		return result;
	}
}
