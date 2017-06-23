SELECT dep.*,
       pop.population
  FROM "ign_departement_france" as dep
  LEFT JOIN (
      SELECT sum(commune."POPULATION"::int) as population,
             "NOM_DEPT"
        FROM "ign_commune_france" as commune
        GROUP BY "NOM_DEPT"
      ) AS pop
    ON pop."NOM_DEPT" = dep."NOM_DEPT"
