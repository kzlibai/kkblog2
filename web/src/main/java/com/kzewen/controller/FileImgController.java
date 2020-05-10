package com.kzewen.controller;

import com.kzewen.entity.FileImg;
import com.kzewen.services.FileImgService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class FileImgController {
    private final static Logger log = Logger.getLogger(FileImgController.class);

    @Autowired
    private FileImgService fileImgService;

    @RequestMapping(value = "/imageUpload")
    @ResponseBody
    public Object upload(MultipartFile file)  {
        String filename = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        boolean boole = false;
        try {
            boole = fileImgService.saveFile(file, uuid);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (boole) {
            Map<String, Object> map = new HashMap<>();
            Map<String, Object> map2 = new HashMap<>();
            map.put("code", 0);    //0表示上传成功
            map.put("msg", "上传成功"); //提示消息
            map2.put("src", "http://localhost:8080/download?uuid=" + uuid);//下载的地址
            map2.put("title", filename);
            map.put("data", map2);
            return map;
        } else {
            return file.getOriginalFilename();
        }
    }
    /**
     * 下载
     */
    @RequestMapping("/download")
    public void download(String uuid, HttpServletRequest request, HttpServletResponse response){
        FileImg img = new FileImg();
        img.setUuid(uuid);
        FileImg fileImg = fileImgService.findOne(img);

        String filename = fileImg.getFileName();
        filename = getStr(request, filename);
        //获取文件类型
        String[] strArray = filename.split("\\.");
        int suffixIndex = strArray.length-1;
        String fileType = strArray[suffixIndex];

        File file = new File(fileImg.getStoreaddress(),uuid+"."+fileType);
        //文件回显下载
        if(file.exists()) {
            FileInputStream fis;
            try {
                fis = new FileInputStream(file);
                response.setContentType("application/x-msdownload");
                response.addHeader("Content-Disposition", "attachment; filename=" + filename );
                ServletOutputStream out = response.getOutputStream();
                byte[] buf=new byte[2048];
                int n=0;
                while((n=fis.read(buf))!=-1){
                    out.write(buf, 0, n);
                }
                fis.close();
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    private String getStr(HttpServletRequest request, String fileName) {
        String downloadFileName = null;
        String agent = request.getHeader("USER-AGENT");
        try {
            if(agent != null && agent.toLowerCase().indexOf("firefox") > 0){
                //downloadFileName = "=?UTF-8?B?" + (new String(Base64Utils.encode(fileName.getBytes("UTF-8")))) + "?=";
                //设置字符集
                downloadFileName = "=?UTF-8?B?" + Base64Utils.encodeToString(fileName.getBytes("UTF-8")) + "?=";
            }else{
                downloadFileName =  java.net.URLEncoder.encode(fileName, "UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return downloadFileName;
    }



}
