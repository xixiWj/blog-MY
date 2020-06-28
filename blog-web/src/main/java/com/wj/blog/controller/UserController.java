package com.wj.blog.controller;

import com.sun.mail.smtp.SMTPAddressFailedException;
import com.wj.blog.common.domain.User;
import com.wj.blog.common.domain.UserException;
import com.wj.blog.common.utils.CheckUtil;
import com.wj.blog.common.utils.IdGenerator;
import com.wj.blog.common.utils.RSAUtils;
import com.wj.blog.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Controller
@RequestMapping("/user")
public class UserController {

    //注入用户服务
    @Autowired
    UserService userService  ;



    /**
     * 跳转更新密码页面
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Object updatePwd(String userEmail,String userPassword,String verifyCode,HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            if(userEmail == null || userEmail.trim().equals("")){
                map.put("result", false);
                map.put("msg","邮箱不能为空");
                return map;
            }
            //检查密码强度
            if(CheckUtil.checkPwd(userPassword)){
                //获取验证码
                String vCode = (String) req.getSession().getAttribute("verifyCode");
                if(!verifyCode .equals( vCode)){
                    map.put("result", false);
                    map.put("msg","验证码错误");
                    return map;
                }else {
                    //更新密码操作
                    userService.updatePwd(userEmail, userPassword);
                    map.put("result", true);
                    map.put("msg","更新密码成功");
                }
            }else{
                map.put("result", false);
                map.put("msg","密码必须包含大小写字母，特殊字符，数字三种以上");
            }
        } catch (Exception e) {
            map.put("result", false);
            map.put("msg","请重试！");
            e.printStackTrace();
        }finally {
            return map;
        }
    }




    /**
     * 跳转更新密码页面
     * @return
     */
    @RequestMapping("/updatePwdUI")
    public String updatePwdUI(String userEmail,HttpServletRequest request){
        request.setAttribute("userEmail",userEmail);
        return "updatePwdUI";
    }

    /**
     * 忘记密码
     * @param userEmail
     * @return
     */
    @RequestMapping("/forgetPwd")
    @ResponseBody
    public Map<String,Object> forgetPwd(String userEmail){
        Map<String,Object> map = new HashMap<>();
        try {
                if(!checkEmailPvt(userEmail)){
                    map.put("result", true);
                }else {
                    map.put("result", false);
                    map.put("msg","邮箱未注册");
                }
        } catch (Exception e) {
            map.put("result", false);
            map.put("msg","请重试！");
            e.printStackTrace();
        }finally {
            return map;
        }
    }

    /**
     * 跳转至忘记密码页面
     * @param req
     */
    @RequestMapping("toForgetPwd")
    public String toForgetPwd(HttpServletRequest req) {
        return "forgetPwd";
    }

    /**
     * 用户退出
     * @param req
     */
    @RequestMapping("exit")
    @ResponseBody
    public Object exit(HttpServletRequest req) {
        Map<String,Object> map = new HashMap<>();
        try {
            //清楚session中保存的用户信息 实现用户退出
            req.getSession().invalidate();
            map.put("result", true);
        } catch (Exception e) {
            map.put("result", false);
            e.printStackTrace();
        }finally {
            return map;
        }
    }

    /**
     * 注册用户时 检查用户名是否已经存在
     * @param userName 注册的用户名
     */
    @RequestMapping("checkName")
    @ResponseBody
    public Object checkName(String userName) {
        Map<String,Boolean> map = new HashMap<>();
        boolean result = true;
        try {
          result = checkNamePvt(userName);
        }catch (Exception e){
            result =false;
        }finally {
            map.put("valid", result);
            return map;
        }
    }

    /**
     * 检查用户名
     * @param userName
     * @return
     * @throws Exception
     */
    private boolean checkNamePvt (String userName) throws Exception{
        boolean rs = true;
        List<User> users = userService.findAllUser();
        for (User user : users) {
            if(user.getUserName().equals(userName)) {
                rs = false;
                return rs;
            }
        }
        return rs;
    }

    /**
     * 检查邮箱
     * @param userEmail
     * @return
     * @throws Exception
     */
    private boolean checkEmailPvt (String userEmail) throws Exception{
        boolean rs = true;
        List<User> users = userService.findAllUser();
        for (User user : users) {
            if(user.getUserEmail().equals(userEmail)) {
                rs = false;
                break;
            }
        }
        return rs;
    }




    /**
     * 注册时邮箱是否已经注册
     * @param userEmail
     */
    @RequestMapping("checkEmail")
    @ResponseBody
    public Object checkEmail(String userEmail) {
        Map<String,Object> map = new HashMap<>();
        boolean result = true;
        String msg = "";
        try{
         result = checkEmailPvt(userEmail);
         if(result==false){
             msg = "邮箱已存在！";
         }
        }catch (Exception e){
            result=false;
            msg = "服务器拉闸了";
            e.printStackTrace();
        }finally {
            map.put("valid", result);
            map.put("msg",msg);
            return map;
        }

    }

    /**
     * 返回登录页面
     * @param
     */
    @RequestMapping("toLogin")
    public String toLogin() {
        return "login";
    }


    /**
     * 返回注册页面
     * @param
     */
    @RequestMapping("toRegister")
    public String toRegister() {
        return "register";
    }

    /**
     * 注册用户
     * @param user
     */
    @RequestMapping("register")
    @ResponseBody
    public Object register(User user,HttpServletRequest req) {
        Map<String,Object> map = new HashMap<>();
        try{
           String defalutImg =  req.getScheme()+"://"+req.getServerName()+":"+
                    req.getServerPort()+"/dist/img/c_2.jpg";
           user.setDefalutImg(defalutImg);
            String userCode = user.getVerifyCode();
            String vCode = (String) req.getSession().getAttribute("verifyCode");
            if(user.getUserName()==null||user.getUserName().trim().equals("")){
                map.put("result", false);
                map.put("msg","用户名不能为空");
                return map;
            }
            if(user.getUserEmail()==null||user.getUserEmail().trim().equals("")){
                map.put("result", false);
                map.put("msg","邮箱不要为空");
                return map;
            }
            if(user.getUserPassword()==null||user.getUserPassword().trim().equals("")){
                map.put("result", false);
                map.put("msg","密码不能为空");
                return map;
            }
            if(user.getVerifyCode()==null||user.getVerifyCode().trim().equals("")){
                map.put("result", false);
                map.put("msg","验证码不能为空");
                return map;
            }
            /* 判断用户名是否多次注册 */
            if(!checkNamePvt(user.getUserName())) {
                map.put("result", false);
                map.put("msg","用户已注册！");
                return map;
            }
            /* 判断邮箱是否多次注册 */
            if(!checkEmailPvt(user.getUserEmail())) {
                map.put("result", false);
                map.put("msg","邮箱已注册！");
                return map;
            }
            /* 判断验证码是否正确 */
            if(!userCode.equalsIgnoreCase(vCode)) {
                map.put("result", false);
                map.put("msg","验证码错误！");
                return map;
            }
            //注册用户
            userService.register(user);
            map.put("result", true);
            map.put("msg","用户注册成功！");
        }catch (Exception e){
            map.put("result", false);
            map.put("msg","服务器拉闸！");
        }finally {
            return map;
        }
    }

    /**
     * 登陆用户
     * @param
     */
    @RequestMapping("getPublicKey")
    @ResponseBody
    public Object getPublicKey(String key,String userName,HttpServletRequest req) {
        Map<String,Object> keyMap =null ;
        Map<String,Object> res = new HashMap<>();
        try {
            keyMap = RSAUtils.genKeyPair();
            //获取公钥
            String publicKey = RSAUtils.getPublicKey(keyMap);
            //私钥
            String privateKey= RSAUtils.getPrivateKey(keyMap);

            req.getServletContext().setAttribute(userName,privateKey);

            //返回公钥
            res.put("publicKey",publicKey);
            //
            res.put("rel",1);


        } catch (Exception e) {

        }finally {
           return res;
        }
    }
    /**
     * 退出用户
     * @param
     * @param req
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Object userLogout( HttpServletRequest req){
        Map<String,Object> map = new HashMap<>();
        try {
            map.put("rel",1);
            map.put("msg","用户已退出");
            //获取当前主体，当前状态为没有认证的状态"未认证"
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
        }catch (Exception e){
            e.printStackTrace();
            map.put("rel",0);
            map.put("msg","服务器连接失败请重试");
        } finally{
            return map;
        }
    }

    /**
     * 登陆用户
     * @param
     */
    @RequestMapping("loginVer")
    @ResponseBody
    public Object loginVer(String userName , String userPassword,String rememberme, HttpServletRequest req, Model model) {
        Map<String,Object> res = new HashMap<>();
        boolean rememberMe = false;
        Integer failCount = (Integer) req.getSession().getAttribute(userName);
        if(failCount==null){
            failCount = 0;
            req.getSession().setAttribute(userName,failCount);
        }
        try {
            if(failCount>=3){
                res.put("result",0);
                res.put("msg","已经禁止登录，稍后重试！");
                return res;
            }
            if(userName==null){
                model.addAttribute("msg","用户名不能为空");
                return "login";
            }
            if(rememberme!=null&&rememberme.equals("forever")){
                rememberMe = true;
            }
            //获取当前主体，当前状态为没有认证的状态"未认证"
            Subject subject = SecurityUtils.getSubject();
            //获取私钥
            String privateKey = (String) req.getServletContext().getAttribute(userName);
            //登录后存放进shiro token
            UsernamePasswordToken token = new UsernamePasswordToken(userName,userPassword,rememberMe,privateKey);
            User user;
            //开始登录
            subject.login(token);
            req.getSession().setAttribute("user",(User)subject.getPrincipal());
            req.getSession().setAttribute(userName,0);
            res.put("msg","登录完成");

            res.put("result",1);


        }catch (DisabledAccountException e){
            res.put("result",0);
            res.put("msg",e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            //取得当前登录失败次数
            failCount++;
            res.put("result",0);
            res.put("msg","登录失败，你还有"+(4-failCount)+"次机会");
            req.getSession().setAttribute(userName,failCount);
        }
        finally {
            return res;
        }
    }

    /**
     * 忘记密码时 的 邮箱验证码
     *
     * @param req
     */
    @RequestMapping("forgetPwdCode")
    @ResponseBody
    public Object forgetPwdCode(String userEmail,HttpServletRequest req) throws Exception {
        Map<String, Object> map = new HashMap<>();
        if (userEmail == null || userEmail.equals("")) {
            map.put("valid", false);
            map.put("msg", "邮箱不能为空");
            return map;
        }
        Properties properties = new Properties();
        //创建Session
        properties.setProperty("mail.host", "smtp.qq.com");
        properties.setProperty("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication("936933494", "irnobcskpifdbeha");
            }
        };
        Session session = Session.getInstance(properties, authenticator);

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("936933494@qq.com"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("来自源流博客的注册验证码");
            String code = IdGenerator.getID().substring(12, 16);
            System.out.println(code);
            message.setContent("本次验证码为：<font color='red'>" + code + "</font>,非本人操作请无视！",
                    "text/html;charset=utf-8");
            Transport.send(message);
            req.getSession().setAttribute("verifyCode", code);
            map.put("valid", true);
        } catch (Exception e) {
            if (e instanceof SendFailedException) {
                map.put("msg", "邮箱格式错误，请重试");
            } else {
                map.put("msg", "服务器拉闸！");
            }
            map.put("valid", false);
            e.printStackTrace();

        } finally {
            return map;
        }
    }



    /**
     * 注册邮箱 验证码发送
     *
     * @param req
     */
    @RequestMapping("emailCode")
    @ResponseBody
    public Object emailCode(String userEmail,HttpServletRequest req) throws Exception {
        Map<String,Object> map = new HashMap<>();
        if (userEmail==null||userEmail.equals("")){
            map.put("valid",false);
            map.put("msg","邮箱不能为空");
            return map;
        }
        if(!checkEmailPvt(userEmail)){
            map.put("valid",false);
            map.put("msg","邮箱已注册");
            return map;
        }
        Properties properties = new Properties();
        //创建Session
        properties.setProperty("mail.host", "smtp.qq.com");
        properties.setProperty("mail.smtp.auth", "true");
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication("936933494","irnobcskpifdbeha");
            }
        };
        Session session = Session.getInstance(properties, authenticator);

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("936933494@qq.com"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("来自源流博客的注册验证码");
            String code=  IdGenerator.getID().substring(12,16);
            System.out.println(code);
            message.setContent("本次验证码为：<font color='red'>"+code+"</font>,非本人操作请无视！",
                    "text/html;charset=utf-8");
            Transport.send(message);
            req.getSession().setAttribute("verifyCode",code);
            map.put("valid",true);
        } catch (Exception e) {
            if(e instanceof SendFailedException){
                map.put("msg","邮箱格式错误，请重试");
            }else {
                map.put("msg","服务器拉闸！");
            }
            map.put("valid",false);
            e.printStackTrace();

        }finally {
            return map;
        }

    }

}
