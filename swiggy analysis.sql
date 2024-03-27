create schema swiggy;
use swiggy;
-- HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select count(distinct restaurant_name) as high_rated from swiggy where rating>4.5;
-- WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city,count(distinct restaurant_name) 
as res_count from swiggy 
group by city 
order by res_count desc
limit 1;

-- HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select distinct restaurant_name  
as pizza
from swiggy
where restaurant_name like '%Pizza%' ;
-- WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine,count(*) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1;
-- WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select city ,avg(rating) as average_rating from swiggy group by city;
-- WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name,menu_category,max(price) as highest_price from swiggy
where menu_category='Recommended' group by restaurant_name,menu_category;
-- FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
select distinct restaurant_name,cost_per_person 
from swiggy where cuisine<>'Indian'
order by cost_per_person desc
limit 5;
-- FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person 
from swiggy where cost_per_person>(select avg(cost_per_person)from swiggy);
-- RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select distinct t1.restaurant_name,t1.city,t2.city
from swiggy t1 join swiggy t2
on t1.restaurant_name=t2.restaurant_name and t1.city<>t2.city;
-- WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name,menu_category
,count(item) as no_of_items from swiggy
where menu_category='Main Course'
group by restaurant_name,menu_category
order by no_of_items desc limit 1;