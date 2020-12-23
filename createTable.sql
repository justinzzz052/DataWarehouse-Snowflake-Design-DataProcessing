drop table DimDate;
drop table DimPlatform;
drop table DimSite;
drop table DimVideo;
drop table VideoPlay;

--DimSite
create table DimSite(
    DimSite_name varchar(255),
    DimSite_id int,
    primary key (DimSite_id));

--DimVideo
CREATE TABLE DimVideo(
Video_title varchar(255),
DimVideo_id int AUTOINCREMENT,
PRIMARY KEY (DimVideo_id));

--DimDate
CREATE TABLE DimDate(
fulldate datetime not null,
Date date not null,
StartTime time not null,
YEAR int not null,
quarter int,
MONTH int,
DAY int,
Weekday varchar(20),
HOUR int,
minute int not null,
PRIMARY KEY (fulldate));

--DimPlatform
CREATE TABLE DimPlatform(
Platform_Name varchar(255) NOT NULL,
DimPlatform_id int NOT NULL AUTOINCREMENT,
PRIMARY KEY (DimPlatform_id));


--VideoPlay  fact table
CREATE TABLE VideoPlay(
FULLDATE datetime not null,
DimPlatform_id int NOT NULL,
DimSite_id int NOT NULL,
DimVideo_id int NOT NULL,
events varchar(255));


--Test sql

Select  distinct a1.FULLDATE,
                 YEAR,
                 QUARTER,
                 DimSite_name,
                 PLATFORM_NAME,
                 VIDEO_TITLE,
                 events
From 
    VIDEOPLAY a1   //fact table -->VIDEOPLAY
join DIMSITE a2
    on a2.DIMSITE_ID = a1.DIMSITE_ID // dimension table ---> DIMSITE
join DIMPLATFORM a3
    on a3.DIMPLATFORM_ID = a1.DIMPLATFORM_ID // dimension table ---> DIMPLATFORM
join DIMVIDEO a4
    on a4.DIMVIDEO_ID = a1.DIMVIDEO_ID // dimension table ---> DIMVIDEO
join DIMDATE a5
    on a5.FULLDATE = a1.FULLDATE  // dimension table ---> DIMDATE
    