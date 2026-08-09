/*
Question:
Which vendors account for the highest inventory value currently in stock?

Business Value:
Calculates the total inventory value supplied by each vendor. This report helps procurement teams prioritize vendor relationships and manage inventory investment.

*/

SELECT
  v.vendor_name,
  ROUND(SUM(i.qty_on_hand * m.unit_cost), 2) AS inventory_value
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.materials` m
ON i.material_id = m.material_id
JOIN `rhoden_erp.vendors` v
ON m.vendor_id = v.vendor_id
GROUP BY
  v.vendor_name
ORDER BY
  inventory_value DESC;