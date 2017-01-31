# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Recipe inputs
ds = dataiku.Dataset("2016_geohisto_communes_prep")
df = ds.get_dataframe() #impossible ici d'ajouter un infer_pandas=False car l'une des colonnes est de type entier avec des NA
#du coup le "dep_code" est pris par l'infer de pandas comme un entier, ce qui droppe les 2A 2B

df = df[['norm_name','id']]

df=df.groupby('norm_name').agg(lambda x: '[{}]'.format(','.join(x.astype(str)))).reset_index()

#le département est recalculé par rapport à la commune via regexp
df['dep_code']=df['id'].replace("COM(97.|..)...?\@....\-..\-..",r"\1", regex=True)

# Recipe outputs
ds_out = dataiku.Dataset("2016_geohisto_communes_for_fuzzy")
ds_out.write_with_schema(df)
