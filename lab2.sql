
CREATE TABLE Students (
StudentID NVARCHAR(12) PRIMARY KEY,
StudentName NVARCHAR(25) not null,
DateofBirth Datetime not null,
Email NVARCHAR(40),
Phone NVARCHAR(12),
Class NVARCHAR(10),
)
CREATE TABLE Subjects (
SubjectID NVARCHAR(10) PRIMARY KEY,
SubjectName NVARCHAR(25) not null,
)
CREATE TABLE Mark (
StudentID NVARCHAR(12),
SubjectID NVARCHAR(10),
Date Datetime not null,
theory Tinyint,
Practical Tinyint,
PRIMARY KEY (StudentID, SubjectID)
);

INSERT INTO Students 
VALUES ('AV0807005', 'Mail Trung Hiếu', '1989/10/11', 'trunghieu@yahoo.com', '0904115116', 'AV1'),
('AV0807006', 'Nguyễn Quý Hùng', '1988/12/2', 'quyhung@yahoo.com', '0955667787', 'AV2'),
('AV0807007', 'Đỗ Đắc Huỳnh', '1990/1/2', 'dachuynh@yahoo.com', '0988574747', 'AV2'),
('AV0807009', 'An Đăng Khuê', '1986/3/6', 'dangkhue@yahoo.com', '0986757463', 'AV1'),
('AV0807010', 'Nguyễn T. Tuyết Lan', '1989/7/12', 'tuyetlan@gmail.com', '0983310342', 'AV2'),
('AV0807011', 'Đinh Phụng Long', '1990/12/2', 'phunglong@yahoo.com', NULL, 'AV1'),
('AV0807012', 'Nguyễn Tuấn Nam', '1990/3/2', 'tuannam@yahoo.com', NULL, 'AV1');

INSERT INTO Subjects 
VALUES ('S001', 'SQL'),
('S002', 'Java Simplefield'),
('S003', 'Active Server Page');

INSERT INTO Mark 
VALUES ('AV0807005', 'S001','2008/5/6', 8, 25),
('AV0807006', 'S002','2008/5/6', 16, 30),
('AV0807007', 'S001','2008/5/6', 10, 25),
('AV0807009', 'S003', '2008/5/6',7, 13 ),
('AV0807010', 'S003','2008/5/6', 9, 16),
('AV0807011', 'S002','2008/5/6', 8, 30),
('AV0807012', 'S001','2008/5/6', 7, 31),
('AV0807005', 'S002','2008/5/6', 12, 11),
('AV0807009', 'S003','2008/5/6', 11, 20),
('AV0807010', 'S001','2008/6/6', 7, 6);
--Câu 1: Hiển thị nội dung bảng
select* from Students
--2: Hiển thị nội dung danh sách sinh viên lớp AV1
Select *
From Students
Where Class='AV1';

--3: Sử dụng lệnh UPDATE để chuyển sinh viên có mã AV0807012 sang lớp AV2
UPDATE students
set Class = 'AV2'
where studentID='AVAV0807012' ;
--4: Tính tổng sinh viên từng lớp:
SELECT StudentID, Class, COUNT(StudentID) AS 'Số sinh viên'
FROM Students
GROUP BY Class;
--5: Hiển thị danh sách sinh viên lớp AV2 được sắp xếp tăng dần theo 
SELECT * FROM Students
Where Class = 'AV2'
ORDER BY StudentName;
--6: Hiển thị danh sách sinh viên không đạt lý thuyết môn S001 (theory <10) thi ngày 6/5/2008
SELECT StudentName 
FROM Students S INNER JOIN Mark M 
ON S.StudentID = M.StudentID 
WHERE M.SubjectID = 'S001' AND  M.theory < 10 AND M.Date = '2008/5/6'
ORDER BY StudentName ASC;
-- câu 7 Hiển thị tổng số sinh viên không đạt lý thuyết môn S001. (theory <10)
SELECT COUNT(*) 
FROM Students S INNER JOIN Mark M
ON S.StudentID = M.StudentID
WHERE M.SubjectID = 'S001' AND  M.theory < 10 
-- câu 8 
SELECT * 
FROM Students 
WHERE Class = 'AV1' AND DateofBirth > '1980/1/1';
-- câu 9
DELETE 
FROM Students 
WHERE StudentID = 'AV0807011';
--câu 10
SELECT Students.StudentID, StudentName, SubjectName, Theory, Practical, Date 
FROM Mark 
INNER JOIN Subjects ON Mark.SubjectID = Subjects.SubjectID 
INNER JOIN Students ON Mark.StudentID = Students.StudentID 
WHERE Subjects.SubjectID = 'S001' AND Date = '2008/05/06';


