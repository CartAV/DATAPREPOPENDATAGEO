SELECT
  st_linemerge(st_intersection(commune."the_geom", route."the_geom")::geometry) as the_geom,
  route."CODE_DEPT",
  route.num_route_or_id
FROM
  osm_routes_par_departement as route,
  ign_commune_france as commune
WHERE
  st_intersects(commune."the_geom", route."the_geom")