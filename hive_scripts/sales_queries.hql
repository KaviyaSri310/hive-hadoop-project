SET mapreduce.framework.name=local;
SET hive.exec.mode.local.auto=true;
SET hive.execution.engine=mr;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
  id INT,
  customer STRING,
  city STRING,
  product STRING,
  amount FLOAT,
  order_date STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");

LOAD DATA INPATH '/user/kaviya/sales/sales_data.csv'
INTO TABLE sales;

-- PRODUCT SALES
INSERT OVERWRITE LOCAL DIRECTORY '/home/kaviya/hive_project/outputs/product_sales'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT product, SUM(amount)
FROM sales
GROUP BY product;

-- CITY SALES
INSERT OVERWRITE LOCAL DIRECTORY '/home/kaviya/hive_project/outputs/city_sales'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT city, SUM(amount)
FROM sales
GROUP BY city;

-- TOP CUSTOMERS
INSERT OVERWRITE LOCAL DIRECTORY '/home/kaviya/hive_project/outputs/top_customers'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT customer, SUM(amount)
FROM sales
GROUP BY customer;
