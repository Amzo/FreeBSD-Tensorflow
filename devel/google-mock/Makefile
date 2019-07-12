PORTNAME=	googlemock
DISTVERSIONPREFIX=	release-
DISTVERSION=	1.8.1
CATEGORIES=	devel

MAINTAINER=	amzo1337@gmail.com
COMMENT=	Google's framework for writing and using C++ mock classes

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	google
GH_PROJECT=     googletest

USES=		autoreconf compiler:c++11-lang libtool
WRKSRC_SUBDIR=	${PORTNAME}
GNU_CONFIGURE=	yes

# fused-src python tests are only useful for bundling. There's no point in
# running them before installing system-wide without source files.
CONFIGURE_ENV=	ac_cv_path_PYTHON=":"
TEST_TARGET=	check
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes


post-patch:
# enable vendor make install again (revert 661758e)
	@${REINPLACE_CMD} -E 's/install-(exec|data)-local/&-dummy/' \
		${WRKSRC}/Makefile.am

.include <bsd.port.mk>
