/*
Question:
Which plants have the highest inventory value?

Business Value:
Helps leadership understand where inventory investment is
concentrated across manufacturing facilities.
*/
SELECT
  p.plant_name,
  SUM(i.qty_on_hand * m.unit_cost) AS inventory_value
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.materials` m
ON i.material_id = m.material_id
JOIN `rhoden_erp.plants` p
ON i.plant_id = p.plant_id
GROUP BY
  p.plant_name
ORDER BY
  inventory_value DESC;