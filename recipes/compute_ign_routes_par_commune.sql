SELECT
  st_intersection(commune."the_geom", route."the_geom")::geography(MultiLineString),
  route."CODE_DEPT",
  route.num_route_or_id
FROM
  ign_routes_par_departement as route,
  ign_commune_postgis as commune
WHERE
  st_intersects(commune."the_geom", route."the_geom")