SELECT
  st_linemerge(st_intersection(commune."the_geom", route."the_geom")::geometry) as the_geom,
  st_geojson(the_geom) as geojson
  "INSEE_COM",
  route.num_route_or_id
FROM
  osm_routes_par_departement as route,
  ign_commune_france as commune
WHERE
  commune."the_geom" && route."the_geom"