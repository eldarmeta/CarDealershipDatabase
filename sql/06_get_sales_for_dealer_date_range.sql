USE car_dealership;

SELECT
    s.id AS contract_id,
    s.sale_date,
    v.vin,
    v.make,
    v.model,
    v.year,
    s.sale_price,
    s.customer_name,
    s.is_financed
FROM sales_contracts s
JOIN vehicles v
    ON s.vin = v.vin
WHERE s.dealership_id = 2
  AND s.sale_date BETWEEN '2025-10-01' AND '2025-11-30';
