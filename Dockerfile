FROM maven:latest

WORKDIR /apkseal
COPY . .
RUN mkdir /android_sdk
RUN cp -r ./src/cmdline-tools /android_sdk/
RUN cp ./src/apktool/apktool.jar /usr/local/bin/
RUN wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -P /usr/local/bin/
RUN chmod +x /usr/local/bin/apktool
RUN chmod +x /usr/local/bin/apktool.jar
ENV ANDROID_SDK_ROOT="/android_sdk"
ENV PATH="/android_sdk/cmdline-tools/bin:$PATH"
RUN echo y | sdkmanager --sdk_root=$ANDROID_SDK_ROOT "build-tools;34.0.0"
ENV PATH="/android_sdk/build-tools/34.0.0:$PATH"
RUN mkdir /logs
RUN mkdir /apks
RUN mkdir /decompiled
RUN mkdir /newapks
RUN mvn clean install -Dmaven.test.skip=true
CMD mvn spring-boot:run