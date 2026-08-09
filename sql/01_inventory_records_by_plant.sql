/*
Business Question:
How many inventory records does each manufacturing plant currently manage?

Business Value:
Helps operations understand how inventory records are distributed across manufacturing facilities.
*/

SELECT
    p.plant_name,
    COUNT(*) AS inventory_records
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.plants` p
ON i.plant_id = p.plant_id
GROUP BY
  p.plant_name
ORDER BY
  inventory_records DESC;