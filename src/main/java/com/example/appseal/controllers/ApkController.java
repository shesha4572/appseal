package com.example.appseal.controllers;


import com.example.appseal.services.ApkService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/api/v1/secure")
@RestController
@RequiredArgsConstructor
public class ApkController{

    @Autowired
    ApkService apkService;

    @PostMapping(value = "/withScreenProtection/" , consumes = "multipart/form-data")
    public ResponseEntity<?> secureApkWithScreenProtection(@RequestParam("apk") MultipartFile file ){
        Resource apk;
        try {
            apk = apkService.secureApk(file , true);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .header(HttpHeaders.CONTENT_DISPOSITION , "attachment; filename=\"" + apk.getFilename() + "\"")
                .body(apk);
    }

    @PostMapping(value = "/noScreenProtection/" , consumes = "multipart/form-data")
    public ResponseEntity<?> secureApkWithoutScreenProtection(@RequestParam("apk") MultipartFile file){
        Resource apk;
        try {
            apk = apkService.secureApk(file , false);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .header(HttpHeaders.CONTENT_DISPOSITION , "attachment; filename=\"" + apk.getFilename() + "\"")
                .body(apk);
    }

}
