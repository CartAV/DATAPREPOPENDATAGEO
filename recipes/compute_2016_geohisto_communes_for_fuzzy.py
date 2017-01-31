# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Recipe inputs
ds = dataiku.Dataset("2016_geohisto_communes_prep")
df = ds.get_dataframe()
df = df[['norm_name','id','dep_code']]
df=df.groupby('norm_name')['id'].apply(lambda x: '[{}]'.format(','.join(set(x))) )
df=df.groupby('norm_name')['dep_code'].apply(lambda x: '[{}]'.format(','.join(set(x))) )

# Recipe outputs
ds_out = dataiku.Dataset("2016_geohisto_communes_for_fuzzy")
ds_out.write_with_schema(df)
