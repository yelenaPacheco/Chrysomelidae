import pandas as pd
import csv

t_df = pd.read_csv('AHE_taxonNames4_08_05updated.csv')
m_df = pd.read_csv('wwMeasurementsAll.csv')

t_names = t_df['speciesName']
m_names = m_df['speciesName']

#print(t_names)
#print(m_names)

notInTaxaList = list(set(t_names) - set(m_names))
print('There are ' + str(len(notInTaxaList)) + ' taxa without measurements.')

notInMeasureList = list(set(m_names) - set(t_names))
print('There are ' + str(len(notInMeasureList)) + ' taxa without sequences.')

df = pd.DataFrame(notInTaxaList)
df.to_csv('missingData.csv')