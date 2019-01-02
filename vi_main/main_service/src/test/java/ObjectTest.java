import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.genitalbean.vi.commons.exception.NoDataMatchException;
import top.genitalbean.vi.commons.util.DigestContent;
import top.genitalbean.vi.service.impl.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ObjectTest {
    @Autowired UserService userService;
    @Test
    public void test(){
        try {
            System.out.println(userService.queryByKeywords("lanko",DigestContent.encode("123456")));
        } catch (NoDataMatchException e) {
            e.printStackTrace();
        }
    }
}
