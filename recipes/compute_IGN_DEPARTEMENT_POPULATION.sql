SELECT dep.*,
       sum(commune."POPULATION") as population
  FROM "ign_departement_france" as dep
  JOIN "ign_commune_france" as commune
    ON commune."CODE_DEPT" = dep."CODE_DEPT"
  GROUP BY dep."CODE_DEPT"