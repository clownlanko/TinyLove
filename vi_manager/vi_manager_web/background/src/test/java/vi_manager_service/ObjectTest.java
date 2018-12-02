package vi_manager_service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
	@Autowired private UserService userService;
	@Autowired private ManagerService managerService;
	@Test 
	public void test() {
		System.out.println(managerService.findByAuthorityId(101));
	}
}
