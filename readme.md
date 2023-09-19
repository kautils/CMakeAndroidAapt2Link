### CMakeAndroidAapt2Link



* AAPT2 : path to aapt2 
* RENAME_MANIFEST_PACKAGE : --rename_manifest_package arg  
* ANDROID_APK : -I android.jar 
* MANIFEST : --manifest arg
* JAVA : --java arg 
* AUTO_ADD_OVERLAY --auto_add_overlay
* EXTRA_PACKAGES : --extra_packages "string separated by colon"
* OUTPUT : -o arg 
* FILES : files... appears in the help sentence : "aapt2 link [options] -o arg --manifest arg files..." 

```cmake

include(CMakeAndroidAapt2Link.cmake)
CMakeAndroidAapt2Link( 
    AAPT2 "${sdk.aapt2}" 
    RENAME_MANIFEST_PACKAGE "com.iamtrk.androidexplorer" # --rename_manifest_package  
    ANDROID_APK ${sdk.android_jar} #-I
    MANIFEST ${__manifest} # --manifest
    JAVA "${__java}" # --java 
    OVERLAYS ${__auto_add_overlay} # -R arg -R arg ...
    EXTRA_PACKAGES "${__extra_packages}" # --extra_packages
    OUTPUT "${__output}" # -o 
    FILES ${__resources} # files... appears in the help sentence : "aapt2 link [options] -o arg --manifest arg files..." 
    AUTO_ADD_OVERLAY # --auto-add-overlay
    VERBOSE
)

```