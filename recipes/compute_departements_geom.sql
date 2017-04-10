SELECT *
  FROM "departements_wgs84_postgis" as dep, "osm_routes_par_departement" as routes
  GROUP BY dep(CODE_DEPT)
