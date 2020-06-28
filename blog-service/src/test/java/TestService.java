import com.wj.blog.common.domain.Category;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.dao.UserMapper;
import com.wj.blog.service.CategoryService;
import com.wj.blog.service.UserService;
import org.apache.shiro.mgt.SecurityManager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.annotation.ApplicationScope;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ApplicationScope()
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestService {

    @Autowired
    private UserService userService;
    @Autowired
    private CategoryService categoryService;


   @Test
    public  void fun1(){
       User user = new User();
       user.setUserId(IdGenerator.getID());
       user.setUserName("哈哈啥！");
       user.setUserEmail("93@qq.sj");
       user.setUserPassword("12354");
       userService.register(user);
    }

    @Test
    public void fun2(){
        List<Category> categories = categoryService.findAll();
        System.out.println(categories);
    }
}

