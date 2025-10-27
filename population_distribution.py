import pandas as pd

# Load Excel
df = pd.read_excel("populacia_filtered.xlsx")

# Define mapping from 5-year bins to 10-year bins
age_mapping = {
    "0-4 yrs.": "0-9",
    "5-9 yrs.": "0-9",
    "10-14 yrs.": "10-19",
    "15-19 yrs.": "10-19",
    "20-24 yrs.": "20-29",
    "25-29 yrs.": "20-29",
    "30-34 yrs.": "30-39",
    "35-39 yrs.": "30-39",
    "40-44 yrs.": "40-49",
    "45-49 yrs.": "40-49",
    "50-54 yrs.": "50-59",
    "55-59 yrs.": "50-59",
    "60-64 yrs.": "60-69",
    "65-69 yrs.": "60-69",
    "70-74 yrs.": "70-79",
    "75-79 yrs.": "70-79",
    "80-84 yrs.": "80-89",
    "85+ yrs.": "80-89"  # merging 85+ with 80–84 as per 10-year bin
}

# Define age category IDs and upper bounds for SQL
age_categories = {
    "0-9": (1, 10),
    "10-19": (2, 20),
    "20-29": (3, 30),
    "30-39": (4, 40),
    "40-49": (5, 50),
    "50-59": (6, 60),
    "60-69": (7, 70),
    "70-79": (8, 80),
    "80-89": (9, 150)
}

# Define gender IDs
gender_map = {"Male": 1, "Female": 2, "Both": 3}

# Initialize storage for SQL inserts
sql_lines = []

# Process each row
for _, row in df.iterrows():
    sex = row["Sex"]
    year = int(row["Calendar year"])
    id_year = year - 2009  # 2010 → 1, 2023 → 14, etc.
    id_gender = gender_map.get(sex, 3)

    # Aggregate 5-year bins into 10-year bins
    merged = {}
    for col, new_age in age_mapping.items():
        if col in row:
            merged[new_age] = merged.get(new_age, 0) + int(row[col])

    # Generate SQL insert lines
    for age_label, pop_count in merged.items():
        id_age = age_categories[age_label][0]
        sql = f"INSERT INTO demographic_distribution (id_year, id_gender, id_age, population_count) VALUES ({id_year}, {id_gender}, {id_age}, {pop_count});"
        sql_lines.append(sql)

# Write SQL to file
with open("population_inserts.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(sql_lines))

print("✅ SQL file 'population_inserts.txt' created successfully.")
