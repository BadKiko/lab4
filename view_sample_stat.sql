-- View: data.mat_sample_stat

-- DROP MATERIALIZED VIEW IF EXISTS data.mat_sample_stat;

CREATE VIEW IF NOT EXISTS data.sample_stat
TABLESPACE pg_default
AS
 SELECT c.identifier,
    c.description,
    min(m.mark) AS min_date,
    max(m.mark) AS max_date,
    min((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS min_temperature_celsius,
    max((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS max_temperature_celsius,
    avg((m.temperature - 32::double precision) * 5::double precision / 9::double precision) AS avg_temperature_celsius,
    count(*) AS measurement_count
   FROM data.cities c
     JOIN data.measurement m ON c.identifier = m.city
  WHERE m.temperature > ('-99'::integer * 5 / 9)::double precision
  GROUP BY c.identifier, c.description
WITH DATA;

ALTER TABLE IF EXISTS data.mat_sample_stat
    OWNER TO postgres;