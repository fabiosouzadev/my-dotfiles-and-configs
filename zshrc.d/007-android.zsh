# Added ANDROID SDK configs ######
export ANDROID_HOME=${HOME}/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_SDK_HOME=$ANDROID_HOME
export ANDROID_EMULATOR_HOME=$ANDROID_HOME/.android
export ANDROID_AVD_HOME=$ANDROID_EMULATOR_HOME/avd

export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$(ls $ANDROID_HOME/build-tools | sort | tail -1):$PATH

export INTEL_HAXM_HOME=/usr/local/Caskroom/intel-haxm
# Ended ANDROID SDK configs ######

# Added ANDROID STUDIO configs ######
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/temurin-11.0.12+7/Contents/Home
export STUDIO_GRADLE_JDK=$STUDIO_JDK
### Ended ANDROID STUDIO configs ######
