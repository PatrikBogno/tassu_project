import pandas as pd

def generate_sickness_inserts(excel_path, output_txt_path):
    df = pd.read_excel(excel_path).fillna("")

    categories = {}
    subcategories = {}
    diseases = []

    for _, row in df.iterrows():
        cat = row["Category"].strip()
        subcat = row["Subcategory"].strip()
        disease = row["Disease name"].strip()

        if cat not in categories:
            categories[cat] = None

        if subcat and (cat, subcat) not in subcategories:
            subcategories[(cat, subcat)] = None

        if disease:
            diseases.append((cat, subcat, disease))

    sql_lines = []

    sql_lines.append("-- 1. Insert all Categories")
    sql_lines.append("INSERT INTO sickness (sickness_label)\nSELECT label FROM (VALUES")
    sql_lines += [f"    ('{cat}')" + ("," if i < len(categories)-1 else "") for i, cat in enumerate(categories.keys())]
    sql_lines.append(") AS v(label)\nWHERE NOT EXISTS (SELECT 1 FROM sickness s WHERE s.sickness_label = v.label);\n")

    sql_lines.append("-- 2. Insert all Subcategories with link to Categories")
    sql_lines.append("INSERT INTO sickness (sickness_label, id_parent_sickness)\nSELECT v.subcat, c.id\nFROM sickness c\nJOIN (VALUES")
    sql_lines += [
        f"    ('{cat}', '{subcat}')" + ("," if i < len(subcategories)-1 else "")
        for i, (cat, subcat) in enumerate(subcategories.keys())
    ]
    sql_lines.append(") AS v(cat, subcat) ON c.sickness_label = v.cat\nWHERE NOT EXISTS (SELECT 1 FROM sickness s WHERE s.sickness_label = v.subcat);\n")

    sql_lines.append("-- 3. Insert all Diseases with link to Subcategories")
    sql_lines.append("INSERT INTO sickness (sickness_label, id_parent_sickness)\nSELECT v.disease, s.id\nFROM sickness s\nJOIN (VALUES")
    sql_lines += [
        f"    ('{subcat}', '{disease}')" + ("," if i < len(diseases)-1 else "")
        for i, (cat, subcat, disease) in enumerate(diseases)
    ]
    sql_lines.append(") AS v(subcat, disease) ON s.sickness_label = v.subcat\nWHERE NOT EXISTS (SELECT 1 FROM sickness d WHERE d.sickness_label = v.disease);\n")

    with open(output_txt_path, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_lines))


generate_sickness_inserts("./dataset/rozdelenie_chorob_translated.xlsx",
                          "./dataset/sickness_inserts.txt")

