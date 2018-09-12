# contrib/greenplum_fdw/Makefile

MODULE_big = greenplum_fdw
OBJS = greenplum_fdw.o option.o deparse.o connection.o shippable.o $(WIN32RES)
PGFILEDESC = "greenplum_fdw - foreign data wrapper for Greenplum"

PG_CPPFLAGS = -I$(libpq_srcdir)
SHLIB_LINK_INTERNAL = $(libpq)

EXTENSION = greenplum_fdw
DATA = greenplum_fdw--1.0.sql

REGRESS = greenplum_fdw

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
SHLIB_PREREQS = submake-libpq
subdir = contrib/greenplum_fdw
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
