/* contrib/greenplum_fdw/greenplum_fdw--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION greenplum_fdw" to load this file. \quit

CREATE FUNCTION greenplum_fdw_handler()
RETURNS fdw_handler
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE FUNCTION greenplum_fdw_validator(text[], oid)
RETURNS void
AS 'MODULE_PATHNAME'
LANGUAGE C STRICT;

CREATE FOREIGN DATA WRAPPER greenplum_fdw
  HANDLER greenplum_fdw_handler
  VALIDATOR greenplum_fdw_validator;
