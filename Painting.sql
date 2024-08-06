SELECT * FROM artist;
SELECT * FROM canvas_size;
SELECT * FROM image_link;
SELECT * FROM museum_hours;
SELECT * FROM museum;
SELECT * FROM product_size;
SELECT * FROM subject;
SELECT * FROM work;

--1.Fetch all the paintings which are not displayed on any museums?
SELECT *
FROM work
WHERE museum_id is NULL;

--2.How many paintings have an asking price is less than regular price? 
SELECT COUNT(*) AS total
FROM product_size
WHERE sale_price > regular_price;

--3.Which canva size costs the most?
SELECT ps.size_id,
	cs.label,
	ps.sale_price
FROM canvas_size AS cs
JOIN product_size AS ps
ON cs.size_id::text = ps.size_id
ORDER BY ps.sale_price DESC
LIMIT 1;

--4.Fetch the top 10 most famous painting subject
SELECT s.subject,COUNT(s.work_id) AS total_paintings
FROM work AS w
JOIN subject AS s
ON w.work_id = s.work_id
GROUP BY s.subject
ORDER BY total_paintings DESC
LIMIT 10;

--5.Identify the museums which are open on both Sunday and Monday. Display museum name, city.
SELECT m.name AS museum_name,m.city
FROM museum_hours AS mh1
JOIN museum_hours AS mh2
ON mh1.museum_id = mh2.museum_id
JOIN museum AS m 
ON m.museum_id = mh1.museum_id
WHERE mh1.day = 'Sunday' AND mh2.day ='Monday';

--6.How many museums are open every single day?
SELECT COUNT(*)
FROM(
	select museum_id,count(distinct day)
	from museum_hours
	group by museum_id
	having count(distinct day) = 7)

--7.Which museum is open for the longest during a day. Dispay museum name, state 
--and hours open and which day?
SELECT m.name AS museum_name,
	m.state,
	mh.day,
	to_timestamp(open,'HH:MI AM') as open_time,
	to_timestamp(close,'HH:MI PM') AS close_time,
	to_timestamp(close,'HH:MI PM')  - to_timestamp(open,'HH:MI AM') AS duration
FROM museum_hours AS mh
JOIN museum AS m
ON m.museum_id = mh.museum_id
ORDER BY duration DESC
LIMIT 1;

--8.Display the country and the city with most no of museums. Output 2 seperate 
--columns to mention the city and country. If there are multiple value, seperate them 
--with comma.
WITH cte_country AS (
SELECT country,COUNT(country) 
FROM museum
GROUP BY country
ORDER BY COUNT(country) DESC
LIMIT 1),
cte_city AS (
SELECT city,COUNT(city),
RANK() OVER(ORDER BY COUNT(city) DESC) AS city_rank 
FROM museum
GROUP BY city
ORDER BY city_rank)

SELECT  string_agg(DISTINCT cte_country.country,','),
	string_agg(cte_city.city,',') AS city
FROM cte_country
CROSS JOIN cte_city
WHERE cte_city.city_rank = 1;




