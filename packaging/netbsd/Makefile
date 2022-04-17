# $NetBSD$

COMMENT = Katana Desktop Environment

SUBDIR += ariya-icons
SUBDIR += libdbusmenu-katie
SUBDIR += kdelibs
SUBDIR += kde-baseapps
SUBDIR += kde-workspace
SUBDIR += kde-extraapps

.include "../mk/misc/category.mk"

replace:
	${RUN} $(MAKE) distclean
	${RUN} $(MAKE) makesum
	${RUN} for sub in ariya-icons libdbusmenu-katie \
		 kdelibs kde-baseapps kde-workspace kde-extraapps;do \
		 $(MAKE) -C $$sub replace; \
	done

.PHONY: replace
