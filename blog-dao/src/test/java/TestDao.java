import com.wj.blog.common.domain.Blog;
import com.wj.blog.common.domain.BlogCriteria;
import com.wj.blog.common.domain.Config;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.utils.Base64Utils;
import com.wj.blog.common.utils.RSAUtils;
import com.wj.blog.dao.BlogMapper;
import com.wj.blog.dao.ConfigMapper;
import com.wj.blog.dao.UserMapper;
import org.apache.ibatis.type.JdbcType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.annotation.ApplicationScope;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ApplicationScope()
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestDao {

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ConfigMapper configMapper;

    @Test
    public  void fun3() throws Exception {
        Config config = configMapper.selectFirst();
        System.out.println(config);
    }


    @Test
    public  void seleUser(){
        List<User> users = userMapper.findAll();
        for (User user: users
             ) {
            System.out.println(user);
        }
    }


    @Test
    public  void fun1(){
       Blog blog = blogMapper.selectByPrimaryKey("1");
       System.out.println(blog);
    }

    /**
     *  test findName
     */
    @Test
    public  void testFindByName(){
        User user = userMapper.findUserByName("西西的美丽");
        System.out.println(user);
    }

    /**
     *  测试 findByHot
     */
    @Test
    public  void fun2(){
        List<Blog> blogs = blogMapper.selectByDate(new BlogCriteria(),3,5);
        for (Blog blog:blogs
             ) {
            System.out.println(blog);
        }
    }


    /**
     *  生成Hash码
     */
    @Test
    public  void fun5() throws NoSuchAlgorithmException {
         String namePwd= new String("西西里的美丽123");
        String str = Base64Utils.md5(namePwd);
        System.out.println(str);
    }

    /**
     * 测试RAS编码
     */
    @Test
    public  void testRSA(){
        try {
            Map<String,Object> map = RSAUtils.genKeyPair();

            String msg= "admin";

            //公钥
            //String publicKey = RSAUtils.getPublicKey(map);
            String pk =  "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCb4BEBx/svHEpMgAIQBQwTm1XMlIkMfLWp8pOrHlzuJI7Q13GcqGY7S5JEm3Rb/KdKyYohtO+KGIFAyBt7h4eBr9c2kcUYgUXU6H7jQTBwrNHJqtdWd4nODyolsfGK2LhwFFm1wm69IdVKDLYdD6xs3ZsmxmO7LawHYWrI+DkVbwIDAQAB";

            //私钥
           //String privateKey =RSAUtils.getPrivateKey(map);
            String prk = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJvgEQHH+y8cSkyAAhAFDBObVcyUiQx8tanyk6seXO4kjtDXcZyoZjtLkkSbdFv8p0rJiiG074oYgUDIG3uHh4Gv1zaRxRiBRdTofuNBMHCs0cmq11Z3ic4PKiWx8YrYuHAUWbXCbr0h1UoMth0PrGzdmybGY7strAdhasj4ORVvAgMBAAECgYA4LH20iJ9LEQTtoMwdfdQmVLqM6ZKiP2cwgc0Zw+11nRMizCGTdVSyVb+2nddHNzwKxarUDuKsf7xE3liZIfSBBhrdi3HnUypleqR40KnXfq2pO9qP+CSBMyNatQbccV7HJUHKM68c9QDhmHMBoiUwM65IoJwjR+NLmRj34759UQJBAMx0LOeeG3Ijw7l5neToyKYfETYk/XfQlfWcVNjpkBwnypaMg52tWzkk7c/0azPgxltttiOvkkvQAIZDUO4M4DUCQQDDLIrHGVKiPt7mdq0qekCBmh3UR2NwtMKxjohqiohLPShMYumilYq01gJYJs1E7T+G2tIBUlOLh6j8AzC1y9uTAkBEYUqvgKrPRvTsMKfFarHJFbTs9fwsOYAeMFYUYjGHqStRpNdUQimzeA1tsuKz7CaLZ6s2Tj9QydWTEiqcI4RNAkEAjsKI7CMgp153annKJjTv9ByHzxs8qFb/xiJstAmKsgYU8PK01GCv6aBUbKhNIyqqefia/a57P6dGOrgWrBNmEwJAEsHDPSOq5NYzz5227w6vNgBn5MjwZD3dIfuOOy1nN/4QK7M44oWkSAmEtqTNMgOny9nGNaA/skhd6mk2SLAMXg==";
            //公钥加密

            byte[] enMsg = RSAUtils.encryptByPublicKey(msg.getBytes("utf-8"),pk);
            String e = new String(enMsg);
            System.out.println("公钥加密后："+new String(enMsg,"utf-8"));

            //私钥解密

            byte[] unMsg = RSAUtils.decryptByPrivateKey(e.getBytes(),prk);

            System.out.println("私钥解密后:"+new String(unMsg));

            //私钥加密
//            byte[] enMsg = RSAUtils.encryptByPrivateKey(msg.getBytes(),privateKey);
//            System.out.println("私钥加密后："+new String(enMsg));
//
//            //公钥解密
//            byte[] unMsg = RSAUtils.decryptByPublicKey(enMsg,publicKey);
//            System.out.println("公钥解密后："+new String(enMsg));

//            System.out.println("公钥"+publicKey);
//
//            System.out.println("私钥"+privateKey);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
