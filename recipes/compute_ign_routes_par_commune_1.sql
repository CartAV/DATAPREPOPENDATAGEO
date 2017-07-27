SELECT
  st_linemerge(st_intersection(commune."the_geom", route."the_geom"::geography)::geometry) as the_geom,
  route.num_route_or_id || "INSEE_COM"::text as num_route_com_id,
  "INSEE_COM",
  route.num_route_or_id,
  route.cat_route_osm
FROM
  osm_routes_par_departement_general as route,
  ign_commune_france as commune
WHERE
  commune."the_geom" && route."the_geom"::geography