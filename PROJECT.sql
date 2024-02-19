Use Project
GO

--Show Audit
create procedure ShowAudit 
as begin
SELECT *
FROM fn_get_audit_file('C:\audit\Audit-20230514-213409_BC7D098D-ADEC-4EB4-9B50-DEA1E4F04E94_0_133285557103730000.sqlaudit', default, default);
end;
exec ShowAudit

--REPORT 1
CREATE PROCEDURE TEACHER_FEEDBACK1 @TEACHER_NAME VARCHAR(20)
AS BEGIN
SELECT ST.STUDENT_ID, ST.STUDENT_NAME, FE.QUESTION1F, FE.QUESTION2F, FE.QUESTION3F
FROM FEEDBACK1 FE
JOIN FACULTY3 T ON T.FACULTY_ID = FE.FACULTY_ID
JOIN STUDENTS1 ST ON ST.STUDENT_ID = FE.STUDENT_ID
WHERE T.FACULTY_id = @TEACHER_NAME
END;
EXEC TEACHER_FEEDBACK1 @TEACHER_NAME = 1;

--REPORT 2
CREATE PROCEDURE SECTION_GRADE_2 @COURSE_NAME VARCHAR(20) 
AS BEGIN 
SELECT ST.STUDENT_ID, ST.STUDENT_NAME, SC.SECTION_NAME,
((CMD.ASSIGNMENT_OBTAINED_MARKS + CMD.FINAL_OBTAINED_MARKS + CMD.MID1_OBTAINED_MARKS+ CMD.MID2_OBTAINED_MARKS + CMD.QUIZ_OBTAINED_MARKS)) AS MARKS,
STC.GRADE
FROM STUDENTS1 ST
JOIN STUDENT_COURSE STC ON STC.STUDENT_ID = ST.STUDENT_ID
JOIN COURSES1 C ON C.COURSE_ID = STC.COURSE_ID
JOIN SECTION SC ON STC.SECTION_ID = SC.SECTION_ID
JOIN COURSE_MARKS_OBTAINED CMD ON CMD.COURSE_ID = STC.COURSE_ID
WHERE C.COURSE_id = @COURSE_NAME
END;

EXEC SECTION_GRADE_2 @COURSE_NAME = 1;

--Report 3
CREATE PROCEDURE SECTION_GRADE_COUNT @SECTION_NAME VARCHAR(20)
AS BEGIN
SELECT STC.GRADE, COUNT(STC.GRADE) AS COUNT
FROM STUDENT_COURSE STC
JOIN SECTION S ON S.SECTION_ID = STC.SECTION_ID
WHERE S.SECTION_NAME  = @SECTION_NAME
GROUP BY STC.GRADE
END;

EXEC SECTION_GRADE_COUNT @SECTION_NAME= 'E'

--Report 4
CREATE PROCEDURE STUDENT_ATTENDNCE_REPORT
AS BEGIN 
SELECT ST.STUDENT_ID, ST.STUDENT_NAME, STC.COURSE_ID, STC.ATTENDANCE
FROM STUDENTS1 ST
JOIN STUDENT_COURSE STC ON STC.STUDENT_ID = ST.STUDENT_ID
END;

EXEC STUDENT_ATTENDNCE_REPORT

--Report 5
CREATE PROCEDURE STUDENT_EVALUATION_REPORT1 @STUDENT_ID VARCHAR(20)
AS BEGIN
SELECT ST.STUDENT_ID, ST.STUDENT_NAME, C.COURSE_NAME,CMD.ASSIGNMENT_OBTAINED_MARKS,  CTM.ASSIGNMENT_TOTAL_MARKS, 
	CMD.MID1_OBTAINED_MARKS,CTM.MID1_TOTAL_MARKS,  CMD.MID2_OBTAINED_MARKS, CTM.MID2_TOTAL_MARKS,
	CMD.QUIZ_OBTAINED_MARKS,CTM.QUIZ_TOTAL_MARKS, CMD.FINAL_OBTAINED_MARKS , CTM.FINAL_TOTAL_MARKS
FROM STUDENTS1 ST
JOIN  COURSE_MARKS_OBTAINED CMD ON CMD.STUDENT_ID = ST.STUDENT_ID
JOIN COURSES1 C ON CMD.COURSE_ID = C.COURSE_ID
JOIN COURSE_TOTAL_MARKS CTM ON CTM.COURSE_ID = CMD.COURSE_ID
WHERE ST.STUDENT_ID = @STUDENT_ID
END;

EXEC STUDENT_EVALUATION_REPORT1 @STUDENT_ID = 5371

--Report 6
CREATE PROCEDURE SECTION_STUDENTS @SECTION_NAME VARCHAR(20)
AS BEGIN
SELECT S.SECTION_NAME AS SECTION, ST.STUDENT_ID AS ID,ST.STUDENT_NAME AS NAME
FROM STUDENTS1 ST
JOIN STUDENT_COURSE STC ON STC.STUDENT_ID = ST.STUDENT_ID
JOIN SECTION S ON S.SECTION_ID = STC.SECTION_ID
WHERE S.SECTION_NAME = @SECTION_NAME
GROUP BY S.SECTION_NAME, ST.STUDENT_ID, ST.STUDENT_NAME
ORDER BY ST.STUDENT_ID ASC
END;

EXEC SECTION_STUDENTS @SECTION_NAME = 'E'

--Report 7
CREATE PROCEDURE OFFERED_COURSE_REPORT
AS BEGIN 
SELECT COURSE_ID, COURSE_NAME, CREDIT_HOURS 
FROM COURSES1 C
WHERE C.COURSE_OFFERED = 'YES'
END;

EXEC OFFERED_COURSE_REPORT


--Report 8
CREATE PROCEDURE COURSE_ALLOCATION_REPORT
AS BEGIN
SELECT C.COURSE_ID, C.COURSE_NAME AS COURSE, C.CREDIT_HOURS AS CHS, S.SECTION_NAME AS SECTION, F.FACULTY_NAME AS INSTRUCTOR, C.COURSE_COORDINATOR AS COORDINATOR
FROM COURSES1 C
JOIN STUDENT_COURSE STC ON STC.COURSE_ID = C.COURSE_ID
JOIN SECTION S ON S.SECTION_ID = STC.SECTION_ID
JOIN COURSE_TEACHER CT ON CT.COURSE_ID = C.COURSE_ID
JOIN FACULTY3 F ON F.FACULTY_ID = CT.FACULTY_ID
END;
exec COURSE_ALLOCATION_REPORT;

select * from students ;
--1
CREATE TABLE FACULTY2(
FACULTY_ID NUMERIC (3),
FACULTY_NAME VARCHAR (40),
FACULTY_EMAIL NVARCHAR(40),
FT_PASSWORD NVARCHAR (10),
PRIMARY KEY (FACULTY_ID)
);
drop table faculty2;


CREATE TABLE FACULTY3(
FACULTY_ID NUMERIC (3),
FACULTY_NAME VARCHAR (40),
FACULTY_EMAIL NVARCHAR(40),
FT_PASSWORD NVARCHAR (10),
PRIMARY KEY (FACULTY_ID)
);
drop table Faculty3;

select * from faculty3;

SELECT * FROM FACULTY2;

--2
CREATE TABLE COURSES(
COURSE_ID NUMERIC (3),
COURSE_NAME VARCHAR(20),
CREDIT_HOURS NUMERIC (1),
COURSE_COORDINATOR VARCHAR (20),
COURSE_OFFERED VARCHAR (3),
PRE_REQ VARCHAR (20),
PRIMARY KEY (COURSE_ID)
);

select courses.COURSE_ID, COURSES.COURSE_NAME,COURSES.PRE_REQ
from COURSES;


--Q1



SELECT * FROM COURSES;


--3
CREATE TABLE COURSE_WEIGHTAGE1(
FACULTY_ID NUMERIC (3),
COURSE_ID NUMERIC (3),
QUIZ_WEIGHTAGE NUMERIC CHECK(QUIZ_WEIGHTAGE>=1 AND QUIZ_WEIGHTAGE <=100),
MID1_WEIGHTAGE NUMERIC CHECK (MID1_WEIGHTAGE>=1 AND MID1_WEIGHTAGE<=100),
MID2_WEIGHTAGE NUMERIC CHECK (MID2_WEIGHTAGE>=1 AND MID2_WEIGHTAGE<=100),
FINAL_WEIGHTAGE NUMERIC CHECK (FINAL_WEIGHTAGE>=1 AND FINAL_WEIGHTAGE<=100),
ASSIGNMENT_WEIGHTAGE NUMERIC CHECK (ASSIGNMENT_WEIGHTAGE>=1 AND ASSIGNMENT_WEIGHTAGE<=100),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
PRIMARY KEY (FACULTY_ID,COURSE_ID),
);
select *
from course_weightage1
where faculty_id = 1 and course_id = 1;



UPDATE STUDENT_COURSE 
set ATTENDANCE = 'A' 
from STUDENT_COURSE sc
inner join courses1 c ON sc.COURSE_ID = c.COURSE_ID	
where sc.student_id = '05371';

UPDATE COURSE_WEIGHTAGE1
set QUIZ_WEIGHTAGE = 10 , MID1_WEIGHTAGE = 15 , MID2_WEIGHTAGE = 15 , FINAL_WEIGHTAGE = 50 , ASSIGNMENT_WEIGHTAGE = 10
from COURSE_WEIGHTAGE1 cw1
inner join courses1 c ON cw1.COURSE_ID = c.COURSE_ID 
inner join faculty3 f on cw1.FACULTY_ID = f.FACULTY_ID 
where cw1.course_id = 1 and cw1.faculty_id = 1;

select * from COURSE_WEIGHTAGE1 

DROP TABLE COURSE_WEIGHTAGE1;


SELECT * FROM COURSE_WEIGHTAGE1;

--4
CREATE TABLE COURSE_TOTAL_MARKS(
FACULTY_ID NUMERIC (3),
COURSE_ID NUMERIC (3),
QUIZ_TOTAL_MARKS NUMERIC (3),
MID1_TOTAL_MARKS NUMERIC  (3),
MID2_TOTAL_MARKS NUMERIC  (3),
FINAL_TOTAL_MARKS NUMERIC  (3),
ASSIGNMENT_TOTAL_MARKS NUMERIC  (3),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
PRIMARY KEY (FACULTY_ID,COURSE_ID)
);
DROP TABLE COURSE_TOTAL_MARKS;

create procedure Quizmarks @faculty_id int, @course_id int
as
begin
SELECT students.student_id, students.student_name,courses.course_name,section.section_name,course_total_marks.quiz_total_marks
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses.course_id = student_course.course_id
INNER JOIN students ON student_course.student_id = students.student_id
inner join course_total_marks on course_total_marks.course_id = courses.course_id
WHERE faculty3.faculty_id = @faculty_id and courses.course_id = @course_id;
end;
exec Quizmarks @faculty_id = 1 , @course_id = 1

create procedure Mid1marks1 @faculty_id int, @course_id int
as
begin
SELECT students.student_id, students.student_name,courses.course_name,section.section_name,course_total_marks.mid1_total_marks
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses.course_id = student_course.course_id
INNER JOIN students ON student_course.student_id = students.student_id
inner join course_total_marks on course_total_marks.course_id = courses.course_id
WHERE faculty3.faculty_id = @faculty_id and courses.course_id = @course_id;
end;
exec Mid1marks1 @faculty_id = 1 , @course_id = 1

create procedure Mid2marks2 @faculty_id int, @course_id int
as
begin
SELECT students.student_id, students.student_name,courses.course_name,section.section_name,course_total_marks.mid2_total_marks
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses.course_id = student_course.course_id
INNER JOIN students ON student_course.student_id = students.student_id
inner join course_total_marks on course_total_marks.course_id = courses.course_id
WHERE faculty3.faculty_id = @faculty_id and courses.course_id = @course_id;
end;
exec Mid2marks2 @faculty_id = 1 , @course_id = 1


create procedure Finalmarks @faculty_id int, @course_id int
as
begin
SELECT students.student_id, students.student_name,courses.course_name,section.section_name,course_total_marks.final_total_marks
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses.course_id = student_course.course_id
INNER JOIN students ON student_course.student_id = students.student_id
inner join course_total_marks on course_total_marks.course_id = courses.course_id
WHERE faculty3.faculty_id = @faculty_id and courses.course_id = @course_id;
end;
exec Finalmarks @faculty_id = 1 , @course_id = 1

create procedure Assignmentmarks2 @faculty_id int, @course_id int
as
begin
SELECT students.student_id, students.student_name,courses.course_name,section.section_name,course_total_marks.assignment_total_marks
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses.course_id = student_course.course_id
INNER JOIN students ON student_course.student_id = students.student_id
inner join course_total_marks on course_total_marks.course_id = courses.course_id
WHERE faculty3.faculty_id = @faculty_id and courses.course_id = @course_id;
end;
exec Assignmentmarks2 @faculty_id = 1 , @course_id = 1



select * from COURSE_TOTAL_MARKS;

select * from course_marks_obtained
where course_id = 1 and student_id = 5371 ;

select * from course_weightage1;

--5
CREATE TABLE COURSE_MARKS_OBTAINED(
STUDENT_ID NUMERIC (5),
COURSE_ID NUMERIC (3),
QUIZ_OBTAINED_MARKS NUMERIC (3),
MID1_OBTAINED_MARKS NUMERIC  (3),
MID2_OBTAINED_MARKS NUMERIC  (3),
FINAL_OBTAINED_MARKS NUMERIC  (3),
ASSIGNMENT_OBTAINED_MARKS NUMERIC  (3),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS1(STUDENT_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
PRIMARY KEY(STUDENT_ID,COURSE_ID)
);

select * from courses1;
DROP TABLE COURSE_MARKS_OBTAINED;

--select QUIZ_OBTAINED_MARKS,
create procedure SHOWMARKS1 @student_id int
as begin
SELECT 
    students1.STUDENT_NAME, 
    courses.COURSE_NAME,
	  course_MARKS_OBTAINED.quiz_OBTAINED_marks,
	    course_total_marks.quiz_total_marks, 
    course_marks_obtained.mid1_obtained_marks, 
	 course_total_marks.mid1_total_marks, 
    course_marks_obtained.mid2_obtained_marks, 
	  course_total_marks.mid2_total_marks,
    course_marks_obtained.assignment_obtained_marks, 
	course_total_marks.assignment_total_marks 
FROM course_marks_obtained
INNER JOIN course_total_marks
    ON course_total_marks.Course_ID = course_marks_obtained.Course_ID
INNER JOIN students1
    ON students1.STUDENT_ID = course_marks_obtained.STUDENT_ID
INNER JOIN courses
    ON courses.COURSE_ID = course_marks_obtained.Course_ID
	WHERE students1.STUDENT_ID = @student_id
GROUP BY courses.COURSE_NAME, students1.STUDENT_NAME,course_marks_obtained.mid1_obtained_marks, 
course_MARKS_OBTAINED.quiz_OBTAINED_marks,
    course_marks_obtained.mid2_obtained_marks, 
    course_marks_obtained.assignment_obtained_marks, 
    course_total_marks.quiz_total_marks, 
    course_total_marks.assignment_total_marks, 
    course_total_marks.mid1_total_marks, 
    course_total_marks.mid2_total_marks;
END;
EXEC SHOWMARKS1 @student_id = '05371';

--select QUIZ_OBTAINED_MARKS,
	create procedure SHOWLABMARKS @student_id int
	as begin
	SELECT 
		students1.STUDENT_NAME, 
		  lab_MARKS_OBTAINED.quiz_OBTAINED_marks,
			lab_total_marks.quiz_total_marks, 
		lab_marks_obtained.mid_obtained_marks, 
		 lab_total_marks.mid_total_marks, 
		lab_marks_obtained.assignment_obtained_marks, 
		lab_total_marks.assignment_total_marks 
	FROM lab_marks_obtained
	INNER JOIN lab_total_marks
		ON lab_total_marks.LAB_ID = lab_marks_obtained.lab_ID
	INNER JOIN students1
		ON students1.STUDENT_ID = lab_marks_obtained.STUDENT_ID
		JOIN courses
		ON COURSES_LAB.lab_ID = lab_marks_obtained.lab_ID
		WHERE students1.STUDENT_ID = '05371'
	GROUP BY students1.STUDENT_NAME, 
	lab_MARKS_OBTAINED.quiz_OBTAINED_marks,
		lab_marks_obtained.mid_obtained_marks, 
		lab_marks_obtained.assignment_obtained_marks, 
		lab_total_marks.quiz_total_marks, 
		lab_total_marks.assignment_total_marks, 
		lab_total_marks.mid_total_marks 
    
	END;
	EXEC SHOWLABMARKS @student_id = '05371';

--6
CREATE TABLE COURSE_TEACHER(
FACULTY_ID NUMERIC (3),
COURSE_ID NUMERIC (3),
SECTION_ID NUMERIC (2),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY3(FACULTY_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
PRIMARY KEY (FACULTY_ID,COURSE_ID,SECTION_ID)
);
DROP TABLE COURSE_TEACHER;

--All courses that a teacher is teaching
create procedure showCourses2 @faculty_id int 
as
begin 
SELECT courses.course_id, courses.course_name, section.section_name, faculty3.faculty_name
FROM courses
INNER JOIN course_teacher ON courses.course_id = course_teacher.course_id
INNER JOIN section  ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
WHERE faculty3.faculty_id = @faculty_id
end;
exec showCourses2 @faculty_id = 10;

--Students that are enrolled in a courses that a teacher is teaching
create procedure manageCourses1 @faculty_id int, @course_id int
as
begin
SELECT students1.student_id, students1.student_name,courses1.course_name,section.section_name
FROM courses1
INNER JOIN course_teacher ON courses1.course_id = course_teacher.course_id
INNER JOIN section ON course_teacher.section_id = section.section_id
INNER JOIN faculty3 ON course_teacher.faculty_id = faculty3.faculty_id
INNER JOIN student_course ON courses1.course_id = student_course.course_id
INNER JOIN students1 ON student_course.student_id = students1.student_id
WHERE faculty3.faculty_id = @faculty_id and courses1.course_id = @course_id;
end;
exec manageCourses1 @faculty_id = 1 , @course_id = 1;


--Set Attendance of the Student
UPDATE attendance SET attendance_status = @status WHERE student_id = @studentID AND course_id = @courseID



--7
CREATE TABLE COURSES_LAB(
LAB_ID NUMERIC (3),
CREDIT_HOURS NUMERIC (1),
LAB_COORDINATOR VARCHAR (20),
PRIMARY KEY (LAB_ID)
);



SELECT * FROM COURSES_LAB;

--8
CREATE TABLE LAB_WEIGHTAGE(
FACULTY_ID NUMERIC (3),
COURSE_ID NUMERIC (3),
QUIZ_WEIGHTAGE NUMERIC CHECK(QUIZ_WEIGHTAGE>=1 AND QUIZ_WEIGHTAGE <=100),
MID_WEIGHTAGE NUMERIC CHECK (MID_WEIGHTAGE>=1 AND MID_WEIGHTAGE<=100),
FINAL_WEIGHTAGE NUMERIC CHECK (FINAL_WEIGHTAGE>=1 AND FINAL_WEIGHTAGE<=100),
ASSIGNMENT_WEIGHTAGE NUMERIC CHECK (ASSIGNMENT_WEIGHTAGE>=1 AND ASSIGNMENT_WEIGHTAGE<=100),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
PRIMARY KEY (FACULTY_ID,COURSE_ID)
);



DROP TABLE LAB_WEIGHTAGE;

--9
CREATE TABLE LAB_TOTAL_MARKS(
FACULTY_ID NUMERIC (3),
Lab_ID NUMERIC (3),
QUIZ_TOTAL_MARKS NUMERIC (3),
MID_TOTAL_MARKS NUMERIC  (3),
FINAL_TOTAL_MARKS NUMERIC  (3),
ASSIGNMENT_TOTAL_MARKS NUMERIC  (3),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
FOREIGN KEY (lab_ID) REFERENCES COURSES_LAB(lab_ID),
PRIMARY KEY (FACULTY_ID,lab_ID),
);
DROP TABLE LAB_TOTAL_MARKS;



--10
CREATE TABLE LAB_MARKS_OBTAINED(
STUDENT_ID NUMERIC (5),
LAB_ID NUMERIC (3),
QUIZ_OBTAINED_MARKS NUMERIC (3),
MID_OBTAINED_MARKS NUMERIC  (3),
FINAL_OBTAINED_MARKS NUMERIC  (3),
ASSIGNMENT_OBTAINED_MARKS NUMERIC  (3),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS1(STUDENT_ID),
FOREIGN KEY (lab_ID) REFERENCES COURSES_LAB(lab_ID),
PRIMARY KEY (STUDENT_ID,lab_ID)
);
DROP TABLE LAB_MARKS_OBTAINED;



--11
CREATE TABLE LAB_TEACHER(
FACULTY_ID NUMERIC (3),
COURSE_ID NUMERIC (3),
SECTION_ID NUMERIC (2),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
PRIMARY KEY (FACULTY_ID,COURSE_ID,SECTION_ID)
);
DROP TABLE LAB_TEACHER;


SELECT * FROM LAB_TEACHER;
--12
CREATE TABLE STUDENTS(
STUDENT_ID NUMERIC(5),
STUDENT_NAME VARCHAR (30),
ST_PASSWORD NVARCHAR (10),
PARENT_SECTION VARCHAR(1),
EMAIL Varchar (25),
FatherName varchar (30),
ARN numeric (10),
Blood_groups varchar (2),
PRIMARY KEY (STUDENT_ID)
);

select * from students;

drop table STUDENTS;
CREATE TABLE STUDENTS1(
STUDENT_ID NUMERIC(5),
STUDENT_NAME VARCHAR (30),
ST_PASSWORD NVARCHAR (10),
PARENT_SECTION VARCHAR(1),
EMAIL Varchar (25),
FatherName varchar (30),
ARN numeric (10),
Blood_groups varchar (2),
PRIMARY KEY (STUDENT_ID)
);
select * from students1;

CREATE TABLE STUDENTScreate(
STUDENT_ID NUMERIC(5),
STUDENT_NAME VARCHAR (30),
ST_PASSWORD NVARCHAR (10),
EMAIL Varchar (25),
FatherName varchar (30),
ARN numeric (10),
Blood_groups varchar (2),
PRIMARY KEY (STUDENT_ID)
);

--13
CREATE TABLE CGPA1 (
STUDENT_ID NUMERIC (5),
SEMESTER NUMERIC (1),
CGPA FLOAT (2),
);

INSERT INTO CGPA1 VALUES (05371,1,4.00);
INSERT INTO CGPA1 VALUES (05372, 2, 3.80);
INSERT INTO CGPA1 VALUES (05373, 2, 3.50);
INSERT INTO CGPA1 VALUES (05374, 3, 3.90);
INSERT INTO CGPA1 VALUES (05375, 3, 3.20);
INSERT INTO CGPA1 VALUES (05376, 4, 3.70);
INSERT INTO CGPA1 VALUES (05377, 4, 3.40);
INSERT INTO CGPA1 VALUES (05378, 5, 3.50);
INSERT INTO CGPA1 VALUES (05379, 5, 2.90);
INSERT INTO CGPA1 VALUES (05380, 6, 3.60);
INSERT INTO CGPA1 VALUES (05381, 6, 3.10);
INSERT INTO CGPA1 VALUES (05382, 7, 3.80);
INSERT INTO CGPA1 VALUES (05383, 7, 3.00);
INSERT INTO CGPA1 VALUES (05384, 8, 3.90);
INSERT INTO CGPA1 VALUES (05385, 8, 3.30);
INSERT INTO CGPA1 VALUES (05371, 2, 3.30);
INSERT INTO CGPA1 VALUES (05371, 3, 3.30);

select SEMESTER, CGPA from cgpa1 where student_id = 05371;

--Extra courses table
CREATE TABLE COURSES1(
COURSE_ID NUMERIC (3),
COURSE_NAME VARCHAR(20),
CREDIT_HOURS NUMERIC (1),
COURSE_COORDINATOR VARCHAR (20),
COURSE_OFFERED VARCHAR (3),
PRE_REQ VARCHAR (20),
PRIMARY KEY (COURSE_ID)
);

select * from courses1;


--14
CREATE TABLE STUDENT_COURSE(
SECTION_ID NUMERIC (2),
COURSE_ID NUMERIC (3),
STUDENT_ID NUMERIC (5),
GRADE VARCHAR (2),
ATTENDANCE VARCHAR (1),
RegisteredCourses Numeric (2),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
FOREIGN KEY (SECTION_ID) REFERENCES SECTION(SECTION_ID),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS1(STUDENT_ID),
PRIMARY KEY(COURSE_ID,SECTION_ID,STUDENT_ID)
);
DROP TABLE STUDENT_COURSE;

UPDATE STUDENT_COURSE SET ATTENDANCE = 'A' WHERE STUDENT_ID = '05371' AND COURSE_ID
IN (SELECT COURSE_ID FROM COURSES1 WHERE COURSE_NAME = 'DATA STRUCTURES')


UPDATE STUDENT_COURSE 
set ATTENDANCE = 'P' 
from STUDENT_COURSE sc
inner join courses1 c ON sc.COURSE_ID = c.COURSE_ID	
where sc.student_id = '05371';

create procedure UpdateAttandenceAbesent3 @attendance varchar, @roll_no int
as
begin
UPDATE STUDENT_COURSE 
set ATTENDANCE = @attendance 
from STUDENT_COURSE sc
inner join courses1 c ON sc.COURSE_ID = c.COURSE_ID	
where sc.student_id = @roll_no;
end;

exec UpdateAttandenceAbesent3 @attendance = 'P' ,@roll_no = '05371';
	select *
	from student_course
	where student_id = '05371';

select c.COURSE_NAME
from courses1 c
inner join STUDENT_COURSE sc on sc.COURSE_ID = c.COURSE_ID

create procedure PreReqCheck3 @course varchar(20),@student_id int
as begin

SELECT 
count (*) as total 
  CASE 
    WHEN c.pre_req IS NOT NULL AND sc.grade IN ('A', 'B', 'C', 'D') THEN 'Yes' 
    ELSE 'No' 
  END AS can_take_course
FROM 
  COURSES c
  LEFT JOIN COURSES pr ON c.pre_req = pr.course_name
  LEFT JOIN STUDENT_COURSE sc ON pr.course_id = sc.course_id AND sc.student_id = @student_id
WHERE 
  c.COURSE_NAME = @course
end;
exec PreReqCheck3 @course = 'Coal' , @student_id = '05381'

CREATE PROCEDURE PreReqCheck12 
  @roll_no int
AS
BEGIN
  -- Get the names of courses that have no pre-requisites
  SELECT 
    COURSE_NAME AS course_name,
    'Yes' AS can_take_course
  FROM 
    COURSES
  WHERE 
    pre_req IS NULL OR pre_req = 'NONE'
  
  UNION
  
  -- Get the names of courses the student can take based on their grades and pre-requisites
  SELECT 
    c.COURSE_NAME AS course_name,
    CASE 
      WHEN sc.grade IN ('A', 'B', 'C', 'D') THEN 'Yes' 
      ELSE 'No' 
    END AS can_take_course
  FROM 
    COURSES c
    LEFT JOIN COURSES pr ON c.pre_req = pr.course_name
    LEFT JOIN STUDENT_COURSE sc ON c.course_id = sc.course_id
    LEFT JOIN STUDENTS1 s ON s.student_id = sc.student_id
  WHERE 
    s.student_id = @roll_no
END;


exec PreReqCheck12 @roll_no = '05381';

CREATE PROCEDURE GetRegisteredCoursesSP
  @StudentID INT,
  @RegisteredCourses VARCHAR(1000) OUTPUT
AS
BEGIN
  SET @RegisteredCourses = dbo.PreReqCheck12(@StudentID)
END



CREATE PROCEDURE DisplayAttendance1 
  @roll_no int
AS
BEGIN
  SELECT 
    COURSE_NAME AS course_name,
    NULL AS attendance,
    'Yes' AS can_take_course
  FROM 
    COURSES
  WHERE 
   PRE_REQ = 'NONE'  
  UNION
  SELECT 
    c.COURSE_NAME AS course_name,
    r.ATTENDANCE,
    CASE 
      WHEN sc.GRADE IN ('A', 'B', 'C', 'D') THEN 'Yes' 
      ELSE 'No' 
    END AS can_take_course
  FROM 
    COURSES c
    LEFT JOIN COURSES pr ON c.PRE_REQ = pr.COURSE_NAME
    LEFT JOIN STUDENT_COURSE sc ON c.COURSE_ID = sc.COURSE_ID
    LEFT JOIN STUDENTS s ON s.STUDENT_ID = sc.STUDENT_ID
    LEFT JOIN STUDENT_COURSE r ON r.STUDENT_ID = s.STUDENT_ID AND r.COURSE_ID = c.COURSE_ID
	
  WHERE 
    s.STUDENT_ID = @roll_no 
END;

exec DisplayAttendance1 @roll_no = '05381';





--Qeury to increment the registered courses if the button is pressed 

CREATE PROCEDURE RegisteredStudents2 
  @roll_no int
AS
BEGIN
UPDATE STUDENT_COURSE
set RegisteredCourses = RegisteredCourses + 1 
where STUDENT_ID = @roll_no and RegisteredCourses < 6
select RegisteredCourses
from STUDENT_COURSE
where STUDENT_ID = @roll_no
end;
exec RegisteredStudents2 @roll_no = '05371';
--15
CREATE TABLE FEEDBACK1(
COURSE_ID NUMERIC (3),
STUDENT_ID NUMERIC (5),
FACULTY_ID NUMERIC (3),
Question1 VARCHAR (100),
QUESTION2 VARCHAR (100),
QUESTION3 VARCHAR (100),
QUESTION1F NUMERIC (1),
QUESTION2F NUMERIC (1),
QUESTION3F NUMERIC (1),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
PRIMARY KEY (STUDENT_ID,COURSE_ID,FACULTY_ID)
);
create procedure TAKEFEEDBACK4 @course_name varchar(20)
as
begin
select f.course_id,f.QUESTION1,f.QUESTION2,f.QUESTION3 from FEEDBACK1 f
inner join courses1 c on c.course_id = f.course_id
where c.course_name = @course_name;
end;
exec TAKEFEEDBACK4 @course_name ='DATA STRUCTURES';

select * from feedback1

create procedure UPDATEFEEDBACK @course_name varchar(20),@p1 int, @p2 int,@p3 int
as
begin
UPDATE FEEDBACK1 set QUESTION1F = @p1,QUESTION2F = @p2 ,QUESTION3F = @p3
from FEEDBACK1 
inner join courses1  on courses1.course_id = FEEDBACK1.course_id
where courses1.course_name = @course_name
end;

exec UPDATEFEEDBACK @course_name ='DATA STRUCTURES' , @p1 = 5 , @p2 = 5 , @p3 = 5;


select * from FEEDBACK1;
DROP TABLE FEEDBACK;

create procedure UpdateAttandenceAbesent3 @attendance varchar, @roll_no int
as
begin
UPDATE STUDENT_COURSE 
set ATTENDANCE = @attendance 
from STUDENT_COURSE sc
inner join courses1 c ON sc.COURSE_ID = c.COURSE_ID	
where sc.student_id = @roll_no;
end;

exec UpdateAttandenceAbesent3 @attendance = 'P' ,@roll_no = '05371';

select * from feedback1


UPDATE FEEDBACK1 
SET QUESTION1F = '2',QUESTION2F = '2',QUESTION3F = '3'
from feedback1 f
inner join faculty f1 on f1.faculty_id = f.faculty_id
inner join courses1 c ON f.COURSE_ID = c.COURSE_ID	
where f1.faculty_id = '1' and f.course_id = '1';




--16
CREATE TABLE FEEDBACK_AVG(
COURSE_ID NUMERIC (3),
FACULTY_ID NUMERIC (3),
Q1_AVG FLOAT (2),
Q2_AVG FLOAT (2),
Q3_AVG FLOAT (2),
FOREIGN KEY (COURSE_ID) REFERENCES COURSES1(COURSE_ID),
FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY2(FACULTY_ID),
PRIMARY KEY (COURSE_ID,FACULTY_ID)
);
DROP TABLE FEEDBACK_AVG;

create procedure ShowFeedback @faculty_id int, @course_id int
as
begin
SELECT FEEDBACK_AVG.course_id, courses1.course_name, FEEDBACK1.Question1, FEEDBACK_AVG.Q1_AVG, FEEDBACK1.Question2, FEEDBACK_AVG.Q2_avg, FEEDBACK1.QUESTION3, FEEDBACK_AVG.Q3_avg
FROM FEEDBACK_AVG
INNER JOIN courses1 ON courses1.course_id = FEEDBACK_AVG.course_id
INNER JOIN faculty3 ON FEEDBACK_AVG.faculty_id = faculty3.faculty_id
INNER JOIN feedback1 ON feedback1.course_id = FEEDBACK_AVG.course_id
WHERE faculty3.faculty_id = @faculty_id AND courses1.course_id = @course_id;
end;
exec ShowFeedback @faculty_id = 2 , @course_id = 2;

--17
CREATE TABLE SECTION(
SECTION_ID NUMERIC (2),
SECTION_NAME VARCHAR (1),
STUDENTS_COUNT NUMERIC CHECK (STUDENTS_COUNT>=10 AND STUDENTS_COUNT<=50),
PRIMARY KEY (SECTION_ID)
);




--18





INSERT INTO SECTION VALUES (1,'E',40);
INSERT INTO SECTION VALUES (2,'A',30);
INSERT INTO SECTION VALUES (3,'B',35);
INSERT INTO SECTION VALUES (4,'C',25);
INSERT INTO SECTION VALUES (5,'D',20);
INSERT INTO SECTION VALUES (6,'E',40);
INSERT INTO SECTION VALUES (7,'F',15);
INSERT INTO SECTION VALUES (8,'G',45);
INSERT INTO SECTION VALUES (9,'H',50);
INSERT INTO SECTION VALUES (10,'I',10);
INSERT INTO SECTION VALUES (11,'J',30);
INSERT INTO SECTION VALUES (12,'K',35);
INSERT INTO SECTION VALUES (13,'L',25);
INSERT INTO SECTION VALUES (14,'M',20);
INSERT INTO SECTION VALUES (15,'A',18);

ALTER TABLE FACULTY3 ALTER COLUMN FT_PASSWORD NVARCHAR(50);

INSERT INTO FACULTY3 VALUES
(1, 'MUHAMMAD ALEEM', 'MUHAMMMADALEEM123@NU.EDU.PK', '123'),
(15, 'Muhammad Ali', 'muhammadali123@nu.edu.pk', 'ali123'),
(2, 'Aisha Akhtar', 'aishaakhtar456@nu.edu.pk', 'akhtar456'),
(3, 'Hamza Ahmed', 'hamzaahmed789@nu.edu.pk', 'ahmed789'),
(4, 'Sana Batool', 'sanabatool012@nu.edu.pk', 'batool012'),
(5, 'Ali Raza', 'aliraza654@nu.edu.pk', 'raza654'),
(6, 'Fizza Khan', 'fizzakhan987@nu.edu.pk', 'khan987'),
(7, 'Aamir Ali', 'aamirali321@nu.edu.pk', 'ali321'),
(8, 'Hina Aslam', 'hinaaslam123@nu.edu.pk', 'aslam123'),
(9, 'Zainab Malik', 'zainabmalik456@nu.edu.pk', 'malik456'),
(10, 'Bilal Ahmed', 'bilalahmed789@nu.edu.pk', 'ahmed789'),
(11, 'Saba Noor', 'sabanoor654@nu.edu.pk', 'noor654'),
(12, 'Hammad Hassan', 'hammadhassan321@nu.edu.pk', 'hassan321'),
(13, 'Farhana Ali', 'farhanaali789@nu.edu.pk', 'ali789'),
(14, 'Rizwan Khan', 'rizwankhan012@nu.edu.pk', 'khan012'),
(16, 'Ahmed Khan', 'ahmedkhan123@nu.edu.pk', 'khan123');
DELETE FROM FACULTY3;

UPDATE FACULTY3 SET FT_PASSWORD = '123' WHERE FACULTY_ID = 1;


select* from faculty3;


INSERT INTO FACULTY2 VALUES
(1, 'MUHAMMAD ALEEM', 'MUHAMMMADALEEM123@NU.EDU.PK');

INSERT INTO FACULTY2 VALUES 
(15, 'Muhammad Ali', 'muhammadali123@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(2, 'Aisha Akhtar', 'aishaakhtar456@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(3, 'Hamza Ahmed', 'hamzaahmed789@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(4, 'Sana Batool', 'sanabatool012@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(5, 'Ali Raza', 'aliraza654@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(6, 'Fizza Khan', 'fizzakhan987@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(7, 'Aamir Ali', 'aamirali321@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(8, 'Hina Aslam', 'hinaaslam123@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(9, 'Zainab Malik', 'zainabmalik456@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(10, 'Bilal Ahmed', 'bilalahmed789@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(11, 'Saba Noor', 'sabanoor654@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(12, 'Hammad Hassan', 'hammadhassan321@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(13, 'Farhana Ali', 'farhanaali789@nu.edu.pk');

INSERT INTO FACULTY2 VALUES 
(14, 'Rizwan Khan', 'rizwankhan012@nu.edu.pk');


INSERT INTO COURSES VALUES 
(1,'DATA STRUCTURES',3,'OWAIS IDREES','YES','OOP' );
INSERT INTO COURSES VALUES
(2, 'DATABASE SYSTEMS', 3, 'ANUM JAVAID', 'NO', 'NONE');

INSERT INTO COURSES VALUES
(3, 'WEB PROGRAMMING', 2, 'HUMA ASLAM', 'YES', 'NONE');

INSERT INTO COURSES VALUES
(4, 'DISCRETE', 3, 'UMAIR SIDDIQUI', 'YES', 'MACHINE LEARNING');

INSERT INTO COURSES VALUES
(5, 'OPERATING SYSTEMS', 2, 'FARHAN ALI', 'NO', 'NONE');

INSERT INTO COURSES VALUES
(6, 'DATABASE MANAGEMENT', 3, 'IMRAN KHAN', 'YES', 'NONE');

INSERT INTO COURSES VALUES
(7, 'DATA MINING', 2, 'SARA KHAN', 'YES', 'MACHINE LEARNING');

INSERT INTO COURSES VALUES
(8, 'COAL', 3, 'JAVED IQBAL', 'NO', 'NONE');

INSERT INTO COURSES VALUES
(9, 'NETWORK SECURITY', 2, 'ALI RAZA', 'YES', 'NETWORKING');

INSERT INTO COURSES VALUES
(10, 'SOFTWARE ENGINEERING', 3, 'FAIZA NAWAZ', 'YES', 'NONE');

INSERT INTO COURSES VALUES
(11, 'ALGORITHMS', 2, 'AHMED ALI', 'NO', 'DATA STRUCTURES');

INSERT INTO COURSES VALUES
(12, 'CLOUD COMPUTING', 3, 'SHAHID HUSSAIN', 'YES', 'DISTRIBUTED SYSTEMS');

INSERT INTO COURSES VALUES
(13, 'DATABASE DESIGN', 2, 'NIMRA JAMIL', 'YES', 'NONE');

INSERT INTO COURSES VALUES
(14, 'COMPUTER GRAPHICS', 3, 'ZAHID HUSSAIN', 'NO', 'NONE');

INSERT INTO COURSES VALUES
(15, 'NEURAL NETWORKS', 2, 'SADIA MUNIR', 'YES', 'MACHINE LEARNING');

INSERT INTO COURSE_WEIGHTAGE1 VALUES(1,1,15,15,15,15,40);
INSERT INTO COURSE_WEIGHTAGE1 VALUES(2,2,10,20,10,20,40);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(3,3,10,20,10,20,40);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(4,4,15,15,20,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(5,5,20,10,20,10,40);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(6,6,10,20,20,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(7,7,20,20,10,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(8,8,5,15,25,35,20);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(9,9,20,10,20,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(10,10,15,20,15,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(11,11,20,20,20,20,20);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(12,12,10,20,20,20,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(13,13,20,20,20,20,20);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(14,14,15,20,20,15,30);

INSERT INTO COURSE_WEIGHTAGE1 VALUES(15,15,10,20,20,20,30);

select * from COURSE_WEIGHTAGE1
where faculty_id = 1 and course_id = 1;


INSERT INTO COURSE_TOTAL_MARKS VALUES
(1,1,10,60,60,120,15);
INSERT INTO COURSE_TOTAL_MARKS VALUES
(2,2,50,70,80,200,25);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(3,3,70,80,90,240,30);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(4,4,60,90,70,220,20);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(5,5,80,70,60,210,25);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(6,6,90,60,80,230,30);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(7,7,75,85,65,225,20);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(8,8,80,75,85,240,25);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(9,9,85,80,75,240,30);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(10,10,70,90,80,240,20);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(11,11,90,70,75,235,25);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(12,12,80,80,90,250,30);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(13,13,75,85,80,240,20);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(14,14,85,75,65,225,25);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(15,15,90,80,70,240,30);

INSERT INTO COURSE_TOTAL_MARKS VALUES
(1,13,90,80,70,240,30);

INSERT INTO COURSE_MARKS_OBTAINED VALUES (05371,1,8,58,58,115,14);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05372,2,20,52,53,110,13);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05373,3,15,55,56,118,12);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05374,4,22,58,57,116,15);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05375,5,12,51,50,111,11);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05376,6,19,53,54,114,13);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05377,7,18,59,60,120,15);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05378,8,16,50,48,105,11);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05379,9,21,54,56,117,14);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05380,10,14,49,52,113,12);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05381,11,11,45,44,100,10);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05382,12,17,47,49,109,12);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05383,13,13,52,51,111,11);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05384,14,20,60,59,118,14);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05385,15,9,48,45,104,9);
INSERT INTO COURSE_MARKS_OBTAINED VALUES (05371,13,9,48,45,104,9);

INSERT INTO COURSE_TEACHER VALUES (1,1,1);
INSERT INTO COURSE_TEACHER VALUES (2,2,3);
INSERT INTO COURSE_TEACHER VALUES (3,3,2);
INSERT INTO COURSE_TEACHER VALUES (4,4,3);
INSERT INTO COURSE_TEACHER VALUES (5,5,2);
INSERT INTO COURSE_TEACHER VALUES (6,6,3);
INSERT INTO COURSE_TEACHER VALUES (7,7,2);
INSERT INTO COURSE_TEACHER VALUES (8,8,3);
INSERT INTO COURSE_TEACHER VALUES (9,9,2);
INSERT INTO COURSE_TEACHER VALUES (10,10,3);
INSERT INTO COURSE_TEACHER VALUES (11,11,2);
INSERT INTO COURSE_TEACHER VALUES (12,12,3);
INSERT INTO COURSE_TEACHER VALUES (13,13,2);
INSERT INTO COURSE_TEACHER VALUES (14,14,3);
INSERT INTO COURSE_TEACHER VALUES (15,15,2);
INSERT INTO COURSE_TEACHER VALUES (1,3,3);
INSERT INTO COURSE_TEACHER VALUES (1,6,7);

INSERT INTO COURSES_LAB VALUES (1,2,'SANA RAZZAQ');
INSERT INTO COURSES_LAB VALUES (2,3,'ALI HASSAN');
INSERT INTO COURSES_LAB VALUES (3,4,'FATIMA AKRAM');
INSERT INTO COURSES_LAB VALUES (4,5,'UMER JAVED');
INSERT INTO COURSES_LAB VALUES (5,2,'HAFSA ABBASI');
INSERT INTO COURSES_LAB VALUES (6,3,'HASSAN JAVED');
INSERT INTO COURSES_LAB VALUES (7,4,'SADIA HAMEED');
INSERT INTO COURSES_LAB VALUES (8,5,'AMNA AHMED');
INSERT INTO COURSES_LAB VALUES (9,2,'SAJID ALI');
INSERT INTO COURSES_LAB VALUES (10,3,'ASMA AKRAM');
INSERT INTO COURSES_LAB VALUES (11,4,'ABDUL RAUF');
INSERT INTO COURSES_LAB VALUES (12,5,'MARIAM HAIDER');
INSERT INTO COURSES_LAB VALUES (13,2,'ALI RAZA');
INSERT INTO COURSES_LAB VALUES (14,3,'SABA TAHIR');
INSERT INTO COURSES_LAB VALUES (15,4,'ZAINAB TARIQ');

INSERT INTO LAB_WEIGHTAGE VALUES (1,1,20,30,40,10);

INSERT INTO LAB_WEIGHTAGE VALUES (2,2,40,20,30,10);
INSERT INTO LAB_WEIGHTAGE VALUES (3,3,30,10,50,10);
INSERT INTO LAB_WEIGHTAGE VALUES (4,4,20,30,40,10);
INSERT INTO LAB_WEIGHTAGE VALUES (5,5,30,20,40,10);
INSERT INTO LAB_WEIGHTAGE VALUES (6,6,40,30,20,10);
INSERT INTO LAB_WEIGHTAGE VALUES (7,7,50,20,20,10);
INSERT INTO LAB_WEIGHTAGE VALUES (8,8,20,30,40,10);
INSERT INTO LAB_WEIGHTAGE VALUES (9,9,30,20,40,10);
INSERT INTO LAB_WEIGHTAGE VALUES (10,10,40,20,30,10);
INSERT INTO LAB_WEIGHTAGE VALUES (11,11,50,20,20,10);
INSERT INTO LAB_WEIGHTAGE VALUES (12,12,20,30,40,10);
INSERT INTO LAB_WEIGHTAGE VALUES (13,13,50,20,20,10);
INSERT INTO LAB_WEIGHTAGE VALUES (14,14,40,30,20,10);
INSERT INTO LAB_WEIGHTAGE VALUES (15,15,30,20,40,10);

INSERT INTO LAB_TOTAL_MARKS VALUES (1,1,15,100,150,140);
INSERT INTO LAB_TOTAL_MARKS VALUES (2,2,20,120,130,150);
INSERT INTO LAB_TOTAL_MARKS VALUES (3,3,15,130,140,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (4,4,20,110,150,130);
INSERT INTO LAB_TOTAL_MARKS VALUES (5,5,25,150,130,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (6,6,20,140,120,130);
INSERT INTO LAB_TOTAL_MARKS VALUES (7,7,15,130,140,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (8,8,20,120,150,130);
INSERT INTO LAB_TOTAL_MARKS VALUES (9,9,25,150,130,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (10,10,20,140,120,130);
INSERT INTO LAB_TOTAL_MARKS VALUES (11,11,15,130,140,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (12,12,20,150,120,130);
INSERT INTO LAB_TOTAL_MARKS VALUES (13,13,25,140,130,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (14,14,20,130,150,120);
INSERT INTO LAB_TOTAL_MARKS VALUES (15,15,15,120,140,140);

INSERT INTO LAB_MARKS_OBTAINED VALUES (05371,1,12,101,103,90);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05385,1,12,70,80,60);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05372,2,15,90,92,88);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05373,3,17,75,80,90);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05374,4,20,80,85,95);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05375,5,13,95,90,80);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05376,6,19,85,95,90);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05377,7,20,100,100,100);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05378,8,16,70,75,85);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05379,9,14,80,70,75);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05380,10,18,85,80,90);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05381,11,15,95,85,80);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05382,12,11,70,80,60);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05383,13,20,100,100,100);
INSERT INTO LAB_MARKS_OBTAINED VALUES (05384,14,19,90,95,95);

INSERT INTO LAB_TEACHER VALUES (1,1,1);
INSERT INTO LAB_TEACHER VALUES (2,2,2);

INSERT INTO LAB_TEACHER VALUES (3,3,3);

INSERT INTO LAB_TEACHER VALUES (4,4,4);

INSERT INTO LAB_TEACHER VALUES (5,5,5);

INSERT INTO LAB_TEACHER VALUES (6,6,6);

INSERT INTO LAB_TEACHER VALUES (7,7,7);

INSERT INTO LAB_TEACHER VALUES (8,8,8);

INSERT INTO LAB_TEACHER VALUES (9,9,9);

INSERT INTO LAB_TEACHER VALUES (10,10,10);

INSERT INTO LAB_TEACHER VALUES (11,11,11);

INSERT INTO LAB_TEACHER VALUES (12,12,12);

INSERT INTO LAB_TEACHER VALUES (13,13,13);

INSERT INTO LAB_TEACHER VALUES (14,14,14);
INSERT INTO LAB_TEACHER VALUES (15,15,15);

select * from students1;

INSERT INTO STUDENTScreate VALUES
(05371,'WALEED ASIF',123456789,'waleed.asif@example.com','Asif',987654321,'B+');

INSERT INTO STUDENTScreate VALUES
(05372,'FAIZA AMJAD',234567890,'faiza.amjad@example.com','Amjad',876543219,'A-');

select * from studentscreate;




INSERT INTO STUDENTS1 VALUES
(05371,'WALEED ASIF',123456789,'E','waleed.asif@example.com','Asif',987654321,'B+');

INSERT INTO STUDENTS1 VALUES
(05372,'FAIZA AMJAD',234567890,'B','faiza.amjad@example.com','Amjad',876543219,'A-');

INSERT INTO STUDENTS1 VALUES
(05373,'HAMZA MUNIR',345678901,'D','hamza.munir@example.com','Munir',765432198,'O+');

INSERT INTO STUDENTS1 VALUES
(05374,'ALI RAZA',456789012,'A','ali.raza@example.com','Raza',654321987,'A-');

INSERT INTO STUDENTS1 VALUES
(05375,'SARA KHAN',567890123,'C','sara.khan@example.com','Khan',543219876,'B-');

INSERT INTO STUDENTS1 VALUES
(05376,'NIMRA JAMIL',678901234,'B','nimra.jamil@example.com','Jamil',432198765,'B+');

INSERT INTO STUDENTS1 VALUES
(05377,'UMAIR SIDDIQUI',789012345,'E','umair.siddiqui@example.com','Siddiqui',321987654,'O-');

INSERT INTO STUDENTS1 VALUES
(05378,'IMRAN KHAN',890123456,'A','imran.khan@example.com','Khan',219876543,'A+');

INSERT INTO STUDENTS1 VALUES
(05379,'FAIZA NAWAZ',901234567,'B','faiza.nawaz@example.com','Nawaz',198765432,'B+');

INSERT INTO STUDENTS1 VALUES
(05380,'ZAHID HUSSAIN',123789456,'C','zahid.hussain@example.com','Hussain',987654321,'B-');

INSERT INTO STUDENTS1 VALUES
(05381,'SADIA MUNIR',234896753,'D','sadia.munir@example.com','Munir',876543219,'O+');

INSERT INTO STUDENTS1 VALUES
(05382,'AHMED ALI',789123654,'B','ahmed.ali@example.com','Ali',765432198,'A-');

INSERT INTO STUDENTS1 VALUES
(05383,'SHAHID HUSSAIN',258963147,'E','shahid.hussain@example.com','Hussain',654321987,'B-');

INSERT INTO STUDENTS1 VALUES
(05384,'JAVED IQBAL',951357864,'C','javed.iqbal@example.com','Iqbal',543219876,'A+');

INSERT INTO STUDENTS1 VALUES
(05385,'FARHAN ALI',852369741,'A','farhan.ali@example.com','Ali',432198765,'A-');

INSERT INTO STUDENTS1 VALUES
(05386,'HUMA ASLAM',753951628,'B','huma.aslam@example.com','Aslam',321987654,'B+');

INSERT INTO STUDENTS1 VALUES
(05387,'ANUM JAVAID',159753486,'D', 'anum.j@example.com', 'Javaid Ahmed', '123456789', 'B+');

INSERT INTO STUDENTS1 VALUES
(05388,'NASHIT IQBAL',963258741,'A', 'nashit.i@example.com', 'Iqbal Ahmed', '987654321', 'O+');

INSERT INTO STUDENTS1 VALUES
(05389,'HARIS RIAZ',456123789,'E', 'haris.r@example.com', 'Riaz Ahmad', '456789123', 'A-');

INSERT INTO STUDENTS1 VALUES
(05390,'TANZEELA HAMID',321654987,'C', 'tanzeela.h@example.com', 'Hamid Ali', '789456123', 'A+');


INSERT INTO CGPA VALUES (05371,1,4.00);
INSERT INTO CGPA VALUES (05372, 2, 3.80);
INSERT INTO CGPA VALUES (05373, 2, 3.50);
INSERT INTO CGPA VALUES (05374, 3, 3.90);
INSERT INTO CGPA VALUES (05375, 3, 3.20);
INSERT INTO CGPA VALUES (05376, 4, 3.70);
INSERT INTO CGPA VALUES (05377, 4, 3.40);
INSERT INTO CGPA VALUES (05378, 5, 3.50);
INSERT INTO CGPA VALUES (05379, 5, 2.90);
INSERT INTO CGPA VALUES (05380, 6, 3.60);
INSERT INTO CGPA VALUES (05381, 6, 3.10);
INSERT INTO CGPA VALUES (05382, 7, 3.80);
INSERT INTO CGPA VALUES (05383, 7, 3.00);
INSERT INTO CGPA VALUES (05384, 8, 3.90);
INSERT INTO CGPA VALUES (05385, 8, 3.30);


INSERT INTO COURSES1 VALUES 
(1,'DATA STRUCTURES',3,'OWAIS IDREES','YES','OOP' );
INSERT INTO COURSES1 VALUES
(2, 'DATABASE SYSTEMS', 3, 'ANUM JAVAID', 'NO', 'NONE');

INSERT INTO COURSES1 VALUES
(3, 'WEB PROGRAMMING', 2, 'HUMA ASLAM', 'YES', 'NONE');

INSERT INTO COURSES1 VALUES
(4, 'DISCRETE', 3, 'UMAIR SIDDIQUI', 'YES', 'MACHINE LEARNING');

INSERT INTO COURSES1 VALUES
(5, 'OPERATING SYSTEMS', 2, 'FARHAN ALI', 'NO', 'NONE');

INSERT INTO COURSES1 VALUES
(6, 'DATABASE MANAGEMENT', 3, 'IMRAN KHAN', 'YES', 'NONE');

INSERT INTO COURSES1 VALUES
(7, 'DATA MINING', 2, 'SARA KHAN', 'YES', 'MACHINE LEARNING');

INSERT INTO COURSES1 VALUES
(8, 'COAL', 3, 'JAVED IQBAL', 'NO', 'NONE');

INSERT INTO COURSES1 VALUES
(9, 'NETWORK SECURITY', 2, 'ALI RAZA', 'YES', 'NETWORKING');

INSERT INTO COURSES1 VALUES
(10, 'SOFTWARE ENGINEERING', 3, 'FAIZA NAWAZ', 'YES', 'NONE');

INSERT INTO COURSES1 VALUES
(11, 'ALGORITHMS', 2, 'AHMED ALI', 'NO', 'DATA STRUCTURES');

INSERT INTO COURSES1 VALUES
(12, 'CLOUD COMPUTING', 3, 'SHAHID HUSSAIN', 'YES', 'DISTRIBUTED SYSTEMS');

INSERT INTO STUDENT_COURSE VALUES (1,1,05371,'A','P',2);
INSERT INTO STUDENT_COURSE VALUES (2,2,05372,'B','A',3);
INSERT INTO STUDENT_COURSE VALUES (3,3,05373,'A','P',1);
INSERT INTO STUDENT_COURSE VALUES (4,4,05374,'C','P',5);
INSERT INTO STUDENT_COURSE VALUES (5,5,05375,'B','A',2);
INSERT INTO STUDENT_COURSE VALUES (6,6,05376,'A','A',0);
INSERT INTO STUDENT_COURSE VALUES (7,7,05377,'A','P',1);
INSERT INTO STUDENT_COURSE VALUES (8,8,05378,'B','P',4);
INSERT INTO STUDENT_COURSE VALUES (9,9,05379,'C','A',6);
INSERT INTO STUDENT_COURSE VALUES (10,10,05380,'A','P',3);
INSERT INTO STUDENT_COURSE VALUES (11,11,05381,'B','P',4);
INSERT INTO STUDENT_COURSE VALUES (12,12,05382,'D','A',2);
INSERT INTO STUDENT_COURSE VALUES (13,13,05383,'A','P',5);
INSERT INTO STUDENT_COURSE VALUES (14,14,05384,'A','A',1);
INSERT INTO STUDENT_COURSE VALUES (15,15,05385,'B','A',0);
insert into Student_course values (1,1,05381,'A','P',0);



INSERT INTO FEEDBACK1 VALUES (1, 05371, 1, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 1, 2, 3);
INSERT INTO FEEDBACK1 VALUES (2, 05372, 1, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 2, 3, 4);
INSERT INTO FEEDBACK1 VALUES (3, 05373, 2, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 3, 4, 5);
INSERT INTO FEEDBACK1 VALUES (4, 05374, 3, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 4, 5, 1);
INSERT INTO FEEDBACK1 VALUES (5, 05375, 4, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 5, 1, 2);
INSERT INTO FEEDBACK1 VALUES (6, 05376, 5, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 2, 3, 4);
INSERT INTO FEEDBACK1 VALUES (7, 05377, 6, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 4, 5, 1);
INSERT INTO FEEDBACK1 VALUES (8, 05378, 7, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 1, 2, 3);
INSERT INTO FEEDBACK1 VALUES (9, 05379, 8, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 3, 4, 5);
INSERT INTO FEEDBACK1 VALUES (10, 05380, 9, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 5, 1, 2);
INSERT INTO FEEDBACK1 VALUES (11, 05381, 10, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 2, 3, 4);
INSERT INTO FEEDBACK1 VALUES (12, 05382, 11, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 4, 5, 1);
INSERT INTO FEEDBACK1 VALUES (13, 05383, 12, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 1, 2, 3);
INSERT INTO FEEDBACK1 VALUES (14, 05384, 13, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 3, 4, 5);
INSERT INTO FEEDBACK1 VALUES (15, 05385, 14, 'HOW WAS THE TEACHING METHOD?', 'HOW WAS THE BEHAVIOR?', 'HOW WAS THE DRESS CODE?', 5, 1 , 3);







INSERT INTO FEEDBACK_AVG VALUES (1,1,2.12,3.12,4.12);
INSERT INTO FEEDBACK_AVG VALUES (2, 2, 3.45, 4.57, 4.22);
INSERT INTO FEEDBACK_AVG VALUES (3, 2, 2.89, 3.67, 4.12);
INSERT INTO FEEDBACK_AVG VALUES (4, 3, 4.12, 4.23, 3.78);
INSERT INTO FEEDBACK_AVG VALUES (5, 3, 3.78, 3.45, 3.12);
INSERT INTO FEEDBACK_AVG VALUES (6, 4, 4.56, 4.12, 3.67);
INSERT INTO FEEDBACK_AVG VALUES (7, 4, 4.12, 4.67, 4.23);
INSERT INTO FEEDBACK_AVG VALUES (8, 1, 2.78, 3.23, 3.12);
INSERT INTO FEEDBACK_AVG VALUES (9, 1, 3.67, 3.56, 3.78);
INSERT INTO FEEDBACK_AVG VALUES (10, 2, 3.23, 3.12, 2.89);
INSERT INTO FEEDBACK_AVG VALUES (11, 2, 2.45, 2.67, 2.78);
INSERT INTO FEEDBACK_AVG VALUES (12, 3, 4.23, 4.12, 4.56);
INSERT INTO FEEDBACK_AVG VALUES (13, 3, 4.12, 3.78, 3.45);
INSERT INTO FEEDBACK_AVG VALUES (14, 4, 3.56, 3.67, 3.23);
INSERT INTO FEEDBACK_AVG VALUES (15, 4, 3.12, 3.23, 2.78);

