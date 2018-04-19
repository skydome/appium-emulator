FROM rgonalo/appium:latest
MAINTAINER Abdulkadir Yaman <abdulkadiryaman@gmail.com>

#===========================
# Android SDK Manager (API)
#===========================
ENV AVD_VERSION 26
RUN echo y | sdkmanager "system-images;android-$AVD_VERSION;google_apis;x86"

#=========================
# Create Android Emulator
#=========================
RUN avdmanager create avd -n pixel2 -k "pixel_xl"

#============================================
# Scripts to run Appium and Android emulator
#============================================
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

CMD ["/opt/bin/entry_point.sh"]
