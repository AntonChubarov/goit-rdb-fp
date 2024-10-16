USE pandemic;

SELECT
    year,
    CONCAT(year, '-01-01') AS year_start_date,
    CURDATE() AS currrent_date,
    TIMESTAMPDIFF(YEAR, CONCAT(year, '-01-01'), CURDATE()) AS year_difference
FROM
    infectious_cases
WHERE
    year IS NOT NULL;
