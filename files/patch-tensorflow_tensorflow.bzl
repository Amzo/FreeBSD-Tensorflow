--- tensorflow/tensorflow.bzl.orig	2019-07-06 21:22:13.961756000 +0100
+++ tensorflow/tensorflow.bzl	2019-07-06 21:27:32.073482000 +0100
@@ -603,7 +603,7 @@
                 ],
             ),
             data = depset(data + added_data_deps),
-            linkopts = linkopts + _rpath_linkopts(name_os),
+	    linkopts = linkopts + ["-lexecinfo"] + _rpath_linkopts(name),
             visibility = visibility,
             **kwargs
         )
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
