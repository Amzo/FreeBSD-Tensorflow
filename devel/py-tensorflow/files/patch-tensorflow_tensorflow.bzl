--- tensorflow/tensorflow.bzl.orig	2019-06-18 23:48:23.000000000 +0100
+++ tensorflow/tensorflow.bzl	2019-07-07 13:35:08.085940000 +0100
@@ -603,7 +603,7 @@
                 ],
             ),
             data = depset(data + added_data_deps),
-            linkopts = linkopts + _rpath_linkopts(name_os),
+	    linkopts = linkopts + ["-lexecinfo"] + _rpath_linkopts(name),
             visibility = visibility,
             **kwargs
         )
@@ -657,7 +657,7 @@
     tf_cc_binary(
         name = tool,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]),
+        linkopts = if_not_windows(["-lm", "-Wl, -lexecinfo"]),
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         deps = [op_gen] + deps,
     )
@@ -839,7 +839,7 @@
     tf_cc_binary(
         name = tool_name,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]) + cc_linkopts,
+        linkopts = if_not_windows(["-lm", "-Wl, -lexecinfo"]) + cc_linkopts,
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         visibility = [clean_dep("//tensorflow:internal")],
         deps = ([
@@ -954,8 +954,9 @@
             "//conditions:default": [
                 "-lpthread",
                 "-lm",
+		"-lexecinfo",
             ],
-        }) + linkopts + _rpath_linkopts(name),
+        }) + linkopts + ["-lexecinfo"] + _rpath_linkopts(name),
         deps = deps + tf_binary_dynamic_kernel_deps(kernels) + if_mkl_ml(
             [
                 clean_dep("//third_party/mkl:intel_binary_blob"),
@@ -1103,7 +1104,7 @@
         ]) + if_rocm_is_configured([
             clean_dep("//tensorflow/core:gpu_lib"),
         ]),
-        linkopts = if_not_windows(["-lpthread", "-lm"]) + linkopts + _rpath_linkopts(name),
+        linkopts = if_not_windows(["-lpthread", "-lm", "-lexecinfo",]) + linkopts + _rpath_linkopts(name),
         linkstatic = linkstatic or select({
             # cc_tests with ".so"s in srcs incorrectly link on Darwin
             # unless linkstatic=1.
@@ -1784,6 +1785,7 @@
         linkopts = linkopts + select({
             "//conditions:default": [
                 "-lm",
+		"-lexecinfo",
             ],
             clean_dep("//tensorflow:windows"): [],
             clean_dep("//tensorflow:macos"): [],
