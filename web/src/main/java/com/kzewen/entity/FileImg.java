package com.kzewen.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class FileImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String uuid;

    private String fileName;

    private String storeaddress;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getStoreaddress() {
        return storeaddress;
    }

    public void setStoreaddress(String storeaddress) {
        this.storeaddress = storeaddress == null ? null : storeaddress.trim();
    }
}