/*

Business Question:
Which 10 materials currently represent the highest inventory value?

Business Value:
Provides visibility into the highest-value inventory items, allowing operations teams to prioritize inventory management efforts, reduce excess stock, and improve working capital efficiency.

*/

SELECT
  m.material_name,
  ROUND(SUM(i.qty_on_hand * m.unit_cost), 2) AS inventory_value
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.materials` m
ON i.material_id = m.material_id
GROUP BY
  m.material_name
ORDER BY
  inventory_value DESC
LIMIT 10;