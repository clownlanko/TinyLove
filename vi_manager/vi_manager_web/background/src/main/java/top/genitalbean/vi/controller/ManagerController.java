package top.genitalbean.vi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.util.DateFormat;
import top.genitalbean.vi.commons.web.ResponseResult;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.RoleEntity;
import top.genitalbean.vi.pojo.UserEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.impl.JobService;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.RoleService;
import top.genitalbean.vi.service.impl.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/vim.vi")
public class ManagerController extends BaseController{
	@Autowired private ManagerService managerService;
	@Autowired private UserService userService;
	@Autowired private JobService jobService;
	@Autowired private RoleService roleService;
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
            System.out.println("ManagerController.login(...):"+e.getMessage());
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
		ResponseResult<List<Manager_Role>> result = new ResponseResult<>();
		try {
			result.setState(4);
			result.setMessage("请尊重别人的隐私！");
			result.setData(managerService.findByAuthorityId(roleService.queryAuthorityId(userId)));
		} catch (NoDataMatchException e) {
			result.setMessage("你没有权限查看别人的信息哦");
			result.setState(3);
		}
		return result;
	}
    /**
     * 根据userid查询个人数据
     */
    @ResponseBody
    @GetMapping("/fbui.vi")
    public ResponseResult<Manager_Role> findByUserId(String userId){
        ResponseResult<Manager_Role> result=new ResponseResult<>();
        try {
            result.setState(4);
            result.setData(managerService.findByUserId(userId));
        } catch (Exception e) {
            result.setState(-1);
            result.setMessage("没有找到"+userId+"用户哦");
        }
        return result;
    }
	/**
	 * 停用/启用管理员权限
	 */
	@ResponseBody
	@PutMapping("/cs.vi")
	public ResponseResult<Void> changeStatus(HttpSession session,String userId,Integer status,String jobName){
	    ResponseResult<Void> result=new ResponseResult<>();
		if(session.getAttribute("vim")==null){
			result.setMessage("你的身份信息已过期，请重新登陆!");
			result.setState(2);
			return result;
		}
		ManagerEntity manager=new ManagerEntity();
		manager.setUserId(userId);
		manager.setStatus(status==1?0:1);
		manager.setModifyTime(DateFormat.now());
		manager.setJobId(jobService.findBuJob(jobName).getJobId());
		if(managerService.update(manager)){
			result.setState(4);
			result.setMessage(status==1?"已停用！":"已启用");
		}
		return result;
	}
	/**
	 * 删除管理员
	 */
	@ResponseBody
	@PostMapping("/dm.vi")
	public ResponseResult<Void> deleteManager(String userId){
		ResponseResult<Void> result=new ResponseResult<>();
		ManagerEntity manager = null;
		try{
			manager = managerService.findById(userId);
		}catch (NoDataMatchException ex){
			result.setMessage("请稍后再试");
			result.setState(-1);
		}
		if(DateFormat.differenDate(manager.getModifyTime(),manager.getJoinTime())>6){
			if(managerService.delete(manager.getUserId())){
				result.setMessage("用户Id为"+
						userId+"已删除");
				result.setState(4);
			}
		}else{
			result.setState(3);
			result.setMessage("id为"+userId+"的用户离职还未超过6个月<br>暂不允许删除！");
		}
		return result;
	}
	/**
	 * 删除多个管理员
	 */
	@ResponseBody
	@PostMapping("/dms.vi")
	public ResponseResult<Void> deleteManagers(String[] userId){
		ResponseResult<Void> result = new ResponseResult<>();
		return result;
	}
	/**
	 * 添加管理员
	 * 没有此管理员		添加工作添加权限
	 * 有此管理员拥有此工作	不做任何处理
	 * 有此管理员没有此工作  添加工作判断
	 * 有此管理员拥有此权限	 不做任何处理
	 * 有此管理员没有此权限  添加权限
	 */
	@ResponseBody
	@PostMapping("/am.vi")
	public ResponseResult<Void> addManager(ManagerEntity manager,Integer authorityId){
		System.out.println("ManagerController.addManager(...)");
		ResponseResult<Void> result = new ResponseResult<>();
		if(addJob(manager)){
			if(addAuthority(manager.getUserId(),authorityId)){
				result.setState(4);
				result.setMessage("恭喜"+manager.getUserId()+"成为管理员<br>请您多多照顾");
			}else {
				result.setState(-1);
				result.setMessage("添加权限失败");
			}
		}else{
			result.setState(-1);
			result.setMessage("用户"+manager.getUserId()+"可能已经拥有此工作了");
		}
		return result;
	}

	/**
	 * 添加权限
	 * @param userId
	 * @param authorityId
	 * @return
	 */
	private boolean addAuthority(String userId, Integer authorityId){
		//判断该管理员是否拥有此权限
		boolean flag=true;
		try {
			//拥有此权限
			if(roleService.queryAuthorityId(userId) == authorityId){
				flag=false;
			}
		} catch (NoDataMatchException e) {//未拥有此权限
			flag=roleService.insert(new RoleEntity(userId,authorityId));
		}
		return flag;
	}

	/**
	 * 添加管理员职务
	 * @param manager
	 * @return
	 */
	private boolean addJob(ManagerEntity manager){
		//判断该管理员是否拥有此工作
		boolean flag=true;
		try {
			//有此工作
			if(managerService.findById(manager.getUserId()).getJobId()==manager.getJobId()){
				flag=false;
			}
		} catch (NoDataMatchException e) {//没与此工作
			manager.setJoinTime(DateFormat.now());
			manager.setModifyTime(DateFormat.now());
			flag=managerService.insert(manager);
		}
		return flag;
	}
}
