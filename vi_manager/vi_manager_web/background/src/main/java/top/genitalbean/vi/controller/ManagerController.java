package top.genitalbean.vi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.util.DateFormat;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.UserEntity;
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
	@RequestMapping("/logout.vi")
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
	public ResponseResult<Void> changePassword(String username,String oldPwd,String newPwd,HttpSession session){
		System.out.println("===========================");
		ResponseResult<Void> result=new ResponseResult<>();
		Manager_Role user = null;
		try{
			user = managerService.findByUser(username, oldPwd);
		} catch (NoDataMatchException e) {
			result.setState(-1);
			result.setMessage("请检查你的用户名或密码");
			return result;
		}
		if(user !=null?userService.changePassword(user.getUserId(),newPwd):false){
			result.setState(4);
			result.setMessage("修改成功");
			session.setAttribute("vim",managerService.findByUser(username,newPwd));
		}
		return result;
	}
	/**
	 * 修改个人信息
	 * @param userEntity
	 * @return
	 */
	@ResponseBody
	@PostMapping("/us.vi")
	public ResponseResult<Void> updateSelf(UserEntity userEntity,HttpSession session){
		Manager_Role manager_role= (Manager_Role) session.getAttribute("vim");
		ResponseResult<Void> rr=new ResponseResult<>();
		Manager_Role mr= null;
		try {
			mr = managerService.findByUser(manager_role.getUserName(),manager_role.getPassword());
		} catch (NoDataMatchException e) {
			rr.setState(-1);
			rr.setMessage("可能你的身份已过期，请重新登陆");
			return rr;
		}
		if(userEntity.getUserName()==mr.getUserName())
			userEntity.setUserName(null);
		if(userEntity.getPhone()==mr.getPhone())
			userEntity.setPhone(null);
		if(userEntity.getEmail()==mr.getEmail())
			userEntity.setEmail(null);
		userEntity.setModifyTime(DateFormat.now());
		if(userService.update(userEntity)){
			rr.setState(4);
			rr.setMessage("修改成功");
			session.setAttribute("vim",
					managerService.findByUser(userEntity.getUserName(),manager_role.getPassword()));
		}
		return rr;
	}
	/**
	 * 查询所有能直接管辖的员工
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@GetMapping("/vimall.vi")
	public ResponseResult<List<Manager_Role>> queryByAuthority(String userId){
		System.out.println("不知道她来了没有");
		ResponseResult<List<Manager_Role>> result = new ResponseResult<>();
		try {
			result.setState(4);
			result.setMessage("请尊重别人的隐私！");
			List<Manager_Role> rr=managerService.findByAuthorityId(managerService.queryAuthorityId(userId));
			System.out.println("所有数据："+rr.size());
			result.setData(rr);
		} catch (NoDataMatchException e) {
			result.setMessage("你没有权限哦");
			result.setState(3);
		}
		return result;
	}
}
