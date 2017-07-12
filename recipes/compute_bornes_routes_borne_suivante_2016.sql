with b1 as (select * from "public"."bornes_routes_communes_2016") 
select b1.lon as lon_next, b1.lat as lat_next, st_distance(ST_SetSRID(ST_MakePoint(b1.lon, b1.lat),4326)::geography, ST_SetSRID(ST_MakePoint(b2.lon, b2.lat),4326)::geography) as distance_next, b2.* 
from "public"."bornes_routes_communes_2016" b2 left outer join b1
ON b1.route = b2.route and b1.pr = b2.pr + 1 and st_distance(ST_SetSRID(ST_MakePoint(b1.lon, b1.lat),4326)::geography, ST_SetSRID(ST_MakePoint(b2.lon, b2.lat),4326)::geography)<1600
order by route, pr, concession , distance_next

/* Pour chaque borne, trouve la borne sur la meme route, dont le pr vaut pr+1, du même côté, qui est à moins de 1600m */
/* Sinon, on laisse le champs vide */
/* Pas de check sur le departement, car la borne suivante peut être dans un autre departement */
/* Pas de check sur la concession car parfois même si le concessionnaire change, il y a continuité des pr */