INSERT INTO gender_category (gender_label)
SELECT label
FROM (VALUES
    ('Male'),
    ('Female'),
    ('Both'),
    ('Not Defined')
) AS v(label)
WHERE NOT EXISTS (
    SELECT 1 FROM gender_category g WHERE g.gender_label = v.label
);

INSERT INTO age_category (age_upper_bound, age_group_label)
SELECT upper_bound, label
FROM (VALUES
    (10, '0-10'),
    (20, '10-20'),
    (30, '20-30'),
    (40, '30-40'),
    (50, '40-50'),
    (60, '50-60'),
    (70, '60-70'),
    (80, '70-80'),
    (150, '80+')
) AS v(upper_bound, label)
WHERE NOT EXISTS (
    SELECT 1 FROM age_category a WHERE a.age_group_label = v.label
);

INSERT INTO data_years (year_value)
SELECT year_value
FROM (VALUES
    (2010),
    (2011),
    (2012),
    (2013),
    (2014),
    (2015),
    (2016),
    (2017),
    (2018),
    (2019),
    (2020),
    (2021),
    (2022),
    (2023),
    (2024)
) AS v(year_value)
WHERE NOT EXISTS (
    SELECT 1 FROM data_years d WHERE d.year_value = v.year_value
);

INSERT INTO activity_type (activity_type)
SELECT activity_type
FROM (VALUES
    ("Healthy"),
    ("Unhealthy")
) AS v(activity_type)
WHERE NOT EXISTS (
    SELECT 1 FROM activity_type a WHERE a.activity_type = v.year_value
);

INSERT INTO total_population (id_year, population_total)
SELECT d.id, v.population_total
FROM data_years d
JOIN (VALUES
    (2010, 128185275),
    (2011, 128096432),
    (2012, 127928285),
    (2013, 127723645),
    (2014, 127486605),
    (2015, 127275872),
    (2016, 127159951),
    (2017, 127064690),
    (2018, 126913432),
    (2019, 126699424),
    (2020, 126304543),
    (2021, 125679338),
    (2022, 124997578),
    (2023, 124370947),
    (2024, 123753041)
) AS v(year_value, population_total)
ON d.year_value = v.year_value
WHERE NOT EXISTS (
    SELECT 1 FROM total_population t WHERE t.id_year = d.id
);

INSERT INTO sickness (sickness_label)
SELECT label FROM (VALUES
    ('Infectious and Parasitic'),
    ('Carcinomas'),
    ('Carcinomas In Situ')
) AS v(label)
WHERE NOT EXISTS (SELECT 1 FROM sickness s WHERE s.sickness_label = v.label);

INSERT INTO sickness (sickness_label, id_parent_sickness)
SELECT v.subcat, c.id
FROM sickness c
JOIN (VALUES
    ('Infectious and Parasitic', 'Viral infections'),
    ('Infectious and Parasitic', 'Bacterial infections'),
    ('Infectious and Parasitic', 'Parasitic infections'),
    ('Infectious and Parasitic', 'Mycotic infections'),
    ('Infectious and Parasitic', 'Other'),
    ('Infectious and Parasitic', 'Zoonoses'),
    ('Carcinomas', 'Systemic/General'),
    ('Carcinomas', 'Lymphatic and Hemopoietic'),
    ('Carcinomas', 'Digestive system'),
    ('Carcinomas', 'Respiratory system/Thorax'),
    ('Carcinomas', 'Urogenital system'),
    ('Carcinomas', 'Endocrine system'),
    ('Carcinomas', 'Nervous system'),
    ('Carcinomas In Situ', 'Carcinoma In Situ (CIS)')
) AS v(cat, subcat) ON c.sickness_label = v.cat
WHERE NOT EXISTS (SELECT 1 FROM sickness s WHERE s.sickness_label = v.subcat);

INSERT INTO sickness (sickness_label, id_parent_sickness)
SELECT v.disease, s.id
FROM sickness s
JOIN (VALUES
    ('Viral infections', '2019-nCoV infection'),
    ('Viral infections', 'Acquired immunodeficiency syndrome (AIDS)'),
    ('Viral infections', 'Acute poliomyelitis'),
    ('Viral infections', 'Avian influenza (exclud. Avian influenza both H5N1 and H7N9)'),
    ('Viral infections', 'Avian influenza H5N1'),
    ('Viral infections', 'Avian influenza H7N9'),
    ('Viral infections', 'Chikungunya fever'),
    ('Viral infections', 'Congenital rubella syndrome'),
    ('Viral infections', 'Creutzfeldt-Jakob disease'),
    ('Viral infections', 'Crimean-Congo hemorrhagic fever'),
    ('Viral infections', 'Dengue fever'),
    ('Viral infections', 'Eastern equine encephalitis'),
    ('Viral infections', 'Hantavirus pulmonary syndrome'),
    ('Viral infections', 'Hendra virus infection'),
    ('Viral infections', 'Hepatitis A'),
    ('Viral infections', 'Hepatitis E'),
    ('Viral infections', 'Herpes B virus infection'),
    ('Viral infections', 'Japanese encephalitis'),
    ('Viral infections', 'Rift Valley fever'),
    ('Viral infections', 'Severe Acute Respiratory Syndrome (SARS)'),
    ('Viral infections', 'Smallpox'),
    ('Viral infections', 'Varicella (limited to hospiltalized case)'),
    ('Viral infections', 'Venezuelan equine encephalitis'),
    ('Viral infections', 'Viral hepatitis(excluding hepatitis A and E)'),
    ('Viral infections', 'West Nile fever'),
    ('Viral infections', 'Western equine encephalitis'),
    ('Viral infections', 'Yellow fever'),
    ('Viral infections', 'Zika virus infection'),
    ('Bacterial infections', 'Anthrax'),
    ('Bacterial infections', 'Botulism'),
    ('Bacterial infections', 'Brucellosis'),
    ('Bacterial infections', 'Carbapenem-resistant Enterobacterales infection'),
    ('Bacterial infections', 'Carbapenem-resistant enterobacteriaceae infection'),
    ('Bacterial infections', 'Cholera'),
    ('Bacterial infections', 'Diphtheria'),
    ('Bacterial infections', 'Enterohemorrhagic Escherichia coli infection'),
    ('Bacterial infections', 'Epidemic typhus'),
    ('Bacterial infections', 'Glanders'),
    ('Bacterial infections', 'Invasive haemophilus influenzae infection'),
    ('Bacterial infections', 'Invasive meningococcal infection'),
    ('Bacterial infections', 'Invasive streptococcal pneumoniae infection'),
    ('Bacterial infections', 'Japanese spotted fever'),
    ('Bacterial infections', 'Plague'),
    ('Bacterial infections', 'Q fever'),
    ('Bacterial infections', 'Salmonellosis'),
    ('Bacterial infections', 'Shiga toxin-producing E. coli infection'),
    ('Bacterial infections', 'Shigellosis'),
    ('Bacterial infections', 'Streptococcal toxic shock syndrome'),
    ('Bacterial infections', 'Tetanus'),
    ('Bacterial infections', 'Tuberculosis'),
    ('Bacterial infections', 'Tularemia'),
    ('Bacterial infections', 'Typhoid fever'),
    ('Bacterial infections', 'Vancomycin-resistant Enterococcus infection'),
    ('Bacterial infections', 'Vancomycin-resistant S. aureus infection'),
    ('Parasitic infections', 'Amebiasis'),
    ('Parasitic infections', 'Cryptosporidiosis'),
    ('Parasitic infections', 'Echinococcosis'),
    ('Parasitic infections', 'Giardiasis'),
    ('Parasitic infections', 'Malaria'),
    ('Parasitic infections', 'Trypanosomiasis'),
    ('Mycotic infections', 'Coccidioidomycosis'),
    ('Mycotic infections', 'Disseminated cryptococcal infection'),
    ('Mycotic infections', 'Pneumocystis pneumonia'),
    ('Other', 'Acute Flaccid Paralysis (excluding Acute poliomyelitis)'),
    ('Other', 'Acute encephalitis(excluding JE and WNE)'),
    ('Other', 'Hemorrhagic fever with renal syndrome'),
    ('Other', 'Middle East Respiratory Syndrome (MERS)'),
    ('Zoonoses', 'Rabies (in humans)'),
    ('Systemic/General', 'C00-C96'),
    ('Systemic/General', 'C00-C96 D00-D09'),
    ('Systemic/General', 'C53-C55'),
    ('Lymphatic and Hemopoietic', 'Malignant immunoproliferative disease'),
    ('Lymphatic and Hemopoietic', 'Malignant tumors originating or presumed to originate from lymphatic, hemopoietic and related tissue'),
    ('Digestive system', 'Hepatocellular carcinoma'),
    ('Digestive system', 'Malignant tumors of the lip, oral cavity and pharynx'),
    ('Digestive system', 'Malignant tumors of the gallbladder and malignant tumors of other and unspecified parts of the biliary tract'),
    ('Digestive system', 'Malignant neoplasm of colon'),
    ('Digestive system', 'Malignant neoplasm of colon, rectosigmoid junction, and rectum'),
    ('Digestive system', 'Malignant neoplasm of the rectum'),
    ('Digestive system', 'Malignant neoplasm of the esophagus'),
    ('Digestive system', 'Malignant neoplasm of the pancreas'),
    ('Digestive system', 'Malignant neoplasm of the stomach'),
    ('Respiratory system/Thorax', 'Malignant neoplasm of the larynx'),
    ('Respiratory system/Thorax', 'Malignant neoplasm of trachea, bronchus, and lung'),
    ('Respiratory system/Thorax', 'Malignant neoplasm of the breast'),
    ('Urogenital system', 'Malignant neoplasms of urinary system'),
    ('Urogenital system', 'Malignant neoplasm of the cervix uteri'),
    ('Urogenital system', 'Malignant neoplasm of the bladder'),
    ('Urogenital system', 'Malignant neoplasm of myometrium'),
    ('Urogenital system', 'Malignant neoplasm of the prostate'),
    ('Endocrine system', 'Malignant neoplasm of the thyroid gland'),
    ('Nervous system', 'Malignant neoplasms of the central nervous system'),
    ('Carcinoma In Situ (CIS)', 'Carcinoma in situ of colon'),
    ('Carcinoma In Situ (CIS)', 'Carcinoma in situ of cervix uteri'),
    ('Carcinoma In Situ (CIS)', 'Carcinoma in situ of bladder'),
    ('Carcinoma In Situ (CIS)', 'Carcinoma in situ of esophagus'),
    ('Carcinoma In Situ (CIS)', 'Carcinoma in situ of breast'),
    ('Carcinoma In Situ (CIS)', 'Carcinomas in situ of the lower digestive tract')
) AS v(subcat, disease) ON s.sickness_label = v.subcat
WHERE NOT EXISTS (SELECT 1 FROM sickness d WHERE d.sickness_label = v.disease);
