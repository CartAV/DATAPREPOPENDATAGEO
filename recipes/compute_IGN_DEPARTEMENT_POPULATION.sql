SELECT dep.*,
       sum(commune.population) as population
  FROM "ign_departement_france" as dep
  JOIN "ign_commune_france" as commune
    ON commune."CODE_DEPT" = dept."CODE_DEPT"
  GROUP BY dep."CODE_DEPT"