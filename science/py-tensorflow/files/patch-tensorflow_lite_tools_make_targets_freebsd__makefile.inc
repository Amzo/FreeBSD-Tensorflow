--- tensorflow/lite/tools/make/targets/freebsd_makefile.inc.orig	2019-08-06 10:30:37 UTC
+++ tensorflow/lite/tools/make/targets/freebsd_makefile.inc
@@ -0,0 +1,16 @@
+# Settings for FreeBSD.
+ifeq ($(TARGET), freebsd)
+  CXXFLAGS += \
+    -fPIC \
+    -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -pthread
+  CFLAGS += \
+    -fPIC \  
+    -DGEMMLOWP_ALLOW_SLOW_SCALAR_FALLBACK \
+    -pthread
+  # TODO(petewarden): In the future we may want to add architecture-specific
+  # flags like -msse4.2 
+        LIBS += -lexecinfo
+endif
+
+
