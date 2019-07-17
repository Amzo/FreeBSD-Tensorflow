# Created by: Anthony Donnelly <amzo1337@gmail.com>

PORTNAME=	google-cloud-cpp
PORTVERSION=	0.11.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

DISTFILES=	json.hpp:json \
		a8ee1416f4c588f2ab92da72e7c1f588c784d3e6.tar.gz:googleapi
MASTER_SITES=	https://github.com/nlohmann/json/releases/download/v3.4.0/:json \
		https://github.com/googleapis/googleapis/archive/:googleapi

EXTRACT_ONLY=	GoogleCloudPlatform-${PORTNAME}-${DISTVERSIONPREFIX}${PORTVERSION}-${GH_TAGNAME}_GH0.tar.gz
MAINTAINER=	amzo1337@gmail.com
COMMENT=	C++ Idiomatic Clients for Google Cloud Platform services

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	protobuf>=3.7.1:devel/protobuf \
		grpc>=1.19.1:devel/grpc

LIB_DEPENDS=	libgmock.so.0:devel/googlemock \
		libcrc32c.so.1:devel/crc32c

DIST_SUBDIR=	${PORTNAME}

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	GoogleCloudPlatform
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	cc1af99
USE_LDCONFIG=	yes

LDFLAGS+=      -L${WRKDIR}/.build/external/googleapis/src/googleapis_project-build

MAKE_ON=	BUILD_SHARED_LIBS
CMAKE_ARGS+=	-DGOOGLE_CLOUD_CPP_DEPENDENCY_PROVIDER=package \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTING=OFF

post-patch:
	@${MKDIR} ${WRKDIR}/.build/external/nlohmann_json/src/
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/json.hpp ${WRKDIR}/.build/external/nlohmann_json/src/json.hpp

	@${MKDIR} ${WRKDIR}/.build/external/googleapis/src/
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/a8ee1416f4c588f2ab92da72e7c1f588c784d3e6.tar.gz \
		${WRKDIR}/.build/external/googleapis/src/a8ee1416f4c588f2ab92da72e7c1f588c784d3e6.tar.gz
.include <bsd.port.mk>
