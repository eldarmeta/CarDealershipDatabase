
USE car_dealership;

SELECT DISTINCT
    d.dealership_id,
    d.name,
    d.address,
    d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v  ON v.vin = i.vin
WHERE v.make  = 'Toyota'
  AND v.model = 'Camry'
  AND v.color = 'Black';
