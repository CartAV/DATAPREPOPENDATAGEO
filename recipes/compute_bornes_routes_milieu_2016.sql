SELECT route, nom_courant_route, pr, "depPr", concession, gestionnai, avg(lat) as lat, avg(lon) as lon
  FROM "bornes_routes_2016_stacked" group by route, nom_courant_route, pr, "depPr", concession, gestionnai order by route, pr

/*on garde un point unique qui est la moyenne des pk droits et gauches"*/