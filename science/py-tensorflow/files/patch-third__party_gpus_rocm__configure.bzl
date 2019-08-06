--- third_party/gpus/rocm_configure.bzl.orig	2019-06-18 22:48:23 UTC
+++ third_party/gpus/rocm_configure.bzl
@@ -308,7 +308,7 @@ def _lib_name(lib, cpu_value, version = "", static = F
     Returns:
       The platform-specific name of the library.
     """
-    if cpu_value in ("Linux"):
+    if cpu_value in ("Linux", "FreeBSD"):
         if static:
             return "lib%s.a" % lib
         else:
