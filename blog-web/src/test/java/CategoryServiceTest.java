import com.wj.blog.common.domain.Category;
import com.wj.blog.service.CategoryService;
import org.apache.shiro.mgt.SecurityManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.annotation.ApplicationScope;

@RunWith(SpringJUnit4ClassRunner.class)
@ApplicationScope()
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
public class CategoryServiceTest {


    @Autowired
    private SecurityManager securityManager;

    @Test
    public void fun1(){
        System.out.println(securityManager);
    }

}
