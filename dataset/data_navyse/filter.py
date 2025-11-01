import pandas as pd

# Načítanie Excel súboru
df = pd.read_excel('zdravotne_sestry.xlsx')

# Vynechanie prvého riadku
df_filtered = df.iloc[1:]

# Filtrácia: hodnoty v 7. stĺpci väčšie ako 2009
df_filtered = df_filtered[df_filtered.iloc[:, 6] > 2009]

# Zoradenie podľa 7. stĺpca od najmenšieho
df_filtered = df_filtered.sort_values(by=df_filtered.columns[6])

# Uloženie do nového Excel súboru
df_filtered.to_excel('udaje_zdravotne_sestry.xlsx', index=False)

print("Údaje boli úspešne uložené do 'vystup.xlsx' a zoradené podľa 7. stĺpca.")
