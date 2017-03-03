SELECT
  st_intersection(commune."the_geom", route."the_geom"),
  route."CODE_DEPT",
  route."NUM_ROUTE"
FROM
  "ign_routes_par_departement" as route,
  "IGN_COMMUNE_postgis" as commune
WHERE
  st_intersects(commune."the_geom", route."the_geom")