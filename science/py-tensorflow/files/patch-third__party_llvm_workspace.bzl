--- third_party/llvm/workspace.bzl.orig	2022-08-27 19:02:29 UTC
+++ third_party/llvm/workspace.bzl
@@ -16,6 +16,6 @@ def repo(name):
             "https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT),
         ],
         build_file = "//third_party/llvm:llvm.BUILD",
-        patch_file = ["//third_party/llvm:macos_build_fix.patch"],
+        patch_file = ["//third_party/llvm:macos_build_fix.patch", "//third_party/llvm:freebsd_python_fix.patch"],
         link_files = {"//third_party/llvm:run_lit.sh": "mlir/run_lit.sh"},
     )
