CREATE TABLE IF NOT EXISTS sickness (
    id SERIAL NOT NULL PRIMARY KEY,
    sickness_label TEXT NOT NULL,
    id_parent_sickness INT REFERENCES sickness (id)
);

CREATE TABLE IF NOT EXISTS gender_category (
    id SERIAL NOT NULL PRIMARY KEY,
    gender_label TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS age_category (
    id SERIAL NOT NULL PRIMARY KEY,
    age_upper_bound INT NOT NULL,
    age_group_label VARCHAR(5) NOT NULL 
);

CREATE TABLE IF NOT EXISTS data_years (
    id SERIAL NOT NULL PRIMARY KEY,
    year_value INT NOT NULL
);

CREATE TABLE IF NOT EXISTS activity_type (
    id SERIAL NOT NULL PRIMARY KEY,
    activity_type VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS total_population (
    id SERIAL NOT NULL PRIMARY KEY,
    id_year INT REFERENCES data_years(id),
    population_total BIGINT NOT NULL
 );

CREATE TABLE IF NOT EXISTS demographic_distribution (
    id SERIAL NOT NULL PRIMARY KEY,
    id_year INT REFERENCES data_years(id),
    id_gender INT REFERENCES gender_category(id),
    id_age INT REFERENCES age_category(id),
    population_count INT,
    population_percentage FLOAT
);

CREATE OR REPLACE FUNCTION update_demographic_percentage()
RETURNS TRIGGER AS $$
DECLARE
    total_pop BIGINT;
BEGIN
    SELECT population_total
    INTO total_pop
    FROM total_population
    WHERE id_year = NEW.id_year
    LIMIT 1;

    -- Calculate percentage
    IF total_pop IS NOT NULL THEN
        NEW.population_percentage := (NEW.population_count::FLOAT / total_pop::FLOAT) * 100;
    ELSE
        RAISE WARNING 'Total population for year % not found!', NEW.id_year;
        NEW.population_percentage := NULL;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_update_demographic_percentage ON demographic_distribution;

CREATE TRIGGER trg_update_demographic_percentage
AFTER INSERT OR UPDATE ON demographic_distribution
FOR EACH ROW
EXECUTE FUNCTION update_demographic_percentage();

CREATE TABLE IF NOT EXISTS sickness_statistics (
    id SERIAL NOT NULL PRIMARY KEY,
    id_demographic INT REFERENCES demographic_distribution(id),
    id_sickness INT REFERENCES sickness(id),
    count_cases INT,
    count_deaths INT
);

CREATE TABLE IF NOT EXISTS activity_statistics (
    id SERIAL NOT NULL PRIMARY KEY,
    id_demographic INT REFERENCES demographic_distribution(id),
    activity VARCHAR(100),
    id_activity_type INT REFERENCES activity_type(id),
    population_count INT,
    measure_value FLOAT
);
