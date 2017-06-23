SELECT dep.*,
       pop.population
  FROM "ign_departement_france" as dep
  LEFT JOIN (
      SELECT sum(commune."POPULATION"::int) as population,
             "CODE_DEPT"
        FROM "ign_commune_france" as commune
        GROUP BY "CODE_DEPT"
      ) AS pop
    ON pop."CODE_DEPT" = dep."CODE_DEPT"
