import csv
import random
from datetime import date

# Create input folder if not exists
import os
os.makedirs('input', exist_ok=True)

with open('input/sales_data.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    # Header
    writer.writerow(['id','customer','city','product','amount','order_date'])
    # Generate 2000 rows
    for i in range(1,2001):
        writer.writerow([
            i,
            random.choice(['Kaviya','Priya','Arjun','Riya','Nisha','Rahul']),
            random.choice(['Erode','Chennai','Madurai','Trichy']),
            random.choice(['Printer','Laptop','Mobile','Tablet','Headset','Mouse']),
            random.randint(1000,50000),
            date(2024, random.randint(1,12), random.randint(1,28))
        ])
