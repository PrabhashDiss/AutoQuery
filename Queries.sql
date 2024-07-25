-- Retrieve all customers
SELECT * FROM Customers;

-- Retrieve all car VINS
SELECT * FROM Car_Vins;

-- Retrieve all car options
SELECT * FROM Car_Options;

-- Retrieve all car parts
SELECT * FROM Car_Parts;

-- Retrieve all brands
SELECT * FROM Brands;

-- Retrieve all car models
SELECT * FROM Models;

-- Retrieve all customer ownership records
SELECT * FROM Customer_Ownership;

-- Retrieve all manufacture plants
SELECT * FROM Manufacture_Plant;

-- Retrieve all dealers
SELECT * FROM Dealers;

-- Retrieve all dealer-brand associations
SELECT * FROM Dealer_Brand;

-- Find customers who have a household income greater than $100,000
SELECT * FROM Customers
WHERE household_income > 100000;

-- Get all cars manufactured after January 1, 2020
SELECT * FROM Car_Vins
WHERE manufactured_date > '2020-01-01';

-- List all options for a specific car model (e.g., model_id = 1)
SELECT * FROM Car_Options
WHERE model_id = 1;

-- Retrieve car parts that have been recalled
SELECT * FROM Car_Parts
WHERE part_recall = 1;

-- Get all models of a specific brand (e.g., brand_id = 2)
SELECT * FROM Models
WHERE brand_id = 2;

-- Find all cars purchased by a specific customer (e.g., customer_id = 3)
SELECT * FROM Car_Vins
JOIN Customer_Ownership ON Car_Vins.vin = Customer_Ownership.vin
WHERE Customer_Ownership.customer_id = 3;

-- Get all customers who purchased cars with a specific option (e.g., option_set_id = 5)
SELECT DISTINCT Customers.*
FROM Customers
JOIN Customer_Ownership ON Customers.customer_id = Customer_Ownership.customer_id
JOIN Car_Vins ON Customer_Ownership.vin = Car_Vins.vin
JOIN Car_Options ON Car_Vins.model_id = Car_Options.model_id
WHERE Car_Options.option_set_id = 5;

-- List all parts manufactured in a specific plant (e.g., plant_id = 1)
SELECT * FROM Car_Parts
WHERE manufacture_plant_id = 1;

-- Find all dealers that sell a specific brand (e.g., brand_id = 3)
SELECT Dealers.*
FROM Dealers
JOIN Dealer_Brand ON Dealers.dealer_id = Dealer_Brand.dealer_id
WHERE Dealer_Brand.brand_id = 3;

-- Get the total number of cars each customer owns
SELECT Customers.customer_id, Customers.first_name, Customers.last_name, COUNT(Customer_Ownership.vin) AS total_cars
FROM Customers
LEFT JOIN Customer_Ownership ON Customers.customer_id = Customer_Ownership.customer_id
GROUP BY Customers.customer_id;

-- List all car models and their associated brand names
SELECT Models.model_name, Brands.brand_name
FROM Models
JOIN Brands ON Models.brand_id = Brands.brand_id;

-- Get all car options along with their prices
SELECT Car_Options.color, Car_Options.option_set_price
FROM Car_Options;

-- Find all cars manufactured by a specific plant (e.g., plant_id = 2)
SELECT Car_Vins.*
FROM Car_Vins
JOIN Car_Parts ON Car_Vins.manufactured_plant_id = Car_Parts.manufacture_plant_id
WHERE Car_Parts.manufacture_plant_id = 2;
