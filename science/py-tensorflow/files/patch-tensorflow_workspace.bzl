--- tensorflow/workspace.bzl.orig	2021-07-17 13:08:21 UTC
+++ tensorflow/workspace.bzl
@@ -910,6 +910,7 @@ def tf_repositories(path_prefix = "", tf_repo_name = "
         sha256 = "0f34838f2c8024a6765168227ba587b3687729ebf03dc912f88ff75c7aa9cfe8",
         strip_prefix = "pybind11-2.3.0",
         build_file = clean_dep("//third_party:pybind11.BUILD"),
+        system_build_file = clean_dep("//third_party/systemlibs:pybind11.BUILD"),
     )
 
     tf_http_archive(
