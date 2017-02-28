SELECT *,
  st_transform(st_setSRID(st_makepoint("X_CHF_LIEU", "Y_CHF_LIEU"), 2154), 4326) as chef_lieu,
  st_setSRID(st_geomfromtext(the_geom), 4326) as geometry
  FROM "ign_departement_pg"