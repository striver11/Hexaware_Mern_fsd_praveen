create database Vehicle_Insurance_System;
use Vehicle_Insurance_System;



-- User Registration and Login
CREATE TABLE Users (
    UserID INT  PRIMARY KEY,
    Name VARCHAR(255) not null,
    Address VARCHAR(255) not null,
    DateOfBirth DATE not null,
    AadhaarNumber VARCHAR(12) UNIQUE not null,
    Age INT not null,
    PANNumber VARCHAR(10) UNIQUE ,
    Email VARCHAR(255) UNIQUE not null,
    Password VARCHAR(255) not null
);
DELIMITER $$

CREATE TRIGGER CalculateAgeTrigger BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    SET NEW.Age = YEAR(CURRENT_DATE()) - YEAR(NEW.DateOfBirth) - 
                  (DATE_FORMAT(CURRENT_DATE(), '%m%d') < DATE_FORMAT(NEW.DateOfBirth, '%m%d'));
END$$

DELIMITER ;


-- User Dashboard and Policy Proposal
CREATE TABLE PolicyProposals (
    ProposalID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    VehicleType ENUM('car', 'bike', 'camper van'),
    ProposalStatus ENUM('submitted', 'under review', 'approved', 'rejected'),
    DateSubmitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE PolicyDocuments (
    DocumentID INT AUTO_INCREMENT PRIMARY KEY,
    ProposalID INT,
    DocumentType VARCHAR(255),
    DocumentPath VARCHAR(255),
    DateSubmitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProposalID) REFERENCES PolicyProposals(ProposalID)
);


CREATE TABLE Policies (
    PolicyID INT AUTO_INCREMENT PRIMARY KEY,
    ProposalID INT,
    PolicyStatus ENUM('active', 'expired'),
    Quote DECIMAL(10,2),
    DateIssued TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProposalID) REFERENCES PolicyProposals(ProposalID)
);

-- Officer Dashboard and Policy Management
CREATE TABLE Officer (
    OfficerID INT  PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ProposalID INT,
    AmountPaid DECIMAL(10,2),
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProposalID) REFERENCES PolicyProposals(ProposalID)
);


INSERT INTO Users (UserID, Name, Address, DateOfBirth, AadhaarNumber, PANNumber, Email, Password)
VALUES
(1, 'Ramesh Kumar', '123 Main Street, Bangalore', '1990-05-15', '123456789012', 'ABCDE1234F', 'ramesh@example.com', 'password123'),
(2, 'Sunita Sharma', '456 Park Avenue, Mumbai', '1985-08-25', '234567890123', 'BCDE1234G', 'sunita@example.com', 'password456'),
(3, 'Amit Patel', '789 Broad Street, Delhi', '1995-03-10', '345678901234', 'CDE1234H', 'amit@example.com', 'password789'),
(4, 'Priya Singh', '101 Oak Lane, Kolkata', '1980-11-30', '456789012345', 'DE1234I', 'priya@example.com', 'passwordabc'),
(5, 'Rajesh Tiwari', '321 Elm Street, Chennai', '1987-07-20', '567890123456', 'E1234JK', 'rajesh@example.com', 'passworddef'),
(6, 'Anita Reddy', '567 Pine Street, Hyderabad', '1992-01-05', '678901234567', 'F1234LM', 'anita@example.com', 'passwordghi'),
(7, 'Sanjay Gupta', '876 Maple Street, Bangalore', '1978-09-12', '789012345678', 'G1234NO', 'sanjay@example.com', 'passwordjkl'),
(8, 'Neha Verma', '432 Cedar Street, Mumbai', '1983-04-18', '890123456789', 'H1234PQ', 'neha@example.com', 'passwordmno'),
(9, 'Deepak Jain', '654 Birch Street, Delhi', '1998-06-25', '901234567890', 'I1234RS', 'deepak@example.com', 'passwordpqr'),
(10, 'Kavita Desai', '789 Aspen Street, Kolkata', '1975-10-08', '012345678901', 'J1234TU', 'kavita@example.com', 'passwordstu');



INSERT INTO PolicyProposals (UserID, VehicleType, ProposalStatus)
VALUES
(1, 'car', 'submitted'),
(2, 'bike', 'submitted'),
(3, 'camper van', 'submitted'),
(4, 'car', 'submitted'),
(5, 'bike', 'submitted'),
(6, 'camper van', 'submitted'),
(7, 'car', 'submitted'),
(8, 'bike', 'submitted'),
(9, 'camper van', 'submitted'),
(10, 'car', 'submitted');



INSERT INTO PolicyDocuments (ProposalID, DocumentType, DocumentPath)
VALUES
(1, 'Insurance Certificate', '/path/to/insurance_certificate_1.pdf'),
(2, 'Registration Document', '/path/to/registration_document_2.pdf'),
(3, 'Insurance Certificate', '/path/to/insurance_certificate_3.pdf'),
(4, 'Registration Document', '/path/to/registration_document_4.pdf'),
(5, 'Insurance Certificate', '/path/to/insurance_certificate_5.pdf'),
(6, 'Registration Document', '/path/to/registration_document_6.pdf'),
(7, 'Insurance Certificate', '/path/to/insurance_certificate_7.pdf'),
(8, 'Registration Document', '/path/to/registration_document_8.pdf'),
(9, 'Insurance Certificate', '/path/to/insurance_certificate_9.pdf'),
(10, 'Registration Document', '/path/to/registration_document_10.pdf');


INSERT INTO Policies (ProposalID, PolicyStatus, Quote) 
VALUES 
(1, 'active', 15000.00),
(2, 'active', 18000.00),
(3, 'expired', 13500.00),
(4, 'active', 20000.00),
(5, 'expired', 15500.00),
(6, 'active', 22000.00),
(7, 'active', 18000.00),
(8, 'expired', 15000.00),
(9, 'active', 17500.00),
(10, 'expired', 18000.00);


INSERT INTO Officer (OfficerID, Name, Email, Password) 
VALUES 
(1, 'Rahul Sharma', 'rahul@example.com', 'password123'),
(2, 'Priya Patel', 'priya@example.com', 'securepwd456'),
(3, 'Amit Gupta', 'amit@example.com', 'pass123'),
(4, 'Neha Singh', 'neha@example.com', 'abc123'),
(5, 'Ravi Verma', 'ravi@example.com', 'password456'),
(6, 'Sneha Reddy', 'sneha@example.com', 'securepwd789'),
(7, 'Vivek Kumar', 'vivek@example.com', 'pass789'),
(8, 'Deepika Choudhary', 'deepika@example.com', 'abc456'),
(9, 'Manoj Sharma', 'manoj@example.com', 'password789'),
(10, 'Pooja Gupta', 'pooja@example.com', 'securepwd123');



INSERT INTO Payments (ProposalID, AmountPaid) 
VALUES 
(1, 15000.00),
(2, 18000.00),
(3, 13500.00),
(4, 20000.00),
(5, 15500.00),
(6, 22000.00),
(7, 18000.00),
(8, 15000.00),
(9, 17500.00),
(10, 18000.00);


-- drop database Vehicle_Insurance_System;