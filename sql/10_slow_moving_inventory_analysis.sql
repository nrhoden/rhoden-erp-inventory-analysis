/*

Business Question:
Identify materials with the oldest production activity and highest inventory value that may require inventory review.

Business Value:
Identifies slow-moving materials with inventory still on hand, helping reduce excess stock, improve inventory turnover, and minimize tied-up capital.

*/

SELECT
  m.material_name,
  i.qty_on_hand,
  MAX(po.production_date) AS last_production_date,
  ROUND(i.qty_on_hand * m.unit_cost, 2) AS inventory_value
FROM `rhoden_erp.materials` m
LEFT JOIN `rhoden_erp.production` po
ON m.material_id = po.material_id
JOIN `rhoden_erp.inventory` i
ON m.material_id = i.material_id
GROUP BY
  m.material_name,
  i.qty_on_hand,
  m.unit_cost
HAVING
  MAX(po.production_date) <= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
ORDER BY
  inventory_value DESC;