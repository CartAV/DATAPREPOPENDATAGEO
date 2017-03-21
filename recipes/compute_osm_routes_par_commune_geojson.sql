SELECT *,
       st_geojson(the_geom) as geojson
  FROM "osm_routes_par_commune"