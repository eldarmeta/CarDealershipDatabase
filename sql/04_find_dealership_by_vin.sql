
USE car_dealership;

SELECT
    d.dealership_id,
    d.name,
    d.address,
    d.phone
FROM dealerships d
JOIN inventory i
    ON d.dealership_id = i.dealership_id
WHERE i.vin = '1HGBH41JXMN109186';  -- ← VIN машины
