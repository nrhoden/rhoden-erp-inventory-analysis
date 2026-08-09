/*

Business Question:
Which material categories represent the highest inventory value?

Business Value:
Summarizes inventory investment by material category to identify where the
largest portions of inventory capital are allocated. This report helps
management prioritize inventory optimization efforts, monitor category-level
spending, and support purchasing and budgeting decisions.

*/

SELECT
  m.category,
ROUND(SUM(i.qty_on_hand * m.unit_cost), 2) AS inventory_value
FROM `rhoden_erp.inventory` i
JOIN `rhoden_erp.materials` m
ON i.material_id = m.material_id
GROUP BY
  m.category
ORDER BY 
  inventory_value DESC;