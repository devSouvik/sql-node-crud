create database application_test
use application_test

-- password: Onlinejob@98
-- username: sa

create table events(
	eventId int identity(1,1) primary Key clustered not null,
	eventTitle nvarchar(100) not null,
	eventDescription nvarchar(1500) not null,
	startDate date not null,
	endDate  date not null,
	avenue nvarchar(200) not null,
	maxMembers int not null
)

select * from events
-- drop table events

insert into events values
(N'first event', N'some event description here and further', 
'2020-11-04', '2020-11-08', N'1600 Ampitheatre parkway in mountain view, US', 1000);

insert into events values
(N'Second event', N'Description for 2nd event',
'2020-11-10', '2020-11-18', N'1600 Ampitheatre parkway in mountain view, US', 1000 );

-- view events proc
create proc spFetchEvents 
as
begin
	select * from events
end

exec spFetchEvents 

--insert event proc
create procedure spInsertEvent 
(
	 @eventTitle nvarchar(100) ,
	 @eventDescription nvarchar(1500),
	 @startDate date ,
	 @endDate  date ,
	 @avenue nvarchar(200) ,
	 @maxMembers int 
)
as
begin
	insert into events values
	(@eventTitle, @eventDescription, @startDate, @endDate,@avenue, @maxMembers);
end 


-- drop proc spInsertEvent

-- update event proc
create proc spUpdateEvent 
(	 
	 @eventId int,
	 @eventTitle nvarchar(100) ,
	 @eventDescription nvarchar(1500),
	 @startDate date ,
	 @endDate  date ,
	 @avenue nvarchar(200) ,
	 @maxMembers int 
)
as
begin 
	update events set [eventTitle] = @eventTitle, [eventDescription] = @eventDescription, [startDate] = @startDate,
	[endDate] = @endDate, [avenue] = @avenue, [maxMembers]=@maxMembers
	WHERE [eventId]=@eventId

SELECT [eventId]
      ,[eventTitle]
      ,[eventDescription]
      ,[startDate]
      ,[endDate]
      ,[avenue]
      ,[maxMembers]
  FROM [dbo].[events]
  WHERE [eventId]=@eventId
end

exec spUpdateEvent 4, N'Fourth event', N'Description for 4th event',
'2020-11-21', '2020-11-22', N'1600 Ampitheatre parkway in mountain view, US', 1500

-- delete event proc
create procedure spDeleteEvent
@eventId int
as
begin
	DELETE [dbo].[events]
	WHERE [eventId]=@eventId
end

EXECUTE spDeleteEvent 5

