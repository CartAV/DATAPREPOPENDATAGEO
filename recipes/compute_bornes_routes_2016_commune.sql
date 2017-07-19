select c."INSEE_COM", c."NOM_COM", b.* from "IGN_COMMUNE_FRANCE" c, "bornes_routes_2016" b 
where ST_CONTAINS(c.the_geom::geometry, ST_SetSRID(ST_MakePoint(b.lon, b.lat),4326))