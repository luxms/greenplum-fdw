 Greenplum FDW for PostgreSQL 9.1+
==============================

This PostgreSQL extension implements a Foreign Data Wrapper (FDW) for
the [Greenplum database](https://greenplum.org/), which is actually PostgreSQL fork with MPP capabilities.

Greenplum 5 is based on PostgreSQL 8.3 (as of Sept. 2018) and uses libpq wire protocol. So it would be possible just to use postgres_fdw.
But if you do, you will see the error like this:

```
ERROR:  Greenplum Database does not support REPEATABLE READ transactions. (variable.c:562)
CONTEXT:  remote SQL command: START TRANSACTION ISOLATION LEVEL REPEATABLE READ
```

You should change isolation level to `SERIALIZABLE` in your PostgreSQL session to overcome this issue. If you feel it impractical (like me do), keep reading!

Another option is to configure FDW to use specific isolation level when it connects to remote database. That is not currently possible but I hope it will be part of the [postgres_fdw](https://github.com/postgres/postgres/tree/master/contrib/postgres_fdw) in the future. If you desperate, just use the greenplum_fdw.

 Same code, different isolation level
==============================

This is the same code, as the postgres_fdw. The only changes are:

 * postgres_fdw renamed to greenplum_fdw where reasonable
 * isolation level for remote transactions set to `SERIALIZABLE`

All [documentation for postgres_fdw](https://www.postgresql.org/docs/current/static/postgres-fdw.html) is releveant and can be used to configure greenplum_fdw.

To make the fork I followed [git Kung-Fu instructions from SO](https://stackoverflow.com/questions/24577084/forking-a-sub-directory-of-a-repository-on-github-and-making-it-part-of-my-own-r), so I hope to keep the code in sync with the mainstream postgres_fdw

 Installation
==============================

Currently we provide only version for PostgreSQL 12 and 13. For specific PostgreSQL versions you need corresponding branch:

| You DB Version  | Branch name        |
|-----------------|--------------------|
| PostgreSQL 11.x | gpdb-REL_11_STABLE |
| PostgreSQL 12.x | gpdb-REL_12_STABLE |

For example for PostgreSQL 11:

```sh
git checkout gpdb-REL_11_STABLE
USE_PGXS=1 make
sudo make USE_PGXS=1 install
```
