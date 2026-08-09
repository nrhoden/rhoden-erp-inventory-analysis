/*

Business Question:
Which purchase orders are currently open, and which vendors are responsible for fulfilling them?

Business Value:
Provides visibility into outstanding purchase orders, helping procurement
teams monitor supplier commitments, track expected deliveries, and identify
potential delays that could impact inventory availability and production.

*/

SELECT
  pur.po_id,
  v.vendor_name,
  m.material_name,
  pur.quantity,
  pur.expected_delivery,
  pur.status
FROM `rhoden_erp.purchases` pur
JOIN `rhoden_erp.vendors` v
ON pur.vendor_id = v.vendor_id
JOIN `rhoden_erp.materials` m
ON pur.material_id = m.material_id
WHERE pur.status = 'Open'
ORDER BY
  v.vendor_name,
  pur.expected_delivery ASC;