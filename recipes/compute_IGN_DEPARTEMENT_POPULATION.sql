SELECT dep.*,
       sum(commune.population) as population
  FROM "ign_departement_france" as dep
  JOIN "IGN_COMMUNE_FRANCE" as commune
    ON "IGN_COMMUNE_FRANCE"."CODE_DEPT" = "IGN_DEPARTEMENT_FRANCE"."CODE_DEPT"
  GROUP BY dep."CODE_DEPT"