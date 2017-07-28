SELECT ST_UNION(the_geom::geometry)::text as the_geom, 'Boulevard Périphérique75' as num_route_com_id, '75056' as "INSEE_COM", 'Boulevard Périphérique' as num_route_or_id, 'route principale' as cat_route_osm
  FROM "osm_routes_par_departement"
  WHERE ("CODE_DEPT" = '75' AND "num_route_or_id" like '%Boulevard Périphérique%' AND "cat_route_osm" = 'route principale')

/* Traitement a part du periph parisien pour ne pas qu'il se fasse saucissonner et fusion des periphs intérieurs et exterieurs */