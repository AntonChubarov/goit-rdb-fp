USE pandemic;

SELECT
    e.name as entity,
    e.code,
    AVG(ic.number_rabies) AS avg_rabies,
    MIN(ic.number_rabies) AS min_rabies,
    MAX(ic.number_rabies) AS max_rabies,
    SUM(ic.number_rabies) AS sum_rabies
FROM
    infectious_cases ic
JOIN
    entities e ON ic.entity_id = e.id
WHERE
    ic.number_rabies IS NOT NULL
GROUP BY
    e.name, e.code
ORDER BY
    avg_rabies DESC
LIMIT 10;
