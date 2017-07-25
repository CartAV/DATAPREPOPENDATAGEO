select c."INSEE_COM", c."NOM_COM", b.* from "public"."ign_commune_france" c, "bornes_routes_2016_stacked" b 
where ST_CONTAINS(c.the_geom::geometry, ST_SetSRID(ST_MakePoint(b.lon, b.lat),4326))