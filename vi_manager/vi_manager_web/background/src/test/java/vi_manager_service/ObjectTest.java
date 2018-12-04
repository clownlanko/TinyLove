package vi_manager_service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.genitalbean.vi.commons.util.DateFormat;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
	@Test
	public void test() {
		Date s = new Date();
		s.setTime(123456753456L);
		Date e=new Date();
		e.setTime(12345678);
		System.out.println(DateFormat.decode(s,DateFormat.DATE_TIME));
		System.out.println(DateFormat.decode(e,DateFormat.DATE_TIME));
		System.out.println(DateFormat.differenDate(s,e));
	}
}
