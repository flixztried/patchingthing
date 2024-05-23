#!/bin/bash
##################################################################
# This script is made possible with the help of the script called
# DownAPK, please check out DownAPK on github
# https://github.com/rabilrbl/downapk
##################################################################

#setup
echo "Downloading Java, wget, and making folders"
{
 pkg i openjdk-17 -y
 pkg i wget -y
 mkdir patcher
 cd patcher
} &> /dev/null
echo "Done!"

#downloading
echo "Downloading Revanced CLI, Integrations and Patches"
{
 wget 'https://github.com/inotia00/revanced-cli/releases/download/v2.21.2-arsclib/revanced-cli-2.21.2-all.jar'
 wget 'https://github.com/inotia00/revanced-patches/releases/download/v2.174.0-arsclib/revanced-patches-2.174.0.jar'
 wget 'https://github.com/inotia00/revanced-integrations/releases/download/v1.8.2/revanced-integrations-1.8.2.apk'
} &> /dev/null
echo "Done!"
echo "Downloading Reddit"
echo "Using DownAPK to download apk"
{
 wget 'https://github.com/rabilrbl/downapk/releases/download/v0.6.3/downapk-aarch64-linux-android'
 chmod +x downapk-aarch64-linux-android
} &> /dev/null
echo "Human interaction required"
./downapk-aarch64-linux-android --package-id com.reddit.frontpage
echo "Done!"

#renaming
echo "Renaming Files"
{
 mv revanced-cli-2.21.2-all.jar cli.jar
 mv revanced-patches-2.174.0.jar patches.jar
 mv revanced-integrations-1.8.2.apk inte.apk
 mv ./downloads/com.reddit.frontpage*.apk ./downloads/reddit.apk
} &> /dev/null
echo "Done!"

#patching
echo "Redirecting you to patching folder for patching!"
echo "Already there!"
echo "Patching Reddit"
java -jar cli.jar -a ./downloads/reddit.apk -o revanced -m inte.apk -b patches.jar
echo "Patching Completed!"
cd ./revanced
echo "Moving patched APK to Internal storage"
mv ./base.apk '/storage/emulated/0'
echo "base.apk is the patched apk."
