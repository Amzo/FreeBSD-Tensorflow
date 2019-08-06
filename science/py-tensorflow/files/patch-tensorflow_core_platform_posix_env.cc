--- tensorflow/core/platform/posix/env.cc.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/core/platform/posix/env.cc
@@ -28,6 +28,10 @@ limitations under the License.
 #include <thread>
 #include <vector>
 
+#ifdef __FreeBSD__
+#include <pthread.h>
+#endif
+
 #include "tensorflow/core/lib/core/error_codes.pb.h"
 #include "tensorflow/core/platform/env.h"
 #include "tensorflow/core/platform/load_library.h"
@@ -113,7 +117,7 @@ class PosixEnv : public Env {
     // Has to be casted to long first, else this error appears:
     // static_cast from 'pthread_t' (aka 'pthread *') to 'int32' (aka 'int')
     // is not allowed
-    return static_cast<int32>(static_cast<int64>(pthread_self()));
+    return static_cast<int32>(reinterpret_cast<std::intptr_t>(pthread_self()));
 #else
     return static_cast<int32>(pthread_self());
 #endif
@@ -129,7 +133,7 @@ class PosixEnv : public Env {
         return true;
       }
     }
-#if defined(__ANDROID__) || defined(__EMSCRIPTEN__)
+#if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__FreeBSD__)
     return false;
 #else
     char buf[100];
