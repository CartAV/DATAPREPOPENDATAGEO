SELECT *
  FROM "osm_routes_par_departement"
  WHERE ("CODE_DEPT" = '75' AND "num_route_or_id" like '%Boulevard Périphérique%' AND "cat_route_osm" = 'route principale')

/* Traitement a part du periph parisien pour ne pas qu'il se fasse saucissonner */