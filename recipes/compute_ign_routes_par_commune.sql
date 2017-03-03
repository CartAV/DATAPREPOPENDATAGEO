SELECT
  st_intersection(commune."the_geom", route."the_geom"),
  route."CODE_DEPT",
  route."num_route"
FROM
  "ign_routes_par_departement" as route,
  ign_commune_postgis as commune
WHERE
  st_intersects(commune."the_geom", route."the_geom")