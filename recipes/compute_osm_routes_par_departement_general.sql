-- On traite le périph parisien séparément pour unifier l’intérieur et extérieur
SELECT the_geom,  "CODE_DEPT", num_route_or_id, cat_route_osm
  FROM "osm_routes_par_departement"
  WHERE NOT ("CODE_DEPT" = '75' AND "num_route_or_id" like '%Boulevard Périphérique%' AND "cat_route_osm" = 'route principale')

UNION

SELECT ST_UNION(the_geom::geometry) as the_geom, '75056' as "INSEE_COM", 'Boulevard Périphérique' as num_route_or_id, 'route principale' as cat_route_osm
  FROM "osm_routes_par_departement"
  WHERE ("CODE_DEPT" = '75' AND "num_route_or_id" like '%Boulevard Périphérique%' AND "cat_route_osm" = 'route principale')