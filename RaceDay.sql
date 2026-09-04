--creating a database--
create  database RaceDay;

--using a database
use [RaceDay];

--creating table Roles.
create table Roles(
RoleID int primary key identity(1,1),
RoleName varchar(100) not null,
constraint uQ_Role_RoleName unique(RoleName)
);

--viewing inside role table
select * from [Roles];

--creating table users.
create table Users(
UserID int primary key identity(1,1) not null ,
RoleID int not null,
firstName varchar(100) not null,
lastName varchar(100) not null,
Email varchar(100) not null,
passwordHash varchar(100) not null,
phone varchar(20) not null,
createdat DateTime not null constraint Df_users_createdat default SYSDATETIME(),
constraint uq_users_email unique(Email),
foreign key(RoleID) references Roles(RoleID)
);

--viewing inside table users
select * from [Users];

--create table Events.
create table Events(
EventID int primary key identity(1,1) not null,
OrganiserID int not null,
eventName varchar(100) not null,
eventDescription varchar(100)not null,
eventDate date not null,
eventLocation varchar(100) not null,
eventStatus varchar(50) not null CONSTRAINT df_events_eventStatus default 'open',
createdAt DATETIME2 NOT NULL
CONSTRAINT df_events_createdAt DEFAULT SYSDATETIME(),
foreign key(OrganiserID) REFERENCES Users(UserID ),
CONSTRAINT ck_Events_eventStatus
check(eventStatus in ('open','closed','cancelled','completed')),
CONSTRAINT ck_Events_eventDate
check (eventDate >= '2026-10-05')
);

--viewing table events
select * from [Events];

--creating table categories.
create table categories(
categoryID int primary key identity(1,1) not null,
EventID int not null,
categoryName varchar(100) not null,
MaxParticipants int not null,
entryFee decimal(10,2) not null constraint df_categories_entryFee default 0.00,
foreign key(EventID) references Events(EventID),
constraint uq_categories_event_Category unique (EventID,categoryID),
constraint ck_categories_MaxParticipants check(MaxParticipants >= 10),
constraint ck_categories_entryFee check(entryFee >=50)
);

--viewing table categories
select * from [categories];

--creating table Event Enrolment.
create table EventEnrolment(
enrolmentID int primary key identity(1,1) not null,
EventID int not null ,
partcipantsID int not null,
categoryID int not null,
enrolmentDate DATETIME2 not null constraint df_EventEnrolment_enrolmentDate default SYSDATETIME(),
status varchar(20) not null constraint df_EventEnrolment default 'Active',
foreign key (EventID) references Events(EventID),
foreign key(partcipantsID) references Users(UserID),
foreign key(categoryID) references categories(categoryID),
constraint UQ_EventEnrolment_participants_event unique (partcipantsID, EventID ),
constraint ck_EventEnrolment_status check (status in('Active','Cancelled','Completed'))
);

--viewing table eventenrolment
select * from [EventEnrolment];

--creating table results.
create table Results(
ResultID int primary key identity(1,1) not null,
enrolmentID int not null,
position int not null,
finishTime Time null,
score decimal(10,2) null,
RecordedAt DATETIME2 not null constraint df_Results_RecordedAt default SYSDATETIME(),
foreign key(enrolmentID) references EventEnrolment(enrolmentID),
constraint UQ_Results_enrolments unique (enrolmentID),
constraint ck_Results_Position check (Position > 0),
constraint ck_Results_Score check (score is null or score >=0)
);

--viewing table results
select * from [Results];

--INSETING VALUES IN ROLES.
INSERT INTO Roles (RoleName) VALUES 
('Organiser'),
('Participant');

--viewing table roles
select * from [Roles];

--INSERTING VALUES IN USERS.
INSERT INTO Users ( RoleID, FirstName, LastName, Email, PasswordHash, Phone ) VALUES
( 1, 'Thabo', 'Mokoena', 'thabo@raceday.co.za', 'HASHED_PASSWORD_001', '0711111111' ), 
( 1, 'Lerato', 'Ndlovu', 'lerato@raceday.co.za', 'HASHED_PASSWORD_002', '0722222222' ),
( 2, 'Trevor', 'Nemutanzhela', 'trevor@raceday.com', 'HASHED_PASSWORD_003', '0733333333' ),
( 2, 'Sipho', 'Dlamini', 'sipho@raceday.com', 'HASHED_PASSWORD_004', '0744444444' );

--viewing table users
select * from [Users];

--INSERTING VALUES INTO EVENTS.
INSERT INTO Events ( OrganiserID, eventName, eventDescription, eventDate, eventLocation, eventStatus ) VALUES
( 1, 'Johannesburg City Marathon', 'Annual marathon event for professional and recreational runners.', '2026-10-18', 'Johannesburg, Gauteng', 'Open' ),
( 1, 'Limpopo Trail Challenge', 'Outdoor trail running competition through scenic Limpopo routes.', '2026-11-07', 'Polokwane, Limpopo', 'Open' ), 
( 2, 'Pretoria Fun Run', 'Community-focused running event suitable for participants of different ages.', '2026-12-05', 'Pretoria, Gauteng', 'Open' );

select * from [Events];

--inserting values into categories
INSERT INTO Categories ( EventID, categoryName, MaxParticipants, entryFee ) VALUES 
-- Johannesburg City Marathon 
(1, '42.2 KM Marathon', 1000, 350.00), 
(1, '21.1 KM Half Marathon', 1500, 250.00),
(1, '10 KM Run', 2000, 150.00),

-- Limpopo Trail Challenge
(2, '30 KM Trail', 500, 300.00), 
(2, '15 KM Trail', 800, 200.00),
(2, '5 KM Trail', 1000, 100.00),
-- Pretoria Fun Run 
(3, '10 KM Fun Run', 1000, 120.00),
(3, '5 KM Fun Run', 1500, 80.00);

select * from [categories];

--inserting values into eventenrolment
INSERT INTO EventEnrolment ( EventID, partcipantsID, CategoryID, Status ) VALUES 
(1, 3, 1, 'Active'),
(1, 4, 2, 'Active'), 
(2, 3, 4, 'Active'), 
(3, 4, 7, 'Active');

select * from [EventEnrolment];

-- inserting values into results
INSERT INTO Results ( EnrolmentID, Position, FinishTime, Score ) VALUES 
(1, 1, '03:12:45', 100.00),
(2, 2, '01:48:32', 90.00); 

select * from [Results];

--Displays participants, events and categories.
SELECT ee.enrolmentID, u.FirstName + ' ' + u.LastName AS Participant, e.EventName,
c.CategoryName, ee.EnrolmentDate, ee.Status 
FROM EventEnrolment ee INNER JOIN Users u
ON ee.partcipantsID = u.UserID INNER JOIN Events e 
ON ee.EventID = e.EventID INNER JOIN Categories c 
ON ee.CategoryID = c.CategoryID ORDER BY e.EventName, Participant;

--Displays race results with participant and event details.
SELECT r.ResultID, u.FirstName + ' ' + u.LastName AS Participant,
e.EventName, c.CategoryName, r.Position, r.FinishTime, r.Score 
FROM Results r INNER JOIN EventEnrolment ee 
ON r.EnrolmentID = ee.EnrolmentID INNER JOIN Users u 
ON ee.partcipantsID = u.UserID INNER JOIN Events e 
ON ee.EventID = e.EventID INNER JOIN Categories c 
ON ee.CategoryID = c.CategoryID ORDER BY e.EventName, r.Position;


