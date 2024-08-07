# Painting and Museum Analysis
## Overview
This is a project for learning and practicing advanced SQL concepts such as CTE, Sub-Query, and Window-Function through exploring a dataset of famous paintings in several tables to unravel the relationship of the data and answer our problem statements.
## Tools
- PostGreSQL 16
- pgAdmin 4
- Jupyter Notebook
## Dataset
The dataset that I used in this project is from Kaggle: Famous Paintings
https://www.kaggle.com/datasets/mexwell/famous-paintings
## ER Diagram 
Made by pgAdmin 4
![ER Diagram](https://github.com/user-attachments/assets/4f100a45-c0a6-4574-a623-82f0131a66b3)
## Problem Statement
1. Fetch all the paintings which are not displayed on any museums.
2. How many paintings have an asking price is less than regular price? 
3. Which canva size costs the most?
4. Fetch the top 10 most famous painting subject
5. Identify the museums which are open on both Sunday and Monday. Display museum name, city.
6. How many museums are open every single day?
7. Which museum is open for the longest during a day.Dispay museum name, state and hours open and which day?
8. Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma.
## Steps in project
### 1. Setting up database
- Use pgAdmin 4 to connect to our Postgre database server.
- Create new Database for this project.
### 2. Import data from csv file by using Jupyter Notebook
- Use sqlalchemy library in Python for connect to our database.
- Create a loop to generate DataFrames and add them to our database.
### 3.Exploratory Data Analysis
- Use Postgre SQL to answer our problem statement.
## Finding
1. There are 330669 paintings that are not displayed in any museums.
2. There's no painting that has a lower asking price than the regular price.
3. The canvas size with the highest cost is '48' x '96' (122 cm x 244 cm) at $1115.
4. The top 10 most famous painting subject are
   - 1.Portraits
   - 2.Abstract/Modern Art
   - 3.Nude
   - 4.Landscape Art
   - 5.Rivers/Lakes
   - 6.Flowers
   - 7.Still-Life
   - 8.Seascapes
   - 9.Marine Art/Maritime
   - 10.Horses
5. There are 28 museums that are open on both Sunday and Monday (the museum name and city can be viewed by executing SQL).
6. There are 17 museums that open every single day.
7. On Friday, the Musée du Louvre in Paris is open for 12 hours and 45 minutes, making it the longest open during the day.
8. The country with the most museums is the USA, while the cities with the most museums are Washington, New York, Paris, and London.
