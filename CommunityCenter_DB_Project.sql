
CREATE DATABASE IF NOT EXISTS MatnasDB;
USE MatnasDB;

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, 
    PhoneNumber VARCHAR(15),
    JoiningDate DATE NOT NULL DEFAULT (CURRENT_DATE) 
);

CREATE TABLE MembersTypes (
    MemberTypeID INT PRIMARY KEY,
    MemberTypeName VARCHAR(50) NOT NULL UNIQUE,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0), 
    MemberTimeBudget INT NOT NULL 
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Speciality VARCHAR(50) NOT NULL
);

CREATE TABLE Halls (
    HallID INT PRIMARY KEY,
    HallName VARCHAR(50) NOT NULL UNIQUE,
    Capacity INT NOT NULL CHECK (Capacity > 0) 
);

CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY,
    LessonName VARCHAR(50) NOT NULL,
    Duration INT NOT NULL CHECK (Duration > 0), 
    InstructorID INT NOT NULL,
    HallID INT NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (HallID) REFERENCES Halls(HallID)
);

CREATE TABLE Registrations (
    RegistrationID INT PRIMARY KEY,
    MemberID INT NOT NULL,
    LessonID INT NOT NULL,
    RegistrationDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    Status VARCHAR(20) NOT NULL DEFAULT 'Active', 
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (LessonID) REFERENCES Lessons(LessonID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    MemberID INT NOT NULL,
    PaymentDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    FinalPrice DECIMAL(10,2) NOT NULL CHECK (FinalPrice >= 0),
    PaymentMethod VARCHAR(50) NOT NULL DEFAULT 'Cash', 
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    StartTime TIME NOT NULL
);





INSERT INTO Members VALUES 
(1, 'Adi', 'Levi', 'adi@gmail.com', '050-1112233', '2026-01-01'),
(2, 'Noa', 'Cohen', 'noa@gmail.com', '050-2223344', '2026-01-05'),
(3, 'Itay', 'Mizrahi', 'itay@gmail.com', '050-3334455', '2026-01-10'),
(4, 'Maya', 'Peretz', 'maya@gmail.com', '050-4445566', '2026-01-12'),
(5, 'Ron', 'Ashkenazi', 'ron@gmail.com', '050-5556677', '2026-01-15'),
(6, 'Tali', 'Shalom', 'tali@gmail.com', '052-6667788', '2026-01-20'),
(7, 'Guy', 'Barak', 'guy@gmail.com', '054-7778899', '2026-01-22'),
(8, 'Shir', 'Biton', 'shir@gmail.com', '050-8889900', '2026-01-25'),
(9, 'Omer', 'Dahan', 'omer@gmail.com', '052-9990011', '2026-01-28'),
(10, 'Dana', 'Harel', 'dana@gmail.com', '054-0001122', '2026-02-01');

INSERT INTO Schedules VALUES 
(1, '2026-03-01', '08:00:00'),
(2, '2026-03-01', '10:00:00'),
(3, '2026-03-01', '16:00:00'),
(4, '2026-03-02', '09:00:00'),
(5, '2026-03-02', '17:00:00'),
(6, '2026-03-03', '11:00:00'),
(7, '2026-03-03', '18:00:00'),
(8, '2026-03-04', '07:00:00'),
(9, '2026-03-04', '19:00:00'),
(10, '2026-03-05', '15:00:00');

INSERT INTO MembersTypes VALUES 
(1, 'Basic', 200.00, 30),
(2, 'Premium', 350.00, 30),
(3, 'Student', 150.00, 30),
(4, 'Senior', 120.00, 30),
(5, 'VIP', 500.00, 30),
(6, 'Annual', 2000.00, 365),
(7, 'Family', 600.00, 30),
(8, 'Morning Only', 100.00, 30),
(9, 'Weekend', 80.00, 30),
(10, 'Trial', 0.00, 7);

INSERT INTO Instructors VALUES 
(1, 'Yossi', 'Golan', 'Basketball'),
(2, 'Elena', 'Katz', 'Yoga'),
(3, 'Moti', 'Sasson', 'Karate'),
(4, 'Sara', 'Lev', 'Art'),
(5, 'Danny', 'Friedman', 'Guitar'),
(6, 'Rina', 'Ziv', 'Pilates'),
(7, 'Eyal', 'Givon', 'Chess'),
(8, 'Liat', 'Ronen', 'Dance'),
(9, 'Avi', 'Natan', 'Swimming'),
(10, 'Galit', 'Tal', 'Drama');

INSERT INTO Halls VALUES 
(101, 'Main Gym', 50),
(102, 'Studio A', 20),
(103, 'Studio B', 15),
(104, 'Art Room', 12),
(105, 'Music Room', 5),
(106, 'Pool', 30),
(107, 'Theater', 100),
(108, 'Computer Lab', 20),
(109, 'Meeting Room', 10),
(110, 'Dance Floor', 25);

INSERT INTO Lessons VALUES 
(1, 'Morning Yoga', 60, 2, 102),
(2, 'Kids Basketball', 90, 1, 101),
(3, 'Advanced Karate', 60, 3, 103),
(4, 'Oil Painting', 120, 4, 104),
(5, 'Classic Guitar', 45, 5, 105),
(6, 'Power Pilates', 60, 6, 102),
(7, 'Chess Master', 60, 7, 109),
(8, 'Hip Hop Dance', 75, 8, 110),
(9, 'Water Aerobics', 45, 9, 106),
(10, 'Youth Theater', 90, 10, 107);

INSERT INTO Registrations VALUES 
(1, 1, 1, '2026-02-01', 'Active'),
(2, 2, 2, '2026-02-02', 'Active'),
(3, 3, 3, '2026-02-03', 'Active'),
(4, 4, 4, '2026-02-04', 'Active'),
(5, 5, 5, '2026-02-05', 'Cancelled'),
(6, 6, 6, '2026-02-06', 'Active'),
(7, 7, 7, '2026-02-07', 'Active'),
(8, 8, 8, '2026-02-08', 'Active'),
(9, 9, 9, '2026-02-09', 'Active'),
(10, 10, 10, '2026-02-10', 'Active');

INSERT INTO Payments VALUES 
(1, 1, '2026-01-01', 200.00, 'Credit Card'),
(2, 2, '2026-01-05', 350.00, 'Cash'),
(3, 3, '2026-01-10', 150.00, 'Bit'),
(4, 4, '2026-01-12', 120.00, 'Credit Card'),
(5, 5, '2026-01-15', 500.00, 'Credit Card'),
(6, 6, '2026-01-20', 2000.00, 'Bank Transfer'),
(7, 7, '2026-01-22', 600.00, 'Cash'),
(8, 8, '2026-01-25', 100.00, 'Bit'),
(9, 9, '2026-01-28', 80.00, 'Credit Card'),
(10, 10, '2026-02-01', 0.00, 'None');







