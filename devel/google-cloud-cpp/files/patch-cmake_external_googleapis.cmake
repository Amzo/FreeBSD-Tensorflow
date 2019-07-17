--- cmake/external/googleapis.cmake.orig	2019-07-17 11:51:18.540900000 +0100
+++ cmake/external/googleapis.cmake	2019-07-17 11:50:25.065266000 +0100
@@ -109,7 +109,7 @@
                    -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
                    -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}
                    -DCMAKE_PREFIX_PATH=${GOOGLE_CLOUD_CPP_PREFIX_PATH}
-                   -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
+                   -DCMAKE_INSTALL_PREFIX=%%LOCALBASE%%
                    -DCMAKE_INSTALL_RPATH=${GOOGLE_CLOUD_CPP_INSTALL_RPATH}
                    ${_googleapis_toolchain_flag}
                    ${_googleapis_triplet_flag}
