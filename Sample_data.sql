-- 1st -> create table of student, subjects, marks 
CREATE TABLE Students(					
	StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT ,
    Department VARCHAR(50) NOT NULL
);

CREATE TABLE Subjects(
	SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubjectName VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Marks(
	MarkID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,  -- link to students table
    SubjectID INT NOT NULL,  -- link to subjects table
    Marks INT NOT NULL CHECK (Marks BETWEEN 0 AND 100),
	FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID)
);
