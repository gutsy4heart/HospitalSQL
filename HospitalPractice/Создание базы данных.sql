use [master];
go

if db_id('Hospital') is not null
begin
	drop database [Hospital];
end
go

create database [Hospital];
go

use [Hospital];
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go
INSERT INTO [Departments] ([Building], [Name])
VALUES 
    (1, 'Cardiology'),
    (2, 'Neurology'),
    (3, 'Orthopedics'),
    (4, 'Pediatrics'),
    (5, 'Dermatology');


create table [Doctors]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Premium] money not null check ([Premium] >= 0.0) default 0.0,
	[Salary] money not null check ([Salary] > 0.0),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

INSERT INTO [Doctors] ([Name], [Premium], [Salary], [Surname])
VALUES 
    ('John', 2000.0, 50000.0, 'Doe'),
    ('Jane', 1500.0, 48000.0, 'Smith'),
    ('Emily', 1800.0, 52000.0, 'Johnson'),
    ('William', 2200.0, 60000.0, 'Brown'),
    ('Linda', 1700.0, 55000.0, 'Williams');


create table [DoctorsExaminations]
(
	[Id] int not null identity(1, 1) primary key,
	[EndTime] time not null,
	[StartTime] time not null check ([StartTime] between '08:00' and '18:00'),
	[DoctorId] int not null,
	[ExaminationId] int not null,
	[WardId] int not null,
	check ([StartTime] < [EndTime])
);
go

INSERT INTO [DoctorsExaminations] ([EndTime], [StartTime], [DoctorId], [ExaminationId], [WardId])
VALUES 
    ('09:00', '08:30', 1, 1, 1),
    ('10:00', '09:30', 2, 2, 2),
    ('11:00', '10:30', 3, 3, 3),
    ('12:00', '11:30', 4, 4, 4),
    ('13:00', '12:30', 5, 5, 5);


create table [Examinations]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

INSERT INTO [Examinations] ([Name])
VALUES 
    ('Physical Examination'),
    ('MRI Scan'),
    ('X-ray'),
    ('Ultrasound'),
    ('Blood Test');


create table [Wards]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(20) not null unique check ([Name] <> N''),
	[Places] int not null check ([Places] >= 1),
	[DepartmentId] int not null
);
go

INSERT INTO [Wards] ([Name], [Places], [DepartmentId])
VALUES 
    ('B25', 10, 1),
    ('C75', 15, 2),
    ('S33', 12, 3),
    ('W66', 20, 4),
    ('A11', 8, 5);



alter table [DoctorsExaminations]
add foreign key ([DoctorId]) references [Doctors]([Id]);
go

alter table [DoctorsExaminations]
add foreign key ([ExaminationId]) references [Examinations]([Id]);
go

alter table [DoctorsExaminations]
add foreign key ([WardId]) references [Wards]([Id]);
go

alter table [Wards]
add foreign key ([DepartmentId]) references [Departments]([Id]);
go