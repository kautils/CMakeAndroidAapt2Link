

macro(CMakeAndroidAapt2Link)
    set(${PROJECT_NAME}_m_evacu ${m})
    set(m ${PROJECT_NAME}.CMakeAndroidAapt2Link)
    list(APPEND ${m}_unsetter 
            ${m}_AUTO_ADD_OVERLAY
            ${m}_WORKING_DIRECTORY
            ${m}_VERBOSE ${m}_DEBUG_VERBOSE
            ${m}_AAPT2
            ${m}_MANIFEST ${m}_RENAME_MANIFEST_PACKAGE ${m}_ANDROID_APK 
            ${m}_JAVA ${m}_EXTRA_PACKAGES ${m}_OUTPUT ${m}_OVERLAYS ${m}_FILES)
    cmake_parse_arguments(${m} "AUTO_ADD_OVERLAY;DEBUG_VERBOSE;VERBOSE" "WORKING_DIRECTORY;MANIFEST;AAPT2;RENAME_MANIFEST_PACKAGE;ANDROID_APK;JAVA;EXTRA_PACKAGES;OUTPUT" "OVERLAYS;FILES" ${ARGV}) 

    if(NOT DEFINED ${m}_WORKING_DIRECTORY)
        set(${m}_WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
    endif()

    if(${${m}_DEBUG_VERBOSE})
        include(CMakePrintHelpers)
        list(SORT ${m}_unsetter)
        foreach(__var ${${m}_unsetter})
            cmake_print_variables(${__var})
        endforeach()
        message("${${m}_AAPT2} link ${${m}_ANDROID_APK} --manifest ${${m}_MANIFEST} --java ${${m}_JAVA} --rename-manifest-package ${${m}_RENAME_MANIFEST_PACKAGE} --auto-add-overlay ${${m}_OVERLAYS} --extra-packages \"${${m}_EXTRA_PACKAGES}\" -o \"${${m}_OUTPUT}\" ${${m}_FILES}")
    endif()
    
    if(${${m}_AUTO_ADD_OVERLAY})
        set(${m}_AUTO_ADD_OVERLAY --auto-add-overlay)
    else()
        set(${m}_AUTO_ADD_OVERLAY )
    endif()
    
    execute_process(
        COMMAND ${${m}_AAPT2} link 
            -I ${${m}_ANDROID_APK} 
            --manifest ${${m}_MANIFEST}
            --java ${${m}_JAVA}
            --rename-manifest-package ${${m}_RENAME_MANIFEST_PACKAGE}   
            ${${m}_AUTO_ADD_OVERLAY} 
            ${${m}_OVERLAYS}
            --extra-packages "${${m}_EXTRA_PACKAGES}"
            -o "${${m}_OUTPUT}"
            ${${m}_FILES}
        RESULT_VARIABLE res
        OUTPUT_VARIABLE out
        ERROR_VARIABLE err
        WORKING_DIRECTORY "${${m}_WORKING_DIRECTORY}"
    )

    if(${${m}_VERBOSE})
        list(APPEND ${m}_unsetter ${m}_msg)
        string(APPEND  ${m}_msg "[result] ${res}\n")
        string(APPEND  ${m}_msg "[output] ${out}\n")
        string(APPEND  ${m}_msg "[error] ${err}\n")
        message("${${m}_msg}")
        unset( ${m}_msg)
    endif()


    foreach(__v ${${m}_unsetter})
        unset(${__v})
    endforeach()
    unset(${m}_unsetter)
    set(m ${${PROJECT_NAME}_m_evacu})

endmacro()


