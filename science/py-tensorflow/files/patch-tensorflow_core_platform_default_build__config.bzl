--- tensorflow/core/platform/default/build_config.bzl.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/core/platform/default/build_config.bzl
@@ -796,9 +796,7 @@ def tf_additional_numa_deps():
         "//tensorflow:ios": [],
         "//tensorflow:windows": [],
         "//tensorflow:macos": [],
-        "//conditions:default": [
-            "@hwloc",
-        ],
+        "//tensorflow:freebsd": [],
     })
 
 def tf_additional_numa_copts():
