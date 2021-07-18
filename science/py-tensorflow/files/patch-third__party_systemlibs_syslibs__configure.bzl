--- third_party/systemlibs/syslibs_configure.bzl.orig	2020-01-07 16:57:39 UTC
+++ third_party/systemlibs/syslibs_configure.bzl
@@ -27,7 +27,7 @@ VALID_LIBS = [
     "grpc",
     "hwloc",
     "icu",
-    "jpeg",
+    "libjpeg_turbo",
     "jsoncpp_git",
     "keras_applications_archive",
     "lmdb",
@@ -38,6 +38,7 @@ VALID_LIBS = [
     "pasta",
     "pcre",
     "png",
+    "pybind11",
     "six_archive",
     "snappy",
     "swig",
