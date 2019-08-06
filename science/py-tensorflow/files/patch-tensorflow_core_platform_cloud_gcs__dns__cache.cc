--- tensorflow/core/platform/cloud/gcs_dns_cache.cc.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/core/platform/cloud/gcs_dns_cache.cc
@@ -24,6 +24,11 @@ limitations under the License.
 #endif
 #include <sys/types.h>
 
+#ifdef __FreeBSD__ 
+#include <sys/socket.h>
+#include <netinet/in.h>
+#endif
+
 namespace tensorflow {
 
 namespace {
