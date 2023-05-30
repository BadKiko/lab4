-- View: data.country_cities

-- DROP VIEW data.country_cities;

CREATE OR REPLACE VIEW data.country_cities
 AS
 SELECT co.description AS country,
    count(ci.identifier) AS cities
   FROM data.countries co
     LEFT JOIN data.cities ci ON co.identifier = ci.country
  GROUP BY co.description;

ALTER TABLE data.country_cities
    OWNER TO postgres;

