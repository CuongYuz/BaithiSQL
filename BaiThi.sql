--Create Tables:
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Subject VARCHAR(50)
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ClassID INT,
    BirthDate DATE,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

--Insert Data:
INSERT INTO Teachers (TeacherID, FirstName, LastName, Subject)
VALUES
    (1, 'Huong', 'Lan', 'Math'),
    (2, 'Hoa', 'Chi', 'Science'),
    (3, 'Phong', 'Sang', 'History');

INSERT INTO Classes (ClassID, ClassName, TeacherID)
VALUES
    (1, 'Mathematics', 1),
    (2, 'Physics', 2),
    (3, 'History', 3),
    (4, 'Biology', 2),
    (5, 'Chemistry', 1);

INSERT INTO Students (StudentID, FirstName, LastName, ClassID, BirthDate)
VALUES
    (1, 'Hieu', 'Truong', 1, '2000-05-10'),
    (2, 'Son', 'Lam', 2, '1999-08-15'),
    (3, 'Quang', 'Nam', 3, '2001-11-20'),
    (4, 'Hung', 'Lan', 1, '2002-03-25'),
    (5, 'Cuong', 'My', 2, '2005-07-30'),
    (6, 'Quan', 'Linh', 3, '2002-01-05'),
    (7, 'Xuan', 'Le', 4, '2002-09-12'),
    (8, 'Trang', 'Duc', 5, '2001-12-28'),
    (9, 'Thy', 'Tien', 1, '2000-06-17'),
    (10, 'Huong', 'Manh', 2, '2003-04-08');

	--Data Query:
	SELECT 
    s.FirstName, 
    s.LastName, 
    c.ClassName, 
    t.FirstName AS TeacherFirstName, 
    t.LastName AS TeacherLastName
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID;

--Query Conditions:
SELECT * 
FROM Students 
WHERE YEAR(BirthDate) >= 2003;

--JOIN Query:
SELECT 
    s.FirstName, 
    s.LastName, 
    c.ClassName, 
    t.FirstName AS TeacherFirstName, 
    t.LastName AS TeacherLastName
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID
ORDER BY 
    s.FirstName, s.LastName;

--Updating data:
UPDATE Students
SET FirstName = 'John Doe'
WHERE StudentID = 3;

--Deleting data:
DELETE FROM Students
WHERE StudentID = 7;

--Procedure:
CREATE PROCEDURE GetStudentsByClassAndSubject (
    IN classID INT,
    IN subject VARCHAR(50)
)
BEGIN
    SELECT 
        s.FirstName, 
        s.LastName
    FROM 
        Students s
    JOIN 
        Classes c ON s.ClassID = c.ClassID
    JOIN 
        Teachers t ON c.TeacherID = t.TeacherID
    WHERE 
        c.ClassID = classID 
        AND t.Subject = subject;
END;

--View:
CREATE VIEW StudentsWithClassAndTeacher AS
SELECT 
    s.FirstName, 
    s.LastName, 
    c.ClassName, 
    t.FirstName AS TeacherFirstName, 
    t.LastName AS TeacherLastName
FROM 
    Students s
JOIN 
    Classes c ON s.ClassID = c.ClassID
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID;
