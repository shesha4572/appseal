package com.example.appseal.controllers;


import com.example.appseal.services.ApkService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/api/v1/apk")
@RestController
@RequiredArgsConstructor
public class ApkController{

    @Autowired
    ApkService apkService;

    @PostMapping(value = "/customCertificate/" , consumes = "multipart/form-data")
    public ResponseEntity<?> uploadApkWithCustomSigner(@RequestParam("apk") MultipartFile file , @RequestParam("signerCertificate") MultipartFile certificate , @RequestParam("signerAlias") String alias , @RequestParam("signerPass") String password ){
        try {
            apkService.testApk(file);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
        return ResponseEntity.ok().build();
    }

    @PostMapping(value = "/noCertificate/" , consumes = "multipart/form-data")
    public ResponseEntity<?> uploadApkNoSigner(@RequestParam("apk") MultipartFile file){
        try {
            apkService.testApk(file);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
        return ResponseEntity.ok().build();
    }

}
