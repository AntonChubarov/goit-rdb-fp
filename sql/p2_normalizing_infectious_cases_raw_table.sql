USE pandemic;

CREATE TABLE entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    code VARCHAR(8) DEFAULT NULL,
    UNIQUE (name, code)
);

CREATE TABLE infectious_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    year YEAR,
    number_yaws INT,
    polio_cases INT,
    cases_guinea_worm INT,
    number_rabies DOUBLE,
    number_malaria DOUBLE,
    number_hiv DOUBLE,
    number_tuberculosis DOUBLE,
    number_smallpox INT,
    number_cholera_cases INT,
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

INSERT INTO entities (name, code)
SELECT DISTINCT entity, code
FROM infectious_cases_raw;

INSERT INTO infectious_cases (entity_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases)
SELECT
    e.id,
    icr.year,
    icr.number_yaws,
    icr.polio_cases,
    icr.cases_guinea_worm,
    icr.number_rabies,
    icr.number_malaria,
    icr.number_hiv,
    icr.number_tuberculosis,
    icr.number_smallpox,
    icr.number_cholera_cases
FROM infectious_cases_raw icr
JOIN entities e ON icr.entity = e.name AND (icr.code = e.code OR icr.code IS NULL AND e.code IS NULL);
