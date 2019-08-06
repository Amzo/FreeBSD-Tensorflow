--- tensorflow/tensorflow.bzl.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/tensorflow.bzl
@@ -287,6 +287,7 @@ def tf_copts(android_optimization_level_override = "-O
             "-Wno-sign-compare",
             "-fno-exceptions",
             "-ftemplate-depth=900",
+	    "-I%%LOCALBASE%%/include",
         ]) +
         if_cuda(["-DGOOGLE_CUDA=1"]) +
         if_tensorrt(["-DGOOGLE_TENSORRT=1"]) +
@@ -603,7 +604,7 @@ def tf_cc_binary(
                 ],
             ),
             data = depset(data + added_data_deps),
-            linkopts = linkopts + _rpath_linkopts(name_os),
+	    linkopts = linkopts + ["-lexecinfo", "-lgpr"] + _rpath_linkopts(name),
             visibility = visibility,
             **kwargs
         )
@@ -657,7 +658,7 @@ def tf_gen_op_wrapper_cc(
     tf_cc_binary(
         name = tool,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]),
+        linkopts = if_not_windows(["-lm", "-Wl, -lexecinfo"]),
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         deps = [op_gen] + deps,
     )
@@ -839,7 +840,7 @@ def tf_gen_op_wrapper_py(
     tf_cc_binary(
         name = tool_name,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]) + cc_linkopts,
+        linkopts = if_not_windows(["-L%%LOCALBASE%%/lib", "-lm", "-Wl, -lexecinfo"]) + cc_linkopts,
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         visibility = [clean_dep("//tensorflow:internal")],
         deps = ([
@@ -954,8 +955,9 @@ def tf_cc_test(
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
@@ -1103,7 +1105,7 @@ def tf_gpu_only_cc_test(
         ]) + if_rocm_is_configured([
             clean_dep("//tensorflow/core:gpu_lib"),
         ]),
-        linkopts = if_not_windows(["-lpthread", "-lm"]) + linkopts + _rpath_linkopts(name),
+        linkopts = if_not_windows(["-lpthread", "-lm", "-lexecinfo",]) + linkopts + _rpath_linkopts(name),
         linkstatic = linkstatic or select({
             # cc_tests with ".so"s in srcs incorrectly link on Darwin
             # unless linkstatic=1.
@@ -1784,6 +1786,7 @@ def tf_custom_op_library(name, srcs = [], gpu_srcs = [
         linkopts = linkopts + select({
             "//conditions:default": [
                 "-lm",
+		"-lexecinfo",
             ],
             clean_dep("//tensorflow:windows"): [],
             clean_dep("//tensorflow:macos"): [],
