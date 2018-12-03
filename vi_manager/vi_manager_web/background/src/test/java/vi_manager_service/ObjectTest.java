package vi_manager_service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.genitalbean.vi.commons.util.DateFormat;
import top.genitalbean.vi.pojo.ManagerEntity;
import top.genitalbean.vi.pojo.vo.Manager_Role;
import top.genitalbean.vi.service.impl.AuthorityService;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
	@Autowired private ManagerService managerService;
	@Test
	public void test() {
		ManagerEntity manager=new ManagerEntity();
		Integer status=1;
		manager.setUserId("VIU000005");
		manager.setStatus(status==1?status:-1);
		manager.setModifyTime(DateFormat.now());
		System.out.println(managerService.update(manager));
	}
}
