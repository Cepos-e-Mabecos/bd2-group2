FROM postgres:12
# Loads scripts in alphabetic order.
ADD ./a_schema.sql /docker-entrypoint-initdb.d/
ADD ./b_uuid_generator.sql /docker-entrypoint-initdb.d/
ADD ./c_insert.sql /docker-entrypoint-initdb.d/
ADD ./d_delete.sql /docker-entrypoint-initdb.d/
ADD ./e_select.sql /docker-entrypoint-initdb.d/
ADD ./f_update.sql /docker-entrypoint-initdb.d/
ADD ./g_trigger.sql /docker-entrypoint-initdb.d/
