DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE car_dealership;

USE car_dealership;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,

    name          VARCHAR(50)  NOT NULL,

    address       VARCHAR(100) NOT NULL,

    phone         VARCHAR(20)

);

CREATE TABLE vehicles (
    vin           CHAR(17)     NOT NULL,

    make          VARCHAR(30)  NOT NULL,

    model         VARCHAR(30)  NOT NULL,

    year          INT          NOT NULL,


    color         VARCHAR(20),


    mileage       INT,


    price         DECIMAL(10,2),

    vehicle_type  VARCHAR(20),


    sold          TINYINT(1)   NOT NULL DEFAULT 0,


    PRIMARY KEY (vin)
);

CREATE TABLE inventory (
    dealership_id INT      NOT NULL,

    vin           CHAR(17) NOT NULL,


    PRIMARY KEY (dealership_id, vin),

    CONSTRAINT fk_inventory_dealer
        FOREIGN KEY (dealership_id)
        REFERENCES dealerships(dealership_id),

    CONSTRAINT fk_inventory_vehicle
        FOREIGN KEY (vin)
        REFERENCES vehicles(vin)
);
CREATE TABLE sales_contracts (
    id              INT AUTO_INCREMENT PRIMARY KEY,

    vin             CHAR(17)     NOT NULL,

    dealership_id   INT          NOT NULL,

    customer_name   VARCHAR(100) NOT NULL,

    customer_phone  VARCHAR(20),

    sale_date       DATE         NOT NULL,

    sale_price      DECIMAL(10,2) NOT NULL,

    is_financed     TINYINT(1)   NOT NULL DEFAULT 0,

    down_payment    DECIMAL(10,2) DEFAULT 0,

    monthly_payment DECIMAL(10,2) DEFAULT 0,

    term_months     INT DEFAULT 0,

    CONSTRAINT fk_sales_vehicle
        FOREIGN KEY (vin)
        REFERENCES vehicles(vin),


    CONSTRAINT fk_sales_dealer
        FOREIGN KEY (dealership_id)
        REFERENCES dealerships(dealership_id)

);

CREATE TABLE lease_contracts (
    id                  INT AUTO_INCREMENT PRIMARY KEY,

    vin                 CHAR(17)     NOT NULL,

    dealership_id       INT          NOT NULL,

    customer_name       VARCHAR(100) NOT NULL,
    customer_phone      VARCHAR(20),

    lease_start_date    DATE         NOT NULL,

    lease_end_date      DATE         NOT NULL,

    monthly_payment     DECIMAL(10,2) NOT NULL,

    allowed_miles       INT,

    overage_fee_per_mile DECIMAL(6,2),

    CONSTRAINT fk_lease_vehicle
        FOREIGN KEY (vin)
        REFERENCES vehicles(vin),

    CONSTRAINT fk_lease_dealer
        FOREIGN KEY (dealership_id)
        REFERENCES dealerships(dealership_id)
);



INSERT INTO dealerships (name, address, phone) VALUES
('Tampa Auto Plaza',     '123 Main St, Tampa, FL',      '813-555-0001'),
('Sunshine Motors',      '500 Gulf Blvd, Clearwater',   '727-555-0002'),
('Orlando Family Autos', '42 Magic Way, Orlando, FL',   '407-555-0003');

INSERT INTO vehicles (vin, make, model, year, color, mileage, price, vehicle_type, sold) VALUES
('1HGBH41JXMN109186', 'Toyota', 'Corolla', 2022, 'White',  10500, 21000.00, 'Sedan', 0),
('2FTRX18W1XCA12345', 'Ford',   'F-150',   2020, 'Blue',   32000, 34000.00, 'Truck', 1),
('3N1AB7AP2EY123456', 'Nissan', 'Sentra',  2019, 'Red',    45000, 15000.00, 'Sedan', 0),
('4T1BF1FK5HU765432', 'Toyota', 'Camry',   2021, 'Black',  22000, 26000.00, 'Sedan', 0),
('1HGCM82633A004352', 'Honda',  'Civic',   2018, 'Gray',   60000, 14000.00, 'Sedan', 1);

INSERT INTO inventory (dealership_id, vin) VALUES
(1, '1HGBH41JXMN109186'),
(1, '3N1AB7AP2EY123456'),
(2, '2FTRX18W1XCA12345'),
(2, '4T1BF1FK5HU765432'),
(3, '1HGCM82633A004352');

INSERT INTO sales_contracts
    (vin, dealership_id, customer_name, customer_phone,
     sale_date, sale_price, is_financed, down_payment, monthly_payment, term_months)
VALUES
('2FTRX18W1XCA12345', 2, 'John Smith',  '813-555-1010',
 '2025-11-01', 33500.00, 1, 5000.00, 450.00, 72),
('1HGCM82633A004352', 3, 'Molly Brown','813-555-2020',
 '2025-10-15', 13500.00, 0, 13500.00, 0.00, 0);

INSERT INTO lease_contracts
    (vin, dealership_id, customer_name, customer_phone,
     lease_start_date, lease_end_date, monthly_payment,
     allowed_miles, overage_fee_per_mile)
VALUES
('1HGBH41JXMN109186', 1, 'Eldar Abdivaitov', '813-555-3030',
 '2025-09-01', '2028-09-01', 299.99, 12000, 0.25);
