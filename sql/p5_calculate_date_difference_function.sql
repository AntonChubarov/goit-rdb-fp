USE pandemic;

DROP FUNCTION IF EXISTS year_difference;

DELIMITER //

CREATE FUNCTION year_difference(input_year YEAR)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    DECLARE diff_years INT;
    SET start_date = STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d');
    SET diff_years = TIMESTAMPDIFF(YEAR, start_date, CURDATE());
    RETURN diff_years;
END //

DELIMITER ;

SELECT
    year,
    year_difference(year) AS year_difference
FROM
    infectious_cases
WHERE
    year IS NOT NULL;
