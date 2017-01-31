# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Recipe inputs
ds = dataiku.Dataset("2016_geohisto_communes_prep")
df = ds.get_dataframe()
df = df[['norm_name','id','dep_code']]

aggregations={
    'id': {lambda x: '[{}]'.format(','.join(x))},
    'dep_code': {lambda x: '[{}]'.format(','.join(x.astype(str)))}
    }
df=df.groupby('norm_name').agg(aggregations)

# Recipe outputs
ds_out = dataiku.Dataset("2016_geohisto_communes_for_fuzzy")
ds_out.write_with_schema(df)
