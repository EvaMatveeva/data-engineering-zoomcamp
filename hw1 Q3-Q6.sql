------------------------------------------------------------------------------------------------------------------------------
-- Question 3. Count records
------------------------------------------------------------------------------------------------------------------------------
--How many taxi trips were totally made on January 15?
--Tip: started and finished on 2019-01-15.
--Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp (date and hour+min+sec) and not in date.

select count(*)
from green_tripdata
where lpep_pickup_datetime::date = '2019-01-15';
--20689

------------------------------------------------------------------------------------------------------------------------------
-- Question 4. Largest trip for each day
------------------------------------------------------------------------------------------------------------------------------
--Which was the day with the largest trip distance Use the pick up time for your calculations.

select lpep_pickup_datetime::date as pickup_dt, max(trip_distance)
from green_tripdata
group by 1
order by max(trip_distance) desc
limit 3;

--2019-01-15

------------------------------------------------------------------------------------------------------------------------------
-- Question 5. The number of passengers
------------------------------------------------------------------------------------------------------------------------------
--In 2019-01-01 how many trips had 2 and 3 passengers?

select passenger_count, count(*)
from green_tripdata
where lpep_pickup_datetime::date = '2019-01-01'
	and passenger_count in (2, 3)
group by passenger_count;

--2: 1282 ; 3: 254

------------------------------------------------------------------------------------------------------------------------------
-- Question 6. Largest tip
------------------------------------------------------------------------------------------------------------------------------
-- For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip?
-- We want the name of the zone, not the id.
-- Note: it's not a typo, it's tip , not trip

select * from taxi_zone_lookup;
select dz."Zone", max(d.tip_amount) as total_tip_amount
from green_tripdata d
join taxi_zone_lookup pz
	on d."PULocationID" = pz."LocationID"
join taxi_zone_lookup dz
	on d."DOLocationID" = dz."LocationID"
where pz."Zone" = 'Astoria'
group by 1
order by max(d.tip_amount) desc;

-- Long Island City/Queens Plaza
