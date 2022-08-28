--- third_party/cpuinfo/cpuinfo.BUILD.orig	2022-05-22 22:28:22 UTC
+++ third_party/cpuinfo/cpuinfo.BUILD
@@ -100,6 +100,7 @@ EMSCRIPTEN_SRCS = [
 cc_library(
     name = "cpuinfo_impl",
     srcs = select({
+        "//conditions:default": COMMON_SRCS + X86_SRCS + LINUX_SRCS + LINUX_X86_SRCS,
         ":linux_x86_64": COMMON_SRCS + X86_SRCS + LINUX_SRCS + LINUX_X86_SRCS,
         ":linux_arm": COMMON_SRCS + ARM_SRCS + LINUX_SRCS + LINUX_ARM32_SRCS,
         ":linux_armhf": COMMON_SRCS + ARM_SRCS + LINUX_SRCS + LINUX_ARM32_SRCS,
@@ -187,6 +188,11 @@ cc_library(
 )
 
 ############################# Build configurations #############################
+
+config_setting(
+    name = "default",
+    values = {"cpu": "k8"},
+)
 
 config_setting(
     name = "linux_x86_64",
