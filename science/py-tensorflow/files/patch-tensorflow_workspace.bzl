--- tensorflow/workspace.bzl.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/workspace.bzl
@@ -346,6 +346,7 @@ def tf_workspace(path_prefix = "", tf_repo_name = ""):
         ],
         sha256 = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1",
         build_file = clean_dep("//third_party:enum34.BUILD"),
+	system_build_file = clean_dep("//third_party/systemlibs:enum34.BUILD"),
         strip_prefix = "enum34-1.1.6/enum",
     )
 
