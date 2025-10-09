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
