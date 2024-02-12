FROM maven:latest

WORKDIR /apkseal
COPY . .
RUN apt-get update && apt-get install -y apktool && apt-get install -y unzip
RUN mkdir /android_sdk
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && unzip commandlinetools-linux-11076708_latest.zip -d /android_sdk/
RUN export ANDROID_SDK_ROOT="/android_sdk"
RUN export PATH="/android_sdk/cmdline-tools/latest/bin:$PATH"
RUN export PATH="/android_sdk/emulator:$PATH"
RUN /android_sdk/cmdline-tools/bin/sdkmanager --sdk_root="/android_sdk" "cmdline-tools;latest"
RUN /android_sdk/cmdline-tools/bin/sdkmanager "build-tools;latest"
RUN mkdir /logs
RUN mkdir /apks
RUN mkdir /decompiled
RUN mvn clean install -Dmaven.test.skip=true
CMD mvn spring-boot:run