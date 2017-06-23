SELECT "CODE_REG",
       "NOM_REG",
       "CODE_DEPT",
       "NOM_DEPT",
       "CODE_CHF",
       "NOM_CHF",
       population,
       st_asgeojson(the_geom) as geojson,
       longueur_routes
  FROM "ign_departement_population" as dep,
  LATERAL (
      SELECT sum("cummul_km") as longueur_routes
        FROM "osm_routes_par_departement" as routes
        WHERE dep."CODE_DEPT" = routes."CODE_DEPT"
  ) as routes
  
