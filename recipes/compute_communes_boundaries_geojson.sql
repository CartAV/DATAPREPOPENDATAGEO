SELECT *, ST_AsGeoJSON(the_geom)
  FROM "communes_boundaries_postgis"