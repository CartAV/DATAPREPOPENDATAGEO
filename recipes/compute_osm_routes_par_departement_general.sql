SELECT *
  FROM "osm_routes_par_departement"
  WHERE NOT ("CODE_DEPT" = '75' AND "num_route_or_id" like '%Boulevard Périphérique%' AND "cat_route_osm" = 'route principale')