package com.example.appseal.services;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

@Service
@Slf4j
public class ApkService {

    private final Path apkDir;
    private final Path logDir;
    private final Path decompiledDir;


    @Autowired
    public ApkService(@Value("${UPLOADED_APK_DIR}") String apkDir , @Value("${LOGFILE_DIR}") String logDir , @Value("${DECOMPILED_APK_DIR}") String decompiledDir){
        this.apkDir = Paths.get(apkDir);
        this.logDir = Paths.get(logDir);
        this.decompiledDir = Paths.get(decompiledDir);
    }
    public void testApk(MultipartFile file){
        log.info("File uploaded : " + file.getOriginalFilename());
        decompileApk(file);
    }

    public void decompileApk(MultipartFile apk){
        log.info("Decompiling apk " + apk.getOriginalFilename());
        String apkFileName = Objects.requireNonNull(apk.getOriginalFilename()).substring(0 , apk.getOriginalFilename().length() - 4) + "_" + LocalDateTime.now().format(DateTimeFormatter.BASIC_ISO_DATE);
        try {
            File logfile = new File(logDir.toString() , apkFileName + ".txt");
            if(logfile.createNewFile()){
                log.info("Logfile created");
            }
            Files.copy(apk.getInputStream() , this.apkDir.resolve(apkFileName + ".apk"));
            ProcessBuilder pb = new ProcessBuilder().command("apktool" , "d" , "-f" , apkFileName + ".apk"  , "-o"  , decompiledDir.toFile() + "/" + apkFileName).directory(apkDir.toFile()).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
            Process pc = pb.start();
            pc.waitFor();
            log.info("Successfully decompiled " + apk.getOriginalFilename());

        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
