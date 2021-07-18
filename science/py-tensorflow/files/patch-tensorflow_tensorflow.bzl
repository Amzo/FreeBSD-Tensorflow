--- tensorflow/tensorflow.bzl.orig	2020-01-07 16:57:39 UTC
+++ tensorflow/tensorflow.bzl
@@ -572,6 +572,7 @@ def tf_cc_shared_object(
                 clean_dep("//tensorflow:windows"): [],
                 "//conditions:default": [
                     "-Wl,-soname," + soname,
+                    "-L%%LOCALBASE%%/lib",
                 ],
             }),
             visibility = visibility,
@@ -700,7 +701,7 @@ def tf_gen_op_wrapper_cc(
     tf_cc_binary(
         name = tool,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]),
+        linkopts = if_not_windows(["-L%%LOCALBASE%%/lib", "-lm", "-Wl,-ldl"]),
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         deps = [op_gen] + deps,
     )
@@ -887,7 +888,7 @@ def tf_gen_op_wrapper_py(
     tf_cc_binary(
         name = tool_name,
         copts = tf_copts(),
-        linkopts = if_not_windows(["-lm", "-Wl,-ldl"]) + cc_linkopts,
+        linkopts = if_not_windows(["-L%%LOCALBASE%%/lib", "-lm", "-Wl,-ldl"]) + cc_linkopts,
         linkstatic = 1,  # Faster to link this one-time-use binary dynamically
         visibility = [clean_dep("//tensorflow:internal")],
         deps = ([
@@ -1960,6 +1961,8 @@ def tf_py_wrap_cc(
         "//conditions:default": [
             "-Wl,--version-script",
             "$(location %s.lds)" % vscriptname,
+            "-lexecinfo",
+            "-L%%LOCALBASE%%/lib",
         ],
     })
     extra_deps += select({
@@ -2469,6 +2472,8 @@ def pybind_extension(
             "//conditions:default": [
                 "-Wl,--version-script",
                 "$(location %s)" % version_script_file,
+                "-lexecinfo",
+                "-L%%LOCALBASE%%/lib",
             ],
         }),
         deps = deps + [
