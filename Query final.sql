GO
CREATE DATABASE MyJAVADB
GO

GO
USE MyJAVADB
GO

GO
IF OBJECT_ID('dbo.Nurse_Record', 'U') IS NOT NULL
 DROP TABLE dbo.Nurse_Record;
GO
GO
IF OBJECT_ID('dbo.Patient_Record', 'U') IS NOT NULL
 DROP TABLE dbo.Patient_Record;
GO
GO
IF OBJECT_ID('dbo.Doctor_Record', 'U') IS NOT NULL
 DROP TABLE dbo.Doctor_Record;
GO
GO
IF OBJECT_ID('dbo.Invoice_Medicine', 'U') IS NOT NULL
 DROP TABLE dbo.Invoice_Medicine;
GO
GO
IF OBJECT_ID('dbo.Hospital_Patient', 'U') IS NOT NULL
 DROP TABLE dbo.Hospital_Patient;
GO
GO
IF OBJECT_ID('dbo.Hospital_Employee', 'U') IS NOT NULL
 DROP TABLE dbo.Hospital_Employee;
GO
GO
IF OBJECT_ID('dbo.Record', 'U') IS NOT NULL
 DROP TABLE dbo.Record;
GO
GO
IF OBJECT_ID('dbo.Nurse', 'U') IS NOT NULL
 DROP TABLE dbo.Nurse;
GO
GO
IF OBJECT_ID('dbo.Trainee', 'U') IS NOT NULL
 DROP TABLE dbo.Trainee;
GO
GO
IF OBJECT_ID('dbo.Room', 'U') IS NOT NULL
 DROP TABLE dbo.Room;
GO
GO
IF OBJECT_ID('dbo.Medicine', 'U') IS NOT NULL
 DROP TABLE dbo.Medicine;
GO
GO
IF OBJECT_ID('dbo.Invoice', 'U') IS NOT NULL
 DROP TABLE dbo.Invoice;
GO
GO
IF OBJECT_ID('dbo.Doctor', 'U') IS NOT NULL
 DROP TABLE dbo.Doctor;
GO
GO
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
 DROP TABLE dbo.Employee;
GO
GO
IF OBJECT_ID('dbo.Patient', 'U') IS NOT NULL
 DROP TABLE dbo.Patient;
GO
GO
IF OBJECT_ID('dbo.Hospital', 'U') IS NOT NULL
 DROP TABLE dbo.Hospital;
GO
GO
IF OBJECT_ID('dbo.Address_', 'U') IS NOT NULL
 DROP TABLE dbo.Address_;
GO

GO
CREATE TABLE Address_(
Zip_Code VARCHAR(7),
Address_2 VARCHAR(30) NOT NULL,
City VARCHAR(15) NOT NULL,
_State VARCHAR(20) NOT NULL,
Country VARCHAR(20) NOT NULL,

CONSTRAINT PK_Address PRIMARY KEY(Zip_Code)
);
GO

--Constraints
GO
ALTER TABLE Address_
ADD CONSTRAINT CHK_Zip_Code
CHECK (Zip_Code LIKE '[A-Z][0-9][A-Z] [0-9][A-Z][0-9]'),

CONSTRAINT CHK_City
CHECK (City NOT LIKE '%[^a-z ]%');
GO

--Inserting values
GO
insert into Address_ values ('M3J 2V7', '35 Fountain head road','North York', 'Ontario', 'Canada');
insert into Address_ values ('M2R 2R6', '334 Moore park av','North York', 'Ontario', 'Canada');
insert into Address_ values ('L7C 2H5', '14783 Kennedy rd','Inglewood', 'Ontario', 'Canada');
insert into Address_ values ('H4V 2A4', '5416 Rue west','Montreal', 'Quebec', 'Canada');
insert into Address_ values ('H3G 2A8', '3678 Rue de la','Montreal', 'Quebec', 'Canada');
insert into Address_ values ('V6M 2V9', '5750 Oak st', 'Vancouver','British Columbia', 'Canada');
insert into Address_ values ('T2S 0M9', '622 Hillcrest ave','Calgary', 'Alberta', 'Canada');
insert into Address_ values ('T2T 2T3', '1916 48 Ave SW','Calgary', 'Alberta', 'Canada');
insert into Address_ values ('V5X 4J2', '6596 Culloden st', 'Vancouver','British Columbia', 'Canada');
insert into Address_ values ('B3L 1G6', '6208 Allan st', 'Halifax','Nova Scotia', 'Canada');
select * from Address_
GO

GO
CREATE TABLE Patient(
Patient_ID DECIMAL(10),
P_FName VARCHAR(15) NOT NULL,
P_LName VARCHAR(15) NOT NULL,
P_Sex CHAR(1) NOT NULL,
P_DOB DATE NOT NULL,
P_Contact_Number DECIMAL(10) NOT NULL,
P_Emergency_Contact_Number DECIMAL(10) NOT NULL,
P_Address_1 VARCHAR(40) NOT NULL,
Date_Enrolled DATE NOT NULL,

Zip_Code VARCHAR(7) NOT NULL,

CONSTRAINT PK_Patient PRIMARY KEY(Patient_ID),
CONSTRAINT FK_Patient_Address FOREIGN KEY (Zip_Code) REFERENCES Address_(Zip_Code)
);
GO

--Constraints
GO
ALTER TABLE Patient
ADD CONSTRAINT CHK_Patient_ID
CHECK (Patient_ID NOT LIKE '%[^A-Z 0-9]%'),

CONSTRAINT CHK_Patient_Sex
CHECK (P_Sex IN ('M','F')),

CONSTRAINT CHK_P_DOB
CHECK (P_DOB >= '1920-01-01' AND P_DOB <= GETDATE()),

CONSTRAINT CHK_DATE_ENROLLED
CHECK (DATE_ENROLLED <= GETDATE()); 
GO

--Inserting values
GO
insert into Patient values ('0000000010', 'Ortensia', 'Franceschelli', 'F', '2009/11/4', '6619523827', '5121912111', '70983 8th Point', '2019/9/21','M3J 2V7');
insert into Patient values ('0000000011', 'Ingram', 'Laxtonne', 'M', '1998/5/17', '8669988656', '6249240046', '5341 Moose Road', '2019/12/21','M2R 2R6');
insert into Patient values ('0000000012', 'Sylvester', 'Searjeant', 'M', '1987/8/25', '6373561312', '4817810654', '5558 Jackson Avenue', '2019/7/18','L7C 2H5');
insert into Patient values ('0000000013', 'Raviv', 'Plomer', 'M', '1982/3/26', '2724451176', '8807267565', '01161 Huxley Pass', '2020/1/6','H4V 2A4');
insert into Patient values ('0000000014', 'Cecile', 'Guise', 'F', '1993/5/22', '8868585826', '7886018615', '09564 Lyons Point', '2019/5/4','H3G 2A8');
insert into Patient values ('0000000015', 'Ashton', 'Howorth', 'M', '2000/3/16', '574157573', '6268695937', '9772 Mifflin Parkway', '2019/9/28','V6M 2V9');
insert into Patient values ('0000000016', 'Cassie', 'Hadwick', 'F', '2001/5/31', '8685683957', '3588142697', '001 Ridgeway Center', '2019/4/20','V5X 4J2');
insert into Patient values ('0000000017', 'Trevor', 'Chetwynd', 'M', '1984/1/27', '7416421270', '2550419114', '665 Utah Avenue', '2019/11/8','T2S 0M9');
insert into Patient values ('0000000018', 'Lamar', 'Peckitt', 'M', '2002/7/22', '8297588150', '6359545984', '482 Lindbergh Lane', '2019/7/4','T2T 2T3');
insert into Patient values ('0000000019', 'Emerson', 'Gaynsford', 'M', '2005/10/1', '4820787784', '4201178304', '7909 Clarendon Crossing', '2020/2/9','B3L 1G6');
select * from Patient
GO

GO
CREATE TABLE Hospital(
Hospital_ID VARCHAR(10),
Zip_Code VARCHAR(7) NOT NULL,

CONSTRAINT PK_Hospital PRIMARY KEY(Hospital_ID),
CONSTRAINT FK_Zip_Code FOREIGN KEY (Zip_Code) REFERENCES Address_(Zip_Code)
);
GO

--Constraints
GO
ALTER TABLE Hospital
ADD CONSTRAINT CHK_Hospital_ID
CHECK (Hospital_ID NOT LIKE '%[^A-Z 0-9]%');
GO

--Inserting values
GO
insert into Hospital values ('ON00000011', 'M2R 2R6');
insert into Hospital values ('ON00000022', 'M3J 2V7');
insert into Hospital values ('ON00000033', 'L7C 2H5');
insert into Hospital values ('BC00000011', 'V6M 2V9');
insert into Hospital values ('BC00000022', 'V5X 4J2');
insert into Hospital values ('QC00000011', 'H4V 2A4');
insert into Hospital values ('QC00000022', 'H3G 2A8');
insert into Hospital values ('AB00000011', 'T2S 0M9');
insert into Hospital values ('AB00000022', 'T2T 2T3');
insert into Hospital values ('NS00000011', 'B3L 1G6');
select * from Hospital
GO

GO
CREATE TABLE Hospital_Patient(
Hospital_ID VARCHAR(10) NOT NULL,
Patient_ID DECIMAL(10) NOT NULL,
CONSTRAINT PK_Hospital_Patient PRIMARY KEY
(
    Hospital_ID,
    Patient_ID
),
CONSTRAINT FK_Hospital FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID),
CONSTRAINT FK_Patient FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
)
GO

--Inserting values
GO
insert into Hospital_Patient values ('ON00000011', '0000000010');
insert into Hospital_Patient values ('ON00000022', '0000000011');
insert into Hospital_Patient values ('ON00000033', '0000000012');
insert into Hospital_Patient values ('BC00000011', '0000000015');
insert into Hospital_Patient values ('BC00000022', '0000000016');
insert into Hospital_Patient values ('QC00000011', '0000000013');
insert into Hospital_Patient values ('QC00000022', '0000000014');
insert into Hospital_Patient values ('AB00000011', '0000000017');
insert into Hospital_Patient values ('AB00000022', '0000000018');
insert into Hospital_Patient values ('NS00000011', '0000000019');
select * from Hospital_Patient
GO

GO
CREATE TABLE Room(
Room_ID varchar(8),
R_Number INT,
R_Type CHAR(2), --check
R_Occupancy BIT DEFAULT 0,
Hospital_ID VARCHAR(10),

CONSTRAINT PK_Room PRIMARY KEY (Room_ID),
CONSTRAINT FK_Room_Hospital FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID)
);
GO

--Constraints
GO
ALTER TABLE ROOM
ADD CONSTRAINT CHK_Room_TYPE 
CHECK (R_Type IN ('D','SD','G'))
GO

--Inserting values
GO
insert into Room values ('ON10', 1, 'D',0 , 'ON00000011');
insert into Room values ('ON20', 2, 'D', 1, 'ON00000022');
insert into Room values ('ON30', 3, 'G', 1, 'ON00000033');
insert into Room values ('BC40', 4, 'SD', 0, 'BC00000011');
insert into Room values ('BC50', 5, 'SD', 1, 'BC00000022');
insert into Room values ('QC60', 6, 'D', 0, 'QC00000011');
insert into Room values ('QC70', 7, 'D', 0, 'QC00000011');
insert into Room values ('AB80', 8, 'SD', 0, 'AB00000011');
insert into Room values ('AB90', 9, 'D', 1, 'AB00000011');
insert into Room values ('NS00', 10, 'G', 1, 'NS00000011');
select * from Room
GO


GO
CREATE TABLE Employee(
Employee_ID INT NOT NULL,
E_FName VARCHAR(15) NOT NULL,
E_LName VARCHAR(15) NOT NULL,
E_MInitial CHAR(1),
E_Type CHAR(1) NOT NULL,
E_Sex CHAR(1) NOT NULL,
E_Salary INT NOT NULL,
E_Availability BIT NOT NULL DEFAULT 1,
E_Contact_Number NUMERIC(10) NOT NULL,
E_Address_1 VARCHAR(50) NOT NULL,
Zip_Code varchar(7) NOT NULL,

CONSTRAINT PK_Employee PRIMARY KEY(Employee_ID),
CONSTRAINT FK_Employee_Address FOREIGN KEY (Zip_Code) REFERENCES Address_(Zip_Code),

);
GO

--Constraints
GO
ALTER TABLE Employee
ADD CONSTRAINT CHK_SEX
CHECK (E_Sex IN ('M','F')),

CONSTRAINT CHK_Employee_TYPE
CHECK (E_Type IN ('D','N','T')),

CONSTRAINT CHK_E_Salary 
CHECK (E_Salary >= 2000 AND E_Salary <= 80000);
GO

--Inserting values
GO
insert into Employee values ('10000', 'Melantha', 'Gerold', 'D', 'D', 'F', '35000', 0, '4047109861', '4 Jackson Avenue', 'M2R 2R6');
insert into Employee values ('20000', 'Elbert', 'Armatage', 'T', 'D', 'M', '40000', 0, '8174952468', '2 Center Hill', 'M3J 2V7');
insert into Employee values ('30000', 'Kenon', 'McFie', 'R', 'N', 'M', '15000', 1, '3248376383', '2677 Bartillon Point', 'L7C 2H5');
insert into Employee values ('40000', 'Karolina', 'Van', 'D', 'T', 'F', '10000', 1, '5781282412', '109 South Point', 'V6M 2V9');
insert into Employee values ('50000', 'Jayme', 'Oliver','D', 'T', 'M', '11000', 1, '1027811274', '60891 Moose Circle', 'V5X 4J2');
insert into Employee values ('60000', 'Ermin', 'Schruurs', 'O', 'D', 'M', '75000', 0, '6811487542', '29 Lakewood Point', 'H4V 2A4');
insert into Employee values ('70000', 'Lazaro', 'Vedstra', 'Z', 'N', 'M', '8000', 1, '1692732049', '4 Hovde Road', 'H3G 2A8');
insert into Employee values ('80000', 'Fairleigh', 'Bancroft', 'N', 'T', 'M', '9000', 1, '5959232643', '398 Victoria Crossing', 'T2S 0M9');
insert into Employee values ('90000', 'Berkie', 'Lowth', 'Y', 'D', 'M', '70000', 0, '1119752807', '69875 Wayridge Road', 'T2T 2T3');
insert into Employee values ('10001', 'Stephie', 'Hagston', 'P', 'D', 'F', '65000', 1, '2829208643', '6 Dawn Drive', 'B3L 1G6');
select * from Employee
GO



GO
CREATE TABLE Hospital_Employee(
Hospital_ID VARCHAR(10) NOT NULL,
Employee_ID INT NOT NULL,

CONSTRAINT PK_HOSPITAL_EMPLOYEE PRIMARY KEY(
Hospital_ID,
Employee_ID
),

CONSTRAINT FK_HospitalEmployee_Hospital FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID),
CONSTRAINT FK_HospitalEmployee_Employee FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
GO

--Inserting values
GO
insert into Hospital_Employee values ('ON00000011', '10000');
insert into Hospital_Employee values ('ON00000022', '20000');
insert into Hospital_Employee values ('ON00000033', '30000');
insert into Hospital_Employee values ('BC00000011', '40000');
insert into Hospital_Employee values ('BC00000022', '50000');
insert into Hospital_Employee values ('QC00000011', '60000');
insert into Hospital_Employee values ('QC00000022', '70000');
insert into Hospital_Employee values ('AB00000011', '80000');
insert into Hospital_Employee values ('AB00000022', '90000');
insert into Hospital_Employee values ('NS00000011', '10001');
select * from Hospital_Employee
GO

GO
CREATE TABLE Nurse(
Nurse_ID VARCHAR(10) NOT NULL,
Employee_ID INT NOT NULL,

CONSTRAINT PK_Nurse PRIMARY KEY (Nurse_ID),
CONSTRAINT FK_Nurse_Employee FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
GO

--Constraints
GO
ALTER TABLE Nurse
ADD CONSTRAINT CHK_Nurse_ID
CHECK (Nurse_ID NOT LIKE '%[^A-Z 0-9]%');
GO

--Inserting values
GO
insert into Nurse values ('ON00000111', '30000');
insert into Nurse values ('QC00000111', '70000');
select * from Nurse
GO


GO
CREATE TABLE Trainee(
Trainee_ID VARCHAR(10) NOT NULL,
T_Type VARCHAR(15) NOT NULL,
Employee_ID INT NOT NULL,

CONSTRAINT PK_Trainee PRIMARY KEY (Trainee_ID),
CONSTRAINT FK_Trainee_Nurse FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
GO

--Constraint
GO
ALTER TABLE Trainee
ADD CONSTRAINT CHK_Trainee_ID
CHECK (Trainee_ID NOT LIKE '%[^A-Z 0-9]%');
GO

--Inseting values
GO
insert into Trainee values ('BC00000111', 'Beginnner', '40000');
insert into Trainee values ('BC00000222', 'Expert', '50000');
insert into Trainee values ('AB00000111', 'Intermediate', '80000');
select * from Trainee
GO


GO
CREATE TABLE DOCTOR(
Doctor_ID VARCHAR(10) NOT NULL,
D_Speciality VARCHAR(15) NOT NULL,
Employee_ID int NOT NULL,

CONSTRAINT PK_Doctor PRIMARY KEY (Doctor_ID),
CONSTRAINT FK_Employee FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
);
GO

--Inserting values
GO
insert into DOCTOR values ('ON00000222', 'Heart', '10000');
insert into DOCTOR values ('ON00000333', 'Arthrities', '20000');
insert into DOCTOR values ('QC00000222', 'Diabities', '60000');
insert into DOCTOR values ('AB00000222', 'Gynacology', '90000');
insert into DOCTOR values ('NS00000111', 'Cardiologists', '10001');
select * from DOCTOR
GO


GO
CREATE TABLE Medicine(
Medicine_ID VARCHAR(20),
M_Name VARCHAR(15) NOT NULL,
M_Price INT NOT NULL,
M_Quantity INT NOT NULL,

CONSTRAINT PK_Medicine PRIMARY KEY (Medicine_ID)
);
GO

--Inserting values
GO
insert into Medicine values ('ER00', 'Eryc', '10', 100);
insert into Medicine values ('KI00', 'Kineret', '15', 75);
insert into Medicine values ('KE00', 'Keflex ', '27', 39);
insert into Medicine values ('SE00', 'Seward', '21', 45);
insert into Medicine values ('FE00', 'Fenofibrate', '8', 59);
insert into Medicine values ('SA00', 'Sam', '13', 60);
insert into Medicine values ('KA00', 'Kadian', '5', 70);
insert into Medicine values ('GU00', 'Gunar', '19', 80);
insert into Medicine values ('CO00', 'Codeine', '17', 90);
insert into Medicine values ('MA00', 'Macugen', '6', 110);
select * from Medicine
GO


GO
CREATE TABLE Invoice(
Invoice_ID VARCHAR(15) NOT NULL,
Payment_Type VARCHAR(15) NOT NULL,
Payment_Status BIT NOT NULL DEFAULT 0,
Payment_Amount INT NOT NULL,
Payment_Date DATE NOT NULL,

CONSTRAINT PK_Invoice PRIMARY KEY (Invoice_ID),
);
GO

--Constraint
GO
ALTER TABLE Invoice
ADD CONSTRAINT CHK_Payment_Date
CHECK (Payment_Date <= GETDATE()); 
GO

--Inserting value
GO
insert into Invoice values ('5096363007', 'Cash', 0, '789', '2019/4/14');
insert into Invoice values ('3403356922', 'Cash', 1, '636', '2019/11/8');
insert into Invoice values ('9037820425', 'Cash', 0, '734', '2019/8/4');
insert into Invoice values ('3282474857', 'Debit', 1, '145', '2019/12/7');
insert into Invoice values ('9178383390', 'Debit', 0, '22', '2020/3/3');
insert into Invoice values ('4085249509', 'Debit', 0, '580', '2019/5/6');
insert into Invoice values ('3677986516', 'Visa', 0, '19', '2019/11/21');
insert into Invoice values ('8015494656', 'Visa', 1, '497', '2015/6/8');
insert into Invoice values ('7729358700', 'Master', 0, '23', '2019/4/25');
insert into Invoice values ('6823866918', 'Master', 1, '17', '2010/12/13');
select * from Invoice
GO


GO
CREATE TABLE Invoice_Medicine(
Invoice_ID VARCHAR(15) NOT NULL,
Medicine_ID VARCHAR(20) NOT NULL,
CONSTRAINT PK_Invoice_Medicine PRIMARY KEY(
	Invoice_ID,
	Medicine_ID
	),

CONSTRAINT FK_InvoiceMedicine_Invoice FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID),
CONSTRAINT FK_InvoiceMedicine_Medicine FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID)
);
GO

--Inserting values
GO
insert into Invoice_Medicine values ('5096363007', 'ER00');
insert into Invoice_Medicine values ('3403356922', 'KI00');
insert into Invoice_Medicine values ('9037820425', 'KE00');
insert into Invoice_Medicine values ('3282474857', 'SE00');
insert into Invoice_Medicine values ('9178383390', 'FE00');
insert into Invoice_Medicine values ('4085249509', 'SA00');
insert into Invoice_Medicine values ('3677986516', 'KA00');
insert into Invoice_Medicine values ('8015494656', 'GU00');
insert into Invoice_Medicine values ('7729358700', 'CO00');
insert into Invoice_Medicine values ('6823866918', 'MA00');
select * from Invoice_Medicine
GO


GO
CREATE TABLE Record(
Record_ID VARCHAR(10),
Admit_Time TIME NOT NULL,
Discharge_Time TIME NOT NULL,
Patient_ID DECIMAL(10) NOT NULL,
Nurse_ID VARCHAR(10) NOT NULL,
Room_ID VARCHAR(8)  NOT NULL,
Invoice_ID VARCHAR(15) NOT NULL,

CONSTRAINT PK_Record PRIMARY KEY (Record_ID),
CONSTRAINT FK_Record_Patient FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
CONSTRAINT FK_Record_Nurse FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Nurse_ID),
CONSTRAINT FK_Record_Room FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
CONSTRAINT FK_Record_Invoice FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID),
);
GO

--Constraints
GO
ALTER TABLE Record
ADD CONSTRAINT CHK_Admit_Time_Discharge_Time
CHECK (Discharge_Time > Admit_Time);
GO

--Inserting values
GO
insert into Record values ('25011189ON', '2:50', '4:55', '0000000010', 'ON00000111', 'ON10', '5096363007');
insert into Record values ('79615512ON', '5:48', '8:32', '0000000011', 'ON00000111', 'ON20', '3403356922');
insert into Record values ('79062365ON', '10:01', '12:39', '0000000012', 'ON00000111', 'ON30', '9037820425');
insert into Record values ('90248122BC', '2:43', '10:19', '0000000013', 'ON00000111', 'BC40', '3282474857');
insert into Record values ('98493358BC', '6:05', '9:15 ', '0000000014', 'ON00000111', 'BC50', '9178383390');
insert into Record values ('81922465QC', '6:52', '11:50', '0000000015', 'ON00000111', 'QC60', '4085249509');
insert into Record values ('79917129QC', '4:07', '10:14', '0000000016', 'QC00000111', 'QC70', '3677986516');
insert into Record values ('09048824AB', '9:25', '12:30', '0000000017', 'QC00000111', 'AB80', '8015494656');
insert into Record values ('35253991AB', '12:21', '18:51', '0000000018', 'QC00000111', 'AB90', '7729358700');
insert into Record values ('34170413NS', '10:36', '20:05 ', '0000000019', 'QC00000111', 'NS00', '6823866918');
select * from Record
GO

GO
CREATE TABLE Patient_Record(
Patient_ID DECIMAL(10) NOT NULL,
Record_ID varchar(10) not null,
CONSTRAINT PK_Patient_Record PRIMARY KEY(
	Patient_ID,
	Record_ID
	),
CONSTRAINT FK_PatintRecord_Patient FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
CONSTRAINT FK_PatientRecord_Record FOREIGN KEY (Record_ID) REFERENCES Record(Record_ID)
);
GO

--Inserting values
GO
insert into Patient_Record values ('0000000010', '25011189ON');
insert into Patient_Record values ('0000000011', '79615512ON');
insert into Patient_Record values ('0000000012', '79062365ON');
insert into Patient_Record values ('0000000013', '90248122BC');
insert into Patient_Record values ('0000000014', '98493358BC');
insert into Patient_Record values ('0000000015', '81922465QC');
insert into Patient_Record values ('0000000016', '79917129QC');
insert into Patient_Record values ('0000000017', '09048824AB');
insert into Patient_Record values ('0000000018', '35253991AB');
insert into Patient_Record values ('0000000019', '34170413NS');
select * from Patient_Record
GO


GO
CREATE TABLE Doctor_Record(
Doctor_ID VARCHAR(10) NOT NULL,
Record_ID VARCHAR(10) not null,
CONSTRAINT PK_Doctor_Record PRIMARY KEY(
	Doctor_ID,
	Record_ID
	),
CONSTRAINT FK_DoctorRecord_Doctor FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
CONSTRAINT FK_DoctorRecord_Record FOREIGN KEY (Record_ID) REFERENCES Record(Record_ID)
);
GO

--Inserting values
GO
insert into Doctor_Record values ('ON00000222', '25011189ON');
insert into Doctor_Record values ('ON00000222', '79615512ON');
insert into Doctor_Record values ('ON00000333', '79062365ON');
insert into Doctor_Record values ('ON00000333', '90248122BC');
insert into Doctor_Record values ('QC00000222', '98493358BC');
insert into Doctor_Record values ('QC00000222', '81922465QC');
insert into Doctor_Record values ('QC00000222', '79917129QC');
insert into Doctor_Record values ('AB00000222', '09048824AB');
insert into Doctor_Record values ('AB00000222', '35253991AB');
insert into Doctor_Record values ('NS00000111', '34170413NS');
select * from Doctor_Record
GO

GO
CREATE TABLE Nurse_Record(
Nurse_ID VARCHAR(10) NOT NULL,
Record_ID VARCHAR(10) NOT NULL,
CONSTRAINT PK_Nurse_Record PRIMARY KEY(
	Nurse_ID,
	Record_ID
	),
CONSTRAINT FK_NurseRecord_Nurse FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Nurse_ID),
CONSTRAINT FK_NurseRecord_Record FOREIGN KEY (Record_ID) REFERENCES Record(Record_ID)
)
GO

--Inserting values
GO
insert into Nurse_Record values ('ON00000111', '25011189ON');
insert into Nurse_Record values ('ON00000111', '79615512ON');
insert into Nurse_Record values ('ON00000111', '79062365ON');
insert into Nurse_Record values ('ON00000111', '90248122BC');
insert into Nurse_Record values ('ON00000111', '98493358BC');
insert into Nurse_Record values ('ON00000111', '81922465QC');
insert into Nurse_Record values ('ON00000111', '79917129QC');
insert into Nurse_Record values ('QC00000111', '09048824AB');
insert into Nurse_Record values ('QC00000111', '35253991AB');
insert into Nurse_Record values ('QC00000111', '34170413NS');
select * from Nurse_Record
GO