package com.kzewen.services;

import com.kzewen.entity.FileImg;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface FileImgService {

    /**
     * 查询图片
     */
    public FileImg findOne(FileImg fileImg);
    /**
     * 存储一个图片
     */
    public boolean saveFile(MultipartFile file, String uuid) throws IOException;

}
