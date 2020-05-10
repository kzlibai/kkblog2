package com.kzewen.services.impl;

import com.kzewen.dao.FileImgMapper;
import com.kzewen.entity.FileImg;
import com.kzewen.services.FileImgService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


@Service
public class FIleImgServiceImpl implements FileImgService {

    @Autowired
    FileImgMapper fileImgMapper;

    @Override
    public FileImg findOne(FileImg fileImg) {

        return fileImgMapper.selectOne(fileImg);
    }

    @Override
    public boolean saveFile(MultipartFile file, String uuid) throws IOException {
//将获取到的图片，路径储存到数据库中，id为uuid
            File path = path(file.getContentType());//返回存放图片的位置
            String filename = file.getOriginalFilename();
            //获取文件类型
        String[] strArray = filename.split("\\.");
        int suffixIndex = strArray.length-1;
        String fileType = strArray[suffixIndex];

            FileImg fileEntity = new FileImg();
            fileEntity.setFileName(filename);
            fileEntity.setUuid(uuid);
            String storeaddress = path.getAbsolutePath();
            fileEntity.setStoreaddress(storeaddress);

            File saveFile = new File(storeaddress,uuid+"."+fileType);//文件名是uuid的值
        File parentFile = saveFile.getParentFile();//返回的是File类型，可以调用exists()方法
        if(!parentFile.exists()){
            parentFile.mkdirs();//创建多级目录
        }
        if(!saveFile.exists()){
            saveFile.createNewFile();//有路径才能创建文件
            /*MultipartFile转File*/
            FileUtils.copyInputStreamToFile(file.getInputStream(),saveFile);
            fileImgMapper.insert(fileEntity);//存入数据库
            return true;
        }
        return saveFile.exists();

    }
    //图片地址是否存在

    private File path(String IMAGEPATH) {
        String path1 = System.getProperty("user.dir");
       // File pat=new File("C:\\K_computer\\work_place\\kkblog2\\web\\src\\main\\webapp\\images\\other");
        File pat = new File("\\src\\main\\webapp\\images\\other");
        //File path = new File(IMAGEPATH);
        if(!pat.isDirectory()) {
            pat.mkdirs();
        }
        /*if(!path.isDirectory()) {
            path.mkdirs();
            return path;
        }*/
        return pat;

    }
}
