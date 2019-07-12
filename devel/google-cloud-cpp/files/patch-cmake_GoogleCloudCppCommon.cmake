--- /usr/home/Amzo/py-tensorflow/devel/google-cloud-cpp/work/google-cloud-cpp-cc1af99/cmake/GoogleCloudCppCommon.cmake.orig	2019-07-12 21:04:09.526957000 +0100
+++ /usr/home/Amzo/py-tensorflow/devel/google-cloud-cpp/work/google-cloud-cpp-cc1af99/cmake/GoogleCloudCppCommon.cmake	2019-07-12 21:05:37.289511000 +0100
@@ -24,7 +24,6 @@
 if (NOT MSVC)
     check_cxx_compiler_flag(-Wall GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_WALL)
     check_cxx_compiler_flag(-Wextra GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_WEXTRA)
-    check_cxx_compiler_flag(-Werror GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_WERROR)
 else()
     check_cxx_compiler_flag("/std:c++latest"
                             GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_CPP_LATEST)
@@ -118,9 +117,6 @@
     endif ()
     if (GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_WEXTRA)
         target_compile_options(${target} INTERFACE "-Wextra")
-    endif ()
-    if (GOOGLE_CLOUD_CPP_COMPILER_SUPPORTS_WERROR)
-        target_compile_options(${target} INTERFACE "-Werror")
     endif ()
     if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU"
         AND "${CMAKE_CXX_COMPILER_VERSION}" VERSION_LESS 5.0)
