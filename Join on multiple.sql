-- 1 Write a query to display for each store its store ID, city, and country.
select * from  store;		-- store_id, address_id
select * from address;	-- address_id, city_id
select * from city;		-- city_id, city, country_id
select * from country;	-- country_id,

select s.store_id as store, a.city_id as city, c.country_id as country
from store s 
join address a on a.address_id= s.address_id
join city c on c.city_id= a.city_id
join country co on co.country_id=c.country_id
group by s.store_id;

-- 2 Write a query to display how much business, in dollars, each store brought in.
select * from store;		-- store_id
select * from staff;		-- store_id, staff_id
select * from payment;	-- staff_id, amount
select s.store_id,sum(p.amount)
from store s
join staff st on st.store_id= s.store_id
join payment p on p.staff_id=st.staff_id
group by s.store_id;

-- 3 What is the average running time of films by category?
select * from sakila.category;			-- category_id, name
select * from sakila.film_category;		-- film_id, category_id
select * from sakila.film;				-- film_id, length
select c.name as category, avg(f.length) as average_running_time
from category c 
join film_category fc using (category_id)
join film f using(film_id)
group by c.name
order by c.name;

-- 4 Which film categories are longest?
select c.name as category, avg(f.length) as average_running_time
from category c 
join film_category fc using (category_id)
join film f using(film_id)
group by c.name 
order by average_running_time desc; 
#Sports are the longest.


-- 5 Display the most frequently rented movies in descending order.
select * from film;		-- title, film_id
select * from inventory;	-- film_id, inventory_id
select * from rental; 	-- inventory_ id, rental_id, 
select f.title as film_name,count(rental_id) as most_frequently_rented_movies
from film f 
join inventory i using(film_id)
join rental r using(inventory_id)
group by f.title
order by most_frequently_rented_movies desc;
# bucket brotherhood the most watched

-- 6 List the top five genres in gross revenue in descending order.
select * from category; -- name,category_id
select * from film_category; -- category_id, film_id
select * from inventory; 		-- film_id, inventory_id
select * from rental; 		-- inventory_id, customer_id
select * from payment;  -- customer_id, amount

select c.name as category, sum(amount) as gross_revenue
from category c 
join film_category using(category_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(customer_id)
group by c.name
order by gross_revenue DESC
limit 5; 


-- 7 Is "Academy Dinosaur" available for rent from Store 1?
select * from film;			-- title, film_id
select * from inventory;		-- film_id, inventory_id
select title, sum(i.store_id) 
from film f
join inventory i using(film_id)
where title = "Academy Dinosaur" and i.store_id = 1; 






