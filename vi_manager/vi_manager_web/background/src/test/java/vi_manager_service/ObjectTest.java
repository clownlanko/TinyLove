package vi_manager_service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.genitalbean.vi.controller.ManagerController;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.RoleEntity;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.RoleService;

import javax.management.relation.Role;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
	@Autowired private ManagerService managerService;
	@Autowired private RoleService roleService;
	@Test
	public void test() {
		ManagerController managerController=new ManagerController();
		ManagerEntity manager = new ManagerEntity();
		manager.setUserId("VIU000008");
		manager.setJobId(200);
		manager.setSalary(100D);
		manager.setStatus(1);
		System.out.println(managerService.findByUserIdAndJobId(manager.getUserId(),manager.getJobId()));
//		if(managerController.addJob(manager)){
//			if(managerController.addAuthority(manager.getUserId(),100)){
//				System.out.println(roleService.insert(new RoleEntity(manager.getUserId(), 100)));
//			}else {
//				System.out.println("已拥有此权限");
//			}
//		}else{
//			System.out.println("已拥有此工作");
//		}
	}
}
