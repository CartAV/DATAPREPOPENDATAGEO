# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Recipe inputs
ds = dataiku.Dataset("2016_geohisto_communes_prep")
df = ds.get_dataframe(infer_with_pandas=False)

df=df.groupby('nomr_name').agg(lambda x: '[{}]'.format(','.join(set(x))) )

# Recipe outputs
ds_out = dataiku.Dataset("2016_geohisto_communes_for_fuzzy")
ds_out.write_with_schema(df)
