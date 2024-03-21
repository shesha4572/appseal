FROM maven:latest

WORKDIR /apkseal
COPY . .
RUN mkdir /android_sdk
RUN cp -r ./src/cmdline-tools /android_sdk/
RUN cp ./src/apktool/apktool.jar /usr/local/bin/
RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -P /usr/local/bin/
RUN wget -c https://github.com/TamilanPeriyasamy/BundleDecompiler/blob/master/build/libs/BundleDecompiler-0.0.2.jar -O /usr/local/bin/BundleDecompiler.jar
RUN chmod +x /usr/local/bin/apktool
RUN chmod +x /usr/local/bin/apktool.jar
RUN chmod +x /usr/local/bin/BundleDecompiler.jar
RUN chmod +x ./src/scripts/obfs.sh
ENV ANDROID_SDK_ROOT="/android_sdk"
ENV PATH="/android_sdk/cmdline-tools/bin:$PATH"
RUN echo y | sdkmanager --sdk_root=$ANDROID_SDK_ROOT "build-tools;34.0.0"
ENV PATH="/android_sdk/build-tools/34.0.0:$PATH"
RUN mkdir /logs
RUN mkdir /apks
RUN mkdir /decompiled
RUN mkdir /newapks
RUN mkdir /obfuscated
RUN git clone https://github.com/Mobile-IoT-Security-Lab/Obfuscapk.git ../obfs
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip
RUN python3 -m pip install -r /obfs/src/requirements.txt
RUN mvn clean install -Dmaven.test.skip=true
CMD mvn spring-boot:run