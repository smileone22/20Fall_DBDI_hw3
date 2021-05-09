# Homework #03

## Overview
## About the Data

1. Name / Title: NYPD Shooting Incident Data (Historic)
2. Link to Data: https://data.cityofnewyork.us/Public-Safety/NYPD-Shooting-Incident-Data-Historic-/833y-fsy8/data 
3. Source / Origin: 
	* Author or Creator: Police Department (NYPD)
	* Publication Date: 11/1/2018
	* Publisher: NYC OpenData
	* Version or Data Accessed: Updated July 16, 2020
4. License: The license for this dataset is unspecified
5. Can You Use this Data Set for Your Intended Use Case? Yes. The CSV file should be opened using an appropriate tool for data exploration. For assignment. 

## Format

### Overview

Format: csv file 
Size: 3.9MB
Number of Records: 21626 Rows 19 Columns


### Sample of Data
INCIDENT_KEY    OCCUR_DATE  OCCUR_TIME  BORO    PRECINCT    JURISDICTION_CODE   LOCATION_DESC   STATISTICAL_MURDER_FLAG PERP_AGE_GROUP  PERP_SEX    PERP_RACE   VIC_AGE_GROUP   VIC_SEX VIC_RACE    X_COORD_CD  Y_COORD_CD  Latitude    Longitude   Lon_Lat
74146165    08/14/2010  3:11:00 QUEENS  113 0       FALSE               25-44   M   BLACK   1046573 183057  40.66891477200000   -73.77534099699990  POINT (-73.77534099699994 40.66891477200004)
66928846    10/17/2009  18:03:00    BROOKLYN    67  0       TRUE                45-64   M   BLACK   1003313 176413  40.65087729100000   -73.93130224700000  POINT (-73.93130224699998 40.65087729100002)
29114164    05/18/2007  23:00:00    BROOKLYN    75  0       FALSE               25-44   M   BLACK   1016292 176228  40.65033205800010   -73.88452947900000  POINT (-73.884529479 40.65033205800006)
85180336    06/09/2012  17:15:00    BROOKLYN    81  0       FALSE               25-44   M   BLACK   1005597 188673  40.68452304300010   -73.92303235700000  POINT (-73.92303235699995 40.68452304300007)
73405770    06/27/2010  4:14:00 BRONX   47  0       FALSE               25-44   M   BLACK   1023551 263366  40.88947350500010   -73.85786021700000  POINT (-73.85786021699995 40.88947350500007)
33397043    07/26/2007  23:05:00    QUEENS  110 0       FALSE               18-24   M   BLACK   1015948 210428  40.74420426600010   -73.88560822899990  POINT (-73.88560822899994 40.74420426600005)
185483181   07/21/2018  4:15:00 QUEENS  114 0       FALSE   25-44   M   BLACK   25-44   M   BLACK   1,003,963   214,344 40.75498753 -73.92884875    POINT (-73.92884875 40.75498753)
137804320   07/20/2014  1:40:00 QUEENS  113 0       FALSE               18-24   M   BLACK   1049943 182958  40.668618676000000  -73.76319392400000  POINT (-73.76319392399995 40.668618676000044)
82323802    12/25/2011  3:50:00 QUEENS  113 0       FALSE               18-24   M   BLACK   1040038 185061  40.67445888000000   -73.79888153400000  POINT (-73.79888153399997 40.67445888000003)
74568517    09/11/2010  21:40:00    BRONX   43  0       FALSE               18-24   M   BLACK   1018791 240921  40.82788868500010   -73.87519150200000  POINT (-73.87519150199995 40.82788868500006)
84075119    04/05/2012  22:46:00    BRONX   40  0       FALSE               18-24   M   BLACK   1006853 233369  40.80719918600010   -73.91835350200000  POINT (-73.91835350199995 40.807199186000055)
92386262    08/30/2013  4:14:00 QUEENS  110 0       FALSE               18-24   M   BLACK   1026084 216284  40.76023534300000   -73.84899259200000  POINT (-73.84899259199995 40.76023534300003)

### Fields or Column Headers
* Field/Column 1: INCIDENT_KEY(int): Randomly generated persistent ID for each incident
* Field/Column 2: OCCUR_DATE(date): Exact date of the shooting incident
* Field/Column 3: OCCUR_TIME(text): Exact time of the shooting incident
* Field/Column 4: BORO(text) : Borough where the shooting incident occurred
* Field/Column 5: PRECINCT(int): Precinct where the shooting incident occurred
* Field/Column 6: JURISDICTION_CODE(int): 0(Patrol), 1(Transit) and 2(Housing) represent NYPD whilst codes 3 and more represent non NYPD jurisdictions
* Field/Column 7: LOCATION_DESC(text): Location of the shooting incident
* Field/Column 8: STATISTICAL_MURDER_FLAG(text): Shooting resulted in the victim’s death which would
be counted as a murder
* Field/Column 9: PERP_AGE_GROUP (text): Perpetrator’s age range
* Field/Column 10: PERP_SEX (text): Perpetrator’s sex description
* Field/Column 11: PERP_RACE (text): Perpetrator’s race description
* Field/Column 12: VIC_AGE_GROUP (text) : Victim’s age range
* Field/Column 13: VIC_SEX (text): Victim’s sex description
* Field/Column 14: VIC_RACE (text): Victim’s race description
* Field/Column 15: X_COORD_CD (int): Midblock X-coordinate for New York State Plane
Coordinate System, Long Island Zone, NAD 83, units
feet (FIPS 3104)
* Field/Column 16: Y_COORD_CD (int): Midblock Y-coordinate for New York State Plane
Coordinate System, Long Island Zone, NAD 83, units
feet (FIPS 3104)
* Field/Column 17: Latitude (real): Latitude coordinate for Global Coordinate System, WGS 1984, decimal degrees (EPSG 4326)
* Field/Column 18: Longitude (real): Longitude coordinate for Global Coordinate System,
WGS 1984, decimal degrees (EPSG 4326)
* Field/Column 19: Lon_Lat (text) : both latitude, longitude together on a poitn
           

## Table Design

According to the footnotes, a shooting incident could have multiple victims involved and as a result duplicate INCIDENT_KEY’s are produced. Each INCIDENT_KEY represents a victim but similar duplicate keys are counted as one incident. 

Thus, I wanted to get rid of rows that have the same incident keys and regard
the ones that have the same incident keys as 1. 

In order to do so, I first created temp and then used "insert or replace" only columns listed below from temp to table named s_incident. 

CREATE TABLE s_incident (
    incident_key INTEGER Primary Key, 
    occur_date DATE,
    occur_time TEXT,
    boro TEXT,
    precinct INTEGER,
    juri_code INTEGER,
    location_desc TEXT,
    muder_flag INTEGER,
    perp_sex TEXT,
    perp_race TEXT,
    vic_sex TEXT,
    vic_race TEXT,
    latitude real,
    longitude real
);

## Import

After ```.read create_table.sql```, following commands are what should be used.
```
.mode csv
```
```
.import /Users/heewon/Documents/Github/smileone22-homework03/data/raw/NYPD_Shooting_Incident_Data__Historic_noh.csv temp
```
```
INSERT or REPLACE into s_incident select incident_key, occur_date, occur_time, boro, precinct,juri_code,location_desc, murder_flag, perp_sex, perp_race, vic_sex, vic_race, latitude, longitude from temp;
```
Before dropping the table temp, I checked if the duplicated rows of the same incident_keys got dropped by ..checking the result 

```select count() from s_incident;``` equals ```select count(distinct incident_key) from temp;```

```
drop table temp; 
```
```
.save homework03_process.db
```

## Database Information

1. show all of the tables in your database (there should only be 1!)
sqlite> .open homework03_process.db
sqlite> .tables
s_incident

2. show information about the table's columns (names and types)
sqlite> .schema s_incident
CREATE TABLE s_incident (
    incident_key INTEGER Primary Key, 
    occur_date TEXT,
    occur_time TEXT,
    boro TEXT,
    precinct INTEGER,
    juri_code INTEGER,
    location_desc TEXT,
    murder_flag INTEGER,
    perp_sex TEXT,
    perp_race TEXT,
    vic_sex TEXT,
    vic_race TEXT,
    latitude real,
    longitude real
);

## Query Results
```.mode column```
```.headers on ```


### 1. Do some rudimentary data cleaning by modifying values in a column or columns (such as change '' to NULL, cast types, etc.)
```  
sqlite> update s_incident set latitude=round(latitude,2),longitude=round(longitude,2);
-- This was to reduce the .xxx because some longitude and latitude have long
values after decimal (better view)

sqlite>alter table s_incident add column year INTEGER;
sqlite>update s_incident set year=cast(substr(occur_date,-4,4) as INT);
-- Added year that the incident occured because even if order by occur_date, 
since occur_date starts from mm/dd, year could be put into another new column
as integer 
```

### 2. The total number of rows in the database
```
sqlite> select count(*) from s_incident;

count(*)  
----------
17031
```
### 3. show the first 15 rows, but only display 3 columns (your choice)
```

sqlite> select incident_key,year,precinct from s_incident limit 15;
incident_key  year        precinct  
------------  ----------  ----------
9953245       2006        48        
9953246       2006        44        
9953247       2006        67        
9953248       2006        106       
9953249       2006        90        
9953250       2006        114       
9953252       2006        28        
9953255       2006        70        
9953257       2006        120       
9953258       2006        106       
9953259       2006        73        
9953261       2006        109       
10038624      2006        105       
10038625      2006        73        
10038627      2006        79 
```
### 4. do the same as above, but choose a column to sort on, and sort in descending order
```
sqlite> select incident_key,year,precinct from s_incident where incident_key<=10038627 order by precinct;
incident_key  year        precinct  
------------  ----------  ----------
9953252       2006        28        
9953246       2006        44        
9953245       2006        48        
9953247       2006        67        
9953255       2006        70        
9953259       2006        73        
10038625      2006        73        
10038627      2006        79        
9953249       2006        90        
10038624      2006        105       
9953248       2006        106       
9953258       2006        106       
9953261       2006        109       
9953250       2006        114       
9953257       2006        120 
```

### 5. add a new column without a default value
```
--both_perp_vic: is the column where both the perp_sex and vic_sex is not empty value ("both exist" if both exist, "perp don't exist" if perpetrator's sex not defined)
sqlite> alter table s_incident add column both_perp_vic TEXT;
```

### 6. set the value of that new column
```
sqlite> update s_incident set both_perp_vic="both exist" where NOT vic_sex="" AND NOT perp_sex ="";
sqlite> update s_incident set both_perp_vic="perp don't exist" where NOT vic_sex="" AND perp_sex ="";

-- no printed result 
```
### 7. show only the unique (non duplicates) of a column of your choice
```
sqlite> select distinct(both_perp_vic) from s_incident ;
both_perp_vic
-------------
both exist   
perp don't ex
```
### 8. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group (count of all members of the group, the average of a column of the members of the group) show the column that is used for grouping AND the result of the aggregate function (so, 2 columns minimum on output)
```
sqlite> select both_perp_vic ,count(*),avg(latitude),avg(longitude) from s_incident group by both_perp_vic;
both_perp_vic  count(*)    avg(latitude)     avg(longitude)   
-------------  ----------  ----------------  -----------------
both exist     10692       40.7360736999629  -73.9108352038908
perp don't ex  6339        40.7307382867965  -73.906832307935 
```

### 9. now, using the same grouping query or creating another one(I chose another grouping boro), find a way to filter the query results based on the values for the groups 
-- you'll use a HAVING clause to do this (covered in the slides on group by)

```
sqlite> select boro, count() as occur_2016 from s_incident where year=2016 group by boro;
boro        occur_2016
----------  ----------
BRONX       247       
BROOKLYN    415       
MANHATTAN   142       
QUEENS      157       
STATEN ISL  36  

sqlite>  select boro, count() as occur_2016 from s_incident where year=2016 group by boro having occur_2016>150;
boro        occur_2016
----------  ----------
BRONX       247       
BROOKLYN    415       
QUEENS      157 
```

### From here, #10-12 are 3 queries of my own

### 10. View the number of incidents of shooting in nyc and year grouped by year. 
```
sqlite> select year,count() from s_incident group by year;
year        count()   
----------  ----------
2006        1566      
2007        1442      
2008        1519      
2009        1420      
2010        1473      
2011        1509      
2012        1373      
2013        1103      
2014        1172      
2015        1138      
2016        997       
2017        789       
2018        754       
2019        776
```
### 11.Show all boro and the number of incidents happened in that borough
```
sqlite> select boro,count() from s_incident group by boro;
boro        count()   
----------  ----------
BRONX       4712      
BROOKLYN    7186      
MANHATTAN   2063      
QUEENS      2557      
STATEN ISL  513 
```

### 12.Show the number of incidents and its percentage grouped by victim's sex

```
sqlite> select vic_sex,count(),((count()*1.00)/17031)*100 as percentage from s_incident group by vic_sex;
vic_sex     count()     percentage      
----------  ----------  ----------------
F           1272        7.46873348599612
M           15751       92.4842933474253
U           8           0.04697316657859
```