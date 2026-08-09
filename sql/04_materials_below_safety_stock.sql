/*

Business Question:
Which materials are currently below their safety stock levels at each plant?

Business Value:
Identifies inventory shortages by plant before they result in production
delays or stockouts. This report enables inventory planners and plant
managers to prioritize replenishment, maintain optimal inventory levels,
and support uninterrupted manufacturing operations.

*/

SELECT
  p.plant_name,
  m.material_id,
  i.qty_on_hand,
  i.safety_stock-i.qty_on_hand AS shortage_quantity
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.materials` m
ON i.material_id = m.material_id
JOIN `rhoden_erp.plants` p
ON i.plant_id = p.plant_id
WHERE i.qty_on_hand < i.safety_stock
ORDER BY
  p.plant_name,
  i.qty_on_hand ASC;