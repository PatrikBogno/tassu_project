INSERT INTO gender_category (gender_label)
VALUES
    ('Male'),
    ('Female'),
    ('Both'),
    ('Not Defined');

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

