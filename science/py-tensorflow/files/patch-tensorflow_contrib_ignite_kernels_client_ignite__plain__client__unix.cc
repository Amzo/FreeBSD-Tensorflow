--- tensorflow/contrib/ignite/kernels/client/ignite_plain_client_unix.cc.orig	2019-06-18 22:48:23 UTC
+++ tensorflow/contrib/ignite/kernels/client/ignite_plain_client_unix.cc
@@ -20,6 +20,10 @@ limitations under the License.
 #include <sys/socket.h>
 #include <unistd.h>
 
+#ifdef __FreeBSD__
+#include <netinet/in.h>
+#endif
+
 #include <iostream>
 #include <map>
 
