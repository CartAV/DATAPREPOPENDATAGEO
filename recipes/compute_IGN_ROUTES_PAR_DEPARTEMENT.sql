SELECT
    st_union(route.the_geom::geometry) as the_geom,
    dep."CODE_DEPT",
    COALESCE("NUM_ROUTE", "ID_RTE500") as num_route_or_id
  FROM "ign_troncon_route_postgis" as route, IGN_DEPARTEMENT_pg as dep
  WHERE st_within(route.the_geom::geometry, dep.the_geom::geometry)
  GROUP BY dep."CODE_DEPT", num_route_or_id