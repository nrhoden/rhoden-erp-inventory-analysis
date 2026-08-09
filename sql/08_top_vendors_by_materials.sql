/*

Business Question:
Identify the suppliers that provide the highest number of materials.

Business Value:
Identifies the suppliers with the broadest material coverage, helping management understand supplier importance and improve sourcing strategy.

*/

SELECT
  v.vendor_name,
  COUNT(material_id) AS total_materials
FROM `rhoden_erp.vendors` v
JOIN `rhoden_erp.materials` m
ON v.vendor_id = m.vendor_id
GROUP BY
  v.vendor_name
ORDER BY
  total_materials DESC
LIMIT 10;