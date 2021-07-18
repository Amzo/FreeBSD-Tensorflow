--- third_party/pybind11.BUILD.orig	2021-07-17 13:07:52 UTC
+++ third_party/pybind11.BUILD
@@ -18,6 +18,7 @@ cc_library(
         "-Wno-pragma-once-outside-header",
     ],
     includes = ["include"],
+    strip_include_prefix = "include",
     deps = [
         "@org_tensorflow//third_party/python_runtime:headers",
     ],
