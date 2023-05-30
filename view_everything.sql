-- View: data.everything

-- DROP VIEW data.everything;

CREATE OR REPLACE VIEW data.everything
 AS
 SELECT r.description AS region_description,
    c.description AS country_description,
    ci.description AS city_description,
    ci.latitude,
    ci.longitude,
    ci.dataset
   FROM data.regions r
     JOIN data.countries c ON r.identifier = c.region
     JOIN data.cities ci ON c.identifier = ci.country;

ALTER TABLE data.everything
    OWNER TO postgres;

