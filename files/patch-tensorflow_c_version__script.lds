--- tensorflow/c/version_script.lds.orig	2022-09-01 12:52:46 UTC
+++ tensorflow/c/version_script.lds
@@ -3,6 +3,7 @@ VERS_1.0 {
   global:
     *TF_*;
     *TFE_*;
+    *environ*;
 
   # Hide everything else.
   local:
