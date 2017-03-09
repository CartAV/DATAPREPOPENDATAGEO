SELECT
    st_union(route.geom_way::geometry) as the_geom,
    dep."CODE_DEPT",
    COALESCE("osm_name", "id"::text) as num_route_or_id
  FROM osm_2po_4pgr as route, IGN_DEPARTEMENT_FRANCE as dep
  WHERE st_within(route.geom_way::geometry, dep.the_geom::geometry)
  GROUP BY dep."CODE_DEPT", num_route_or_id