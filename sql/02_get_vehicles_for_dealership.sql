
USE car_dealership;

SELECT
    v.vin,
    v.make,
    v.model,
    v.year,
    v.color,
    v.price,
    v.vehicle_type,
    v.sold
FROM vehicles v
JOIN inventory i
    ON v.vin = i.vin
WHERE i.dealership_id = 1;
