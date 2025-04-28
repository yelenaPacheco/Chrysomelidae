import os
import csv
import pandas as pd 


# Remove all entries of excel file that have been sequenced, write unsequenced entries to new file 

#read in excel file, specifiy date format for columns containing dates 
df = pd.read_excel('Chrysomelidae_specimens_for_phylo.xlsx', date_parser=lambda x: pd.to_datetime(x, format='%d/%m/%Y'))
#remove any entries (rows) that have and 'x' in the 'Preparied_for_sequencing' column 
df_No_sequence = df[df.Preparied_for_sequencing != 'x']
#print new data frame to check
print(df_No_sequence)

#write new data frame to new excel document 
df_No_sequence.to_excel('Chryso_draft_plate02.xlsx')


## when opening new excel doc in excel you will need to format cells with dates based on desired format
## dates will show up as '######' but data is still there, just needs cell formating. 



