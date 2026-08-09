/*

Business Question:
Which plants have the most critical inventory items?

Business Value:
Identifies plants with the highest number of inventory shortages, allowing operations teams to prioritize replenishment efforts and reduce the risk of production delays.

*/

SELECT
  p.plant_name,
  COUNT(i.material_id) AS critical_items
FROM `rhoden_erp.plants` p
JOIN `rhoden_erp.inventory` i
ON p.plant_id = i.plant_id
WHERE i.qty_on_hand < i.safety_stock
GROUP BY
  p.plant_name
ORDER BY
  critical_items DESC;