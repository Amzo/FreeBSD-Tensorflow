# Created by: Anthony Donnelly <amzo1337@gmail.com>

PORTNAME=	nsync
PORTVERSION=	1.21.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	amzo1337@gmail.com
COMMENT=	"nsync is a C library that exports various synchronization primitives"

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	google
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	8d73577
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS

.include <bsd.port.mk>
