-- queries.sql

--1. Do some rudimentary data cleaning by modifying values in a column or columns (such as change '' to NULL, cast types, etc.) 
--instead of adding the results of the query or queries to report.md, write the motivation for modifying / cleaning your data in this way
update s_incident set latitude=round(latitude,2),longitude=round(longitude,2);

alter table s_incident add column year INTEGER;
update s_incident set year=cast(substr(occur_date,-4,4) as INT);


--2. the total number of rows in the database
select count(*) from s_incident;

--3. show the first 15 rows, but only display 3 columns (your choice)
select incident_key,year,precinct from s_incident limit 15;

--4. do the same as above, but choose a column to sort on, and sort in descending order
select incident_key,year,precinct from s_incident where incident_key<=10038627 order by precinct;

--5. add a new column without a default value
--both_perp_vic: is the column where both the perp_sex and vic_sex is not empty value ("both exist" if both exist, "perp don't exist" if perpetrator's sex not defined)
alter table s_incident add column both_perp_vic TEXT;

--6. set the value of that new column
update s_incident set both_perp_vic="both exist" where NOT vic_sex="" AND NOT perp_sex ="";
update s_incident set both_perp_vic="perp don't exist" where NOT vic_sex="" AND perp_sex ="";

--7. show only the unique (non duplicates) of a column of your choice
select distinct(both_perp_vic) from s_incident ;

--8. group rows together by a column value (your choice) and 
--use an aggregate function to calculate something about that group 
--(count of all members of the group, the average of a column of the members of the group)
--. show the column that is used for grouping AND the result of the aggregate function 
--(so, 2 columns minimum on output)
select both_perp_vic ,count(*),avg(latitude),avg(longitude) from s_incident group by both_perp_vic;

--9. now, using the other grouping (chose boro)
--find a way to filter the query results based on the values for the groups (having more than 150 incidents in the year of 2016)
--(for example, show all genres that have more than 2 movies in it and only show the genre and the number of movies for that genre).
-- you'll use a HAVING clause to do this (covered in the slides on group by)
select boro, count() as occur_2016 from s_incident where year=2016 group by boro;
select boro, count() as occur_2016 from s_incident where year=2016 group by boro having occur_2016>150;

--From numbers 10-12 are the 3 queries of my own
--10. View the number of incidents of shooting in nyc and year grouped by year. 
select year,count() from s_incident group by year;

--11. Show all kinds of boro and the the number of incidents happened in that borough
select boro,count() from s_incident group by boro;

--12. Show the number of incidents and its percentage grouped by victim's sex
select vic_sex,count(),((count()*1.00)/17031)*100 as percentage from s_incident group by vic_sex;
