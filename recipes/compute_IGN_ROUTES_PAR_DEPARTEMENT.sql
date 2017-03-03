SELECT st_union(route.the_geom::geometry) as the_geom, dep."CODE_DEPT"
  FROM "ign_troncon_route_postgis" as route, IGN_DEPARTEMENT_pg as dep
  WHERE st_within(route.the_geom::geometry, dep.the_geom::geometry)
        AND route.the_geom && dep.the_geom
  GROUP BY dep."CODE_DEPT"