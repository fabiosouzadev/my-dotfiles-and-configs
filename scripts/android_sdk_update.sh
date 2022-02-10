#UPDATE SDK

mkdir -p "${HOME}/Library/Android"
ANDROID_HOME="${HOME}/Library/Android/sdk"
ANDROID_PATH_BIN=/usr/local/share/android-commandlinetools/cmdline-tools/homebrew/bin

sudo ln -sfn /usr/local/share/android-commandlinetools $ANDROID_HOME
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

mkdir -p $ANDROID_HOME/.android
touch $ANDROID_HOME/.android/repositories.cfg
${ANDROID_PATH_BIN}/sdkmanager --update --verbose


mkdir -p $ANDROID_HOME/licenses
echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > ${ANDROID_HOME}/licenses/android-sdk-license
echo "84831b9409646a918e30573bab4c9c91346d8abd" > ${ANDROID_HOME}/licenses/android-sdk-preview-license
echo "d975f751698a77b662f1254ddbeed3901e976f5a" > ${ANDROID_HOME}/licenses/intel-android-extra-license
${ANDROID_PATH_BIN}/sdkmanager --install emulator --verbose
${ANDROID_PATH_BIN}/sdkmanager --install platform-tools --verbose

ANDROID_SDK_COMPILE_VERSIONS=( "32" )
ANDROID_SDK_BUILD_TOOLS_VERSIONS=( "32.0.0" "32.1.0-rc1" )
ANDROID_SDK_VERSIONS_TO_EMULATE=( "32" )
ANDROID_SDK_DIR=$ANDROID_HOME

${ANDROID_PATH_BIN}/sdkmanager --install 'extras;intel;Hardware_Accelerated_Execution_Manager' --verbose

for i in "${ANDROID_SDK_COMPILE_VERSIONS[@]}"
do
  ${ANDROID_PATH_BIN}/sdkmanager "platforms;android-$i" --verbose
done

for i in "${ANDROID_SDK_BUILD_TOOLS_VERSIONS[@]}"
do
  ${ANDROID_PATH_BIN}/sdkmanager "build-tools;$i" --verbose
done

for i in "${ANDROID_SDK_VERSIONS_TO_EMULATE[@]}"
do
  ${ANDROID_PATH_BIN}/sdkmanager "system-images;android-$i;google_apis;x86" --verbose
done
