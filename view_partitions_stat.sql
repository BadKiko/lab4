-- View: data.partitions_stat

-- DROP VIEW data.partitions_stat;

CREATE OR REPLACE VIEW data.partitions_stat
 AS
 SELECT p.relname AS partition_name,
    p.reltuples AS row_count
   FROM pg_class p
     JOIN pg_inherits i ON p.oid = i.inhrelid
     JOIN pg_class c ON i.inhparent = c.oid
  WHERE c.relname = 'measurement'::name AND p.relkind = 'r'::"char" AND p.reltuples > 0::double precision
  ORDER BY p.reltuples;

ALTER TABLE data.partitions_stat
    OWNER TO postgres;

