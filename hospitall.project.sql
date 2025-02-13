create database hospitall; 
use hospitall 
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    country_name varchar(50),
    contact_number VARCHAR(15)
);
INSERT INTO Patients VALUES
(1, 'John Doe', 35, 'Male', 'USA', '1234567890'),
(2, 'Jane Smith', 28, 'Female','UK', '0987654321'),
(3, 'Michael Johnson', 45, 'Male','canada', '1122334455'),
(4, 'Emily Davis', 38, 'Female','USA', '5566778899'),
(5, 'Sarah Wilson', 60, 'Female','UK', '6677889900'),
(6, 'David Brown', 50, 'Male','Japan', '7788990011'),
(7, 'Sophia Moore', 30, 'Female','UK', '8899001122'),
(8, 'James Taylor', 42, 'Male','France', '9900112233'),
(9, 'Linda Anderson', 56, 'Female','Japan', '2233445566'),
(10, 'Robert Thomas', 33, 'Male','Brazil', '3344556677');
select * from patients;
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    country_name varchar (50),
    contact_number VARCHAR(15)
);
INSERT INTO Doctors VALUES
(1, 'Dr. Alice Green', 'Cardiologist','UK', '1231231234'),
(2, 'Dr. Bob White', 'Neurologist','France', '2342342345'),
(3, 'Dr. Clara Black', 'Orthopedic','UK', '3453453456'),
(4, 'Dr. David Brown', 'Dermatologist','USA', '4564564567'),
(5, 'Dr. Emily Harris', 'Pediatrician','Germany', '5675675678'),
(6, 'Dr. Frank Miller', 'General Practitioner','USA', '6786786789'),
(7, 'Dr. Grace Lee', 'Endocrinologist','Canada', '7897897890'),
(8, 'Dr. Henry Johnson', 'Psychiatrist','India', '8908908901'),
(9, 'Dr. Irene Wilson', 'Gynecologist','Canada', '9019019012'),
(10, 'Dr. Jack Taylor', 'Surgeon','UK', '0120120123');
select * from Doctors;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100)
);
INSERT INTO Departments VALUES
(1, 'Cardiology', 'Building A'),
(2, 'Neurology', 'Building B'),
(3, 'Orthopedics', 'Building C'),
(4, 'Dermatology', 'Building D'),
(5, 'Pediatrics', 'Building E'),
(6, 'General Medicine', 'Building F'),
(7, 'Endocrinology', 'Building G'),
(8, 'Psychiatry', 'Building H'),
(9, 'Gynecology', 'Building I'),
(10, 'Surgery', 'Building J');
select * from Departments;

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    department_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Appointments VALUES
(1, 1, 1, 1, '2025-02-12'),
(2, 2, 2, 2, '2025-02-13'),
(3, 3, 1, 1, '2025-02-14'),
(4, 4, 3, 3, '2025-02-15'),
(5, 5, 2, 2, '2025-02-16'),
(6, 6, 3, 3, '2025-02-17'),
(7, 7, 1, 1, '2025-02-18'),
(8, 8, 2, 2, '2025-02-19'),
(9, 9, 3, 3, '2025-02-20'),
(10, 10, 1, 1, '2025-02-21');
select * from appointments;

UPDATE Patients
SET contact_number = '9999999999'
WHERE patient_id = 3;

select * from Patients;

ALTER TABLE Patients
MODIFY COLUMN contact_number VARCHAR(20);

select * from Patients;

ALTER TABLE Appointments
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES Departments(department_id);

select * from Appointments;

select * from patients where name LIKE 'a%';
select * from patients;

select * from patients where contact_number LIKE '%7788%';
select * from patients where name LIKE '%s';

-- Count the number of patients
SELECT COUNT(patient_id) AS total_patients
FROM Patients;

-- Calculate the total number of appointments
SELECT SUM(appointment_count) AS total_appointments
FROM (
    SELECT COUNT(appointment_id) AS appointment_count
    FROM Appointments
    GROUP BY department_id
) AS department_appointments;

SELECT MIN(appointment_date) AS earliest_appointment
FROM Appointments;

select * from Doctors where name LIKE '%s%';
create view country_name_UK
as
select * from Patients
where country_name = "UK";

select * from Patients;

create view country_name_Canada
as
select * from Doctors
where country_name = "Canada";

select * from Patients LIMIT 5;
select * from doctors order by name ASC
LIMIT 10;
DELIMITER //
create procedure countpatients()
BEGIN
  select count(*) AS total_patients
from patients;
END //
DELIMITER ;
CALL countpatients();
select Name from patients
UNION
select Name from Doctors;
select * from patients;


