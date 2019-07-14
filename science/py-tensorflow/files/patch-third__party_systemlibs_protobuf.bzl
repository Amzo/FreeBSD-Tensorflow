--- third_party/systemlibs/protobuf.bzl.orig	2019-07-14 12:01:07.908541000 +0100
+++ third_party/systemlibs/protobuf.bzl	2019-07-14 12:01:27.143317000 +0100
@@ -78,7 +78,7 @@
     if source_dir:
         import_flags = ["-I" + source_dir, "-I" + gen_dir]
     else:
-        import_flags = ["-I."]
+        import_flags = ["-I.", "-I%%LOCALBASE%%"]
 
     for dep in ctx.attr.deps:
         import_flags += dep.proto.import_flags
