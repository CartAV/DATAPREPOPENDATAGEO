SELECT dep.*, sum("cummul_km") as longueur_routes
  FROM "IGN_DEPARTEMENT_FRANCE" as dep, "osm_routes_par_departement" as routes
  GROUP BY dep(CODE_DEPT)
