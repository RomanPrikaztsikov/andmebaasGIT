CREATE TABLE TableA (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);
GO

INSERT INTO TableA (Id, Name, Gender) VALUES
    (1, 'Mark', 'Male'),
    (2, 'Mary', 'Female'),
    (3, 'Steve', 'Male'),
    (4, 'John', 'Male'),
    (5, 'Sara', 'Female');
GO

CREATE TABLE TableB (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);
GO

INSERT INTO TableB (Id, Name, Gender) VALUES
    (4, 'John', 'Male'),
    (5, 'Sara', 'Female'),
    (6, 'Pam', 'Female'),
    (7, 'Rebeka', 'Female'),
    (8, 'Jordan', 'Male');
GO


select id, name, gender
from tableA
except
select id, name, gender
from tableB

CREATE TABLE tblEmployees
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Gender NVARCHAR(10),
    Salary INT
);
GO

INSERT INTO tblEmployees (Name, Gender, Salary) VALUES
    ('Mark', 'Male', 52000),
    ('Mary', 'Female', 55000),
    ('Steve', 'Male', 45000),
    ('John', 'Male', 40000),
    ('Sara', 'Female', 48000),
    ('Pam', 'Female', 60000),
    ('Tom', 'Male', 58000),
    ('George', 'Male', 65000),
    ('Tina', 'Female', 67000),
    ('Ben', 'Male', 80000);
GO


select id, name, gender, salary
from tblEmployees
where salary >=50000
except select id, name, gender, salary
from tblEmployees
where salary >=60000
order by name


select id, name, gender from tableA
except
select id, name, gender from tableB

select id, name, gender from tableA
where id not in (select id from tableB)

insert into tableA values (1, 'Roman', 'Male')

select id, name, gender from tableA
except 
select id, name, gender from tableB

select id, name, gender from tableA
where id not in (select id from tableB)

select id, name, gender from tableA
except
select id, name from tableB

select id, name, gender from tableA
where id not in (select id, name from tableB)
