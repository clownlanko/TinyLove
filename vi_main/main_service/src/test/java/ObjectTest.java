import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.util.DigestContent;
import top.genitalbean.vi.mapper.impl.ShopTypeMapper;
import top.genitalbean.vi.service.impl.ManagerService;
import top.genitalbean.vi.service.impl.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
    @Autowired UserService userService;
    @Autowired ManagerService managerService;
    @Autowired
    ShopTypeMapper shopTypeMapper;
    @Test
    public void test(){
        System.err.println(shopTypeMapper.query().size());
    }
}
