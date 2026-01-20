#!/bin/bash

echo "Hadoop already running..."

echo "Preparing HDFS..."
hdfs dfs -rm -r /user/kaviya/sales 2>/dev/null
hdfs dfs -mkdir -p /user/kaviya/sales
hdfs dfs -put -f input/sales_data.csv /user/kaviya/sales/

echo "Running Hive in LOCAL MODE..."

hive -f hive_scripts/sales_queries.hql || exit 1

echo "PROJECT COMPLETED SUCCESSFULLY!"
