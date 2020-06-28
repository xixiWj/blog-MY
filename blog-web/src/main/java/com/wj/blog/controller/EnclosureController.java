package com.wj.blog.controller;

import com.wj.blog.common.domain.Enclosure;
import com.wj.blog.common.domain.User;
import com.wj.blog.service.EnclosureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/enclosure")
public class EnclosureController {

    @Autowired
    private EnclosureService enclosureService;


    @RequestMapping("select")
    public String selectAll(String pcStr){
        int pc =1;
        if(pcStr!=null){
            pc = Integer.parseInt(pcStr);
        }

        return "admin/";
    }

    /*
     *上传文件的方法
     */
    @RequestMapping("/upload")
    @ResponseBody
    public Object  springUpload(HttpServletRequest request) throws IllegalStateException, IOException
    {
        Map<String,Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        System.out.println("**********开始上传************");
        long  startTime=System.currentTimeMillis();
        String path = request.getServletContext().getRealPath("/dist/img/enclosure/");
        try {
            String filePath = null;
            String fileName =null;
            //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            //检查form中是否有enctype="multipart/form-data"
            if (multipartResolver.isMultipart(request)) {
                //将request变成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                //获取multiRequest 中所有的文件名
                Iterator iter = multiRequest.getFileNames();

                while (iter.hasNext()) {
                    //一次遍历所有文件
                    MultipartFile file = multiRequest.getFile(iter.next().toString());
                    if (file != null) {
                        //new 一个附件对象
                        Enclosure enclosure = new Enclosure();
                        Date eCreated = new Date();
                        System.out.println("文件名：" + eCreated.getTime() + "_" + file.getOriginalFilename());
                         fileName= eCreated.getTime() + "_" + file.getOriginalFilename();
                        filePath = path + fileName;
                        File fileTo = new File(filePath);
                        if(!fileTo.getParentFile().exists()){
                            fileTo.getParentFile().mkdirs();
                        }
                        //设置上传时间
                        enclosure.seteCreated(eCreated.getTime());
                        //附件名称 （加上时间唯一性）
                        enclosure.seteName(fileName);
                        //上传附件大小
                        enclosure.seteSize((int) file.getSize());
                        //谁上传的文件
                        enclosure.seteUId("15");

                        //将附件存入数据库
                        enclosureService.insert(enclosure);

                        System.out.println(fileTo);
                        //上传
                        file.transferTo(fileTo);
                    }
                }

            }
            map.put("uploaded",1);
            map.put("url","/dist/img/enclosure/"+fileName);
        }catch (Exception e){
            e.printStackTrace();
            map.put("uploaded",0);
            map.put("error",new HashMap<>().put("message","上传失败！请重试！"));
        }finally {
            return map;
        }
//        long  endTime=System.currentTimeMillis();
//        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        //return "/success";
    }
}
