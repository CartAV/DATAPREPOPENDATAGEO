SELECT *,
       st_asgeojson(the_geom) as geojson
  FROM "osm_routes_par_commune"