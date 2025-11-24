USE car_dealership;

SELECT
    d.name AS dealership_name,
    COUNT(s.id) AS total_sales,
    COALESCE(SUM(s.sale_price), 0) AS revenue
FROM dealerships d
LEFT JOIN sales_contracts s
    ON d.dealership_id = s.dealership_id
GROUP BY d.dealership_id, d.name
ORDER BY revenue DESC;
