package com.example.appseal.services;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.PumpStreamHandler;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
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

    private final Path obfuscateDir;
    private final Path rebuildAPKDir;

    @Autowired
    public ApkService(@Value("${UPLOADED_APK_DIR}") String apkDir,
                      @Value("${LOGFILE_DIR}") String logDir,
                      @Value("${DECOMPILED_APK_DIR}") String decompiledDir,
                      @Value("${NEW_APK_DIR}") String rebuildApkDir,
                      @Value("${OBFS_APK_DIR}") String obfuscateDir){
        this.apkDir = Paths.get(apkDir);
        this.logDir = Paths.get(logDir);
        this.decompiledDir = Paths.get(decompiledDir);
        this.rebuildAPKDir = Paths.get(rebuildApkDir);
        this.obfuscateDir = Paths.get(obfuscateDir);
    }
    public Resource secureApk(MultipartFile file , Boolean screenProtectionFlag) throws Exception {
        String decompiledAPKName = decompileApk(file);
        String mainActivityName = parseMainActivityName(decompiledAPKName);
        copyOverlayFilesToAPK(decompiledAPKName);
        addMainActivityNameToOverlay(mainActivityName , decompiledAPKName);
        editManifest(decompiledAPKName , mainActivityName , screenProtectionFlag);
        buildNewApk(decompiledAPKName);
        obfuscateNewApk(decompiledAPKName);
        alignAPK(decompiledAPKName);
        Resource r = serveNewAPK(decompiledAPKName);
        if(r == null){
            throw new Exception("Error fetching rebuilt apk");
        }
        return r;
    }

    private void obfuscateNewApk(String decompiledAPKName) throws IOException {
        log.info("Obfuscating rebuilt apk " + decompiledAPKName + ".apk");
//        ArrayList<String> list = new ArrayList<>();
//        list.add("/usr/bin/python");
//        ProcessBuilder pb = new ProcessBuilder(list).command("/apkseal/src/scripts/obfs.sh" , obfuscateDir.toString() , decompiledDir.toString() , decompiledDir.toString()).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
//        //ProcessBuilder pb = new ProcessBuilder().command("python3" , "-m" , "obfuscapk.cli "  , "-o" , "ClassRename" , "-o" , "ConstStringEncryption" , "-o" , "DebugRemoval" , "-o" , "FieldRename" , "-o" , "MethodRename" , "-o" , "Rebuild" , "-w" , "/tmp" , "-d" , obfuscateDir + "/" + decompiledAPKName + "_obfs.apk" , "-i" , "-p" , decompiledDir + "/" +  decompiledAPKName + "/dist/" + decompiledAPKName + ".apk").directory(new File("/obfs/src")).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
//        Process pc = pb.redirectErrorStream(true).start();
//        pc.getInputStream().transferTo(System.out);
//        pc.waitFor();
        String line = "python3 -m obfuscapk.cli -o ClassRename -o ConstStringEncryption -o DebugRemoval -o FieldRename -o MethodRename -o Rebuild -w /tmp -d "  + obfuscateDir + "/" + decompiledAPKName + "_obfs.apk -i " + decompiledDir + "/" + decompiledAPKName + "/dist/" + decompiledAPKName + ".apk";
        CommandLine cmdLine = CommandLine.parse(line);

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        PumpStreamHandler streamHandler = new PumpStreamHandler(outputStream);

        DefaultExecutor executor = new DefaultExecutor();
        executor.setStreamHandler(streamHandler);
        executor.setWorkingDirectory(new File("/obfs/src"));
        int exitCode = executor.execute(cmdLine);
        if(exitCode == 0) {
            log.info("Successfully obfuscated " + decompiledAPKName + ".apk");
        }
        else {
            log.error("Error while obfuscating " + decompiledAPKName + ".apk");
            log.error(String.valueOf(outputStream));
        }
    }

    private Resource serveNewAPK(String decompiledAPKName) throws MalformedURLException {
        Path newAPK = rebuildAPKDir.resolve(decompiledAPKName + "_aligned.apk");
        Resource newApkResource = new UrlResource(newAPK.toUri());
        if(newApkResource.isReadable()){
            return newApkResource;
        }
        return null;
    }

    private void alignAPK(String decompiledAPKName) throws IOException, InterruptedException {
        log.info("Aligning rebuilt apk " + decompiledAPKName + "_obfs.apk");
        File logfile = new File(logDir.toString() , decompiledAPKName + ".txt");
        ProcessBuilder pb = new ProcessBuilder().command("zipalign" , "-f" , "-p" , "-v" , "4" , decompiledAPKName + "_obfs.apk" , rebuildAPKDir + "/" + decompiledAPKName + "_aligned.apk").directory(obfuscateDir.toFile()).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
        Process pc = pb.start();
        pc.waitFor();
        log.info("Successfully aligned " + decompiledAPKName + "_aligned.apk");
    }

    private void buildNewApk(String decompiledAPKName) throws IOException, InterruptedException {
        log.info("Rebuilding apk " + decompiledAPKName + ".apk");
        File logfile = new File(logDir.toString() , decompiledAPKName + ".txt");
        ProcessBuilder pb = new ProcessBuilder().command("apktool" , "b" , "-f" , decompiledAPKName).directory(decompiledDir.toFile()).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
        Process pc = pb.start();
        pc.waitFor();
        log.info("Successfully rebuilt " + decompiledAPKName + ".apk");
    }

    private void copyOverlayFilesToAPK(String decompiledAPKName) throws IOException {
        log.info("Copying over overlay files into apk");
        File sourceDirectory = new File("./src/smali/");
        File destinationDirectory = new File(decompiledDir + "/" + decompiledAPKName + "/smali/");
        FileUtils.copyDirectory(sourceDirectory, destinationDirectory);
        log.info("Successfully copied overlay files into apk");
    }
    private Document parseManifest(String decompiledAPKName) throws Exception {
        File apkManifest = new File(decompiledDir.toString() + "/" + decompiledAPKName , "AndroidManifest.xml");
        if(!apkManifest.exists()){
            throw new Exception("Manifest File not found");
        }
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(apkManifest);
        doc.getDocumentElement().normalize();
        return doc;
    }

    private void editManifest(String decompiledAPKName , String mainActivityName , Boolean screenProtectionFlag) throws Exception {
        log.info("Editing manifest of " + decompiledAPKName);
        Document doc = parseManifest(decompiledAPKName);
        Element application = (Element) doc.getElementsByTagName("application").item(0);
        if(screenProtectionFlag){
            log.info("Screenshot and record protection flag is enabled for " + decompiledAPKName);
            if(application.hasAttribute("android:name")){
                log.error("Application class already defined for " + decompiledAPKName + ". Aborting");
                throw new Exception("App already has a defined Application class");
            }
            application.setAttribute("android:name" , "com.test.seal.ScreenShot");
        }
        else {
            log.info("Screenshot and record protection flag is disabled for " + decompiledAPKName);
        }
        NodeList activities = application.getElementsByTagName("activity");
        for (int i = 0; i < activities.getLength(); i++) {
            Element activity = (Element) activities.item(i);
            if(activity.getAttribute("android:name").equals(mainActivityName)){
                NodeList intentsList = activity.getElementsByTagName("intent-filter");
                if(intentsList.getLength() == 0){
                    continue;
                }
                Element intents = (Element) intentsList.item(0);
                NodeList actions = intents.getElementsByTagName("action");
                if(actions.getLength() == 0){
                    continue;
                }
                for (int j = 0; j < actions.getLength(); j++) {
                    Element action = (Element) actions.item(0);
                    if(action.getAttribute("android:name").equals("android.intent.action.MAIN")){
                        log.info("Found main intent of app " + decompiledAPKName);
                        intents.removeChild(action);
                    }
                }
                NodeList categories = intents.getElementsByTagName("category");
                for (int j = 0; j < categories.getLength(); j++) {
                    Element category = (Element) categories.item(j);
                    if(category.getAttribute("android:name").equals("android.intent.category.LAUNCHER")){
                        log.info("Changed main intent of " + decompiledAPKName + " to default category");
                        category.setAttribute("android:name" , "android.intent.category.DEFAULT");
                    }
                }
                log.info("Successfully edited existing main intent of " + decompiledAPKName);
                log.info("Adding new overlay activity to AndroidManifest.xml of " + decompiledAPKName);
                Element overlayActivity = doc.createElement("activity");
                overlayActivity.setAttribute("android:name" , "com.test.seal.overlay");
                overlayActivity.setAttribute("android:exported" , "true");
                Element overlayIntentFilter = doc.createElement("intent-filter");
                Element overlayAction = doc.createElement("action");
                overlayAction.setAttribute("android:name" , "android.intent.action.MAIN");
                Element overlayCategory = doc.createElement("category");
                overlayCategory.setAttribute("android:name" , "android.intent.category.LAUNCHER");
                overlayIntentFilter.appendChild(overlayAction);
                overlayIntentFilter.appendChild(overlayCategory);
                overlayActivity.appendChild(overlayIntentFilter);
                application.appendChild(overlayActivity);
                log.info("Successfully added overlay activity to AndroidManifest.xml of " + decompiledAPKName);
                TransformerFactory transformerFactory = TransformerFactory
                        .newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(doc);
                StreamResult result = new StreamResult(new File(decompiledDir.toString() + "/" + decompiledAPKName , "AndroidManifest.xml"));
                transformer.transform(source, result);
                log.info("Successfully modified AndroidManifest.xml of " + decompiledAPKName);
                return;
            }
        }
    }

    private void addMainActivityNameToOverlay(String mainActivityName, String decompiledAPKName) throws IOException {
        log.info("Replacing main activity name in overlay");
        Path overlay = Paths.get(decompiledDir.toString() + "/" + decompiledAPKName + "/smali/com/test/seal/overlay.smali");
        Charset charset = StandardCharsets.UTF_8;
        String content = Files.readString(overlay, charset);
        String activityName = String.join("/" , mainActivityName.split("\\."));
        content = content.replaceAll("com/test/seal/MainActivity", activityName);
        Files.writeString(overlay, content, charset);
        log.info("Successfully replaced main activity in overlay");
    }

    private String parseMainActivityName(String decompiledAPKName) throws Exception {
        log.info("Parsing Main Activity Name for " + decompiledAPKName + ".apk");
        Document doc = parseManifest(decompiledAPKName);
        Element application = (Element) doc.getElementsByTagName("application").item(0);
        NodeList activities = application.getElementsByTagName("activity");
        for (int i = 0; i < activities.getLength(); i++) {
            Element activity = (Element) activities.item(i);
            NodeList intentsList = activity.getElementsByTagName("intent-filter");
            if(intentsList.getLength() == 0){
                continue;
            }
            Element intents = (Element) intentsList.item(0);
            NodeList actions = intents.getElementsByTagName("action");
            if(actions.getLength() == 0){
                continue;
            }
            for (int j = 0; j < actions.getLength(); j++) {
                Element action = (Element) actions.item(0);
                if(action.getAttribute("android:name").equals("android.intent.action.MAIN")){
                    log.info("Main activity of " + decompiledAPKName + ".apk is " + activity.getAttribute("android:name"));
                    return activity.getAttribute("android:name");
                }
            }
        }
        throw new Exception("Main Activity Resolution failed");
    }

    public String decompileApk(MultipartFile apk) throws RuntimeException{
        log.info("Decompiling apk " + apk.getOriginalFilename());
        String apkFileName = Objects.requireNonNull(apk.getOriginalFilename()).substring(0 , apk.getOriginalFilename().length() - 4) + "_" + LocalDateTime.now().format(DateTimeFormatter.BASIC_ISO_DATE) + "_" + LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));
        log.info("APK Name : " + apkFileName);
        try {
            File logfile = new File(logDir.toString() , apkFileName + ".txt");
            if(logfile.createNewFile()){
                log.info("Logfile created " + logfile.getName());
            }
            Files.copy(apk.getInputStream() , this.apkDir.resolve(apkFileName + ".apk"));
            ProcessBuilder pb = new ProcessBuilder().command("apktool" , "d" , "-f" , apkFileName + ".apk"  , "-o"  , decompiledDir.toFile() + "/" + apkFileName).directory(apkDir.toFile()).redirectOutput(ProcessBuilder.Redirect.appendTo(logfile));
            Process pc = pb.start();
            pc.waitFor();
            log.info("Successfully decompiled " + apk.getOriginalFilename());

        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        return apkFileName;

    }
}
