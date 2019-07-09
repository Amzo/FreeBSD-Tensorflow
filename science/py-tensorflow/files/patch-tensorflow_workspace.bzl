--- tensorflow/workspace.bzl.bak	2019-06-18 23:48:23.000000000 +0100
+++ tensorflow/workspace.bzl	2019-07-06 20:03:41.646427000 +0100
@@ -24,7 +24,6 @@
 load("//third_party/aws:workspace.bzl", aws = "repo")
 load("//third_party/flatbuffers:workspace.bzl", flatbuffers = "repo")
 load("//third_party/highwayhash:workspace.bzl", highwayhash = "repo")
-load("//third_party/hwloc:workspace.bzl", hwloc = "repo")
 load("//third_party/icu:workspace.bzl", icu = "repo")
 load("//third_party/jpeg:workspace.bzl", jpeg = "repo")
 load("//third_party/nasm:workspace.bzl", nasm = "repo")
@@ -38,7 +37,6 @@
     aws()
     flatbuffers()
     highwayhash()
-    hwloc()
     icu()
     keras_applications()
     kissfft()
