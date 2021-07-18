--- third_party/systemlibs/jsoncpp.BUILD.orig	2021-07-17 12:21:19 UTC
+++ third_party/systemlibs/jsoncpp.BUILD
@@ -8,9 +8,8 @@ filegroup(
 HEADERS = [
     "include/json/allocator.h",
     "include/json/assertions.h",
-    "include/json/autolink.h",
     "include/json/config.h",
-    "include/json/features.h",
+    "include/json/json_features.h",
     "include/json/forwards.h",
     "include/json/json.h",
     "include/json/reader.h",
@@ -25,7 +24,7 @@ genrule(
     cmd = """
       for i in $(OUTS); do
         i=$${i##*/}
-        ln -sf $(INCLUDEDIR)/jsoncpp/json/$$i $(@D)/include/json/$$i
+        ln -sf $(INCLUDEDIR)/json/$$i $(@D)/include/json/$$i
       done
     """,
 )
