# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Recipe inputs
2016_geohisto_communes_prep = dataiku.Dataset("2016_geohisto_communes_prep")
df = 2016_geohisto_communes_prep.get_dataframe(infer_with_pandas=False)

df=df.groupby('nomr_name').agg(lambda x: '[{}]'.format(','.join(set(x))) )

# Recipe outputs
2016_geohisto_communes_for_fuzzy = dataiku.Dataset("2016_geohisto_communes_for_fuzzy")
2016_geohisto_communes_for_fuzzy.write_with_schema(df)
