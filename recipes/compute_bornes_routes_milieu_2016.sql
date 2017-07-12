SELECT route, nom_courant_route, pr, "depPr", concession, gestionnai, avg(lat), avg(lon)
  FROM "bornes_routes_2016" group by route, nom_courant_route, pr, "depPr", concession, gestionnai order by route, pr

/*on garde un point unique qui est la moyenne des pk droits et gauches"*/