--mysql -u root -p

mysql> show databases;

mysql> CREATE DATABASE hcltestdb;

SHOW CREATE DATABASE hcltestdb;

USE hcltestdb;


CREATE TABLE Portfolio (
    CustomerID varchar(255) NOT NULL,
    CustomerName varchar(255) NOT NULL,
    PortfolioNumber varchar(255) NOT NULL,
    PortfolioValue DECIMAL(10,2) NOT NULL,
	CurrentPerformance DOUBLE(5,2),
	InvestmentStrategy varchar(255), 
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Instruments (
    InstrumentID int NOT NULL,
    InstrumentName varchar(255) NOT NULL,
    InstrumentValue DECIMAL(10,2) NOT NULL,
    InstrumentType varchar(255) NOT NULL,
    PRIMARY KEY (InstrumentID)
);

CREATE TABLE Positions (
    PositionID int NOT NULL,
    TradeType varchar(255) NOT NULL,
    Units int NOT NULL,
    TradeValue DECIMAL(10,2) NOT NULL,
	TransactionRef varchar(255) NOT NULL,
	InstrumentID int NOT NULL,
	CustomerID varchar(255) NOT NULL,
    PRIMARY KEY (PositionID),
	FOREIGN KEY (InstrumentID) REFERENCES Instruments(InstrumentID),
	FOREIGN KEY (CustomerID) REFERENCES Portfolio(CustomerID)
);


CREATE TABLE Audit (
    AuditID int NOT NULL,
    TransactionRef varchar(255) NOT NULL,
    InstrumentID int NOT NULL,
    InstrumentName varchar(255) NOT NULL,
	TradeType varchar(255) NOT NULL,
	AuditDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (AuditID)
);

ALTER TABLE Audit
ADD CustomerID varchar(255);

INSERT INTO Instruments (InstrumentID, InstrumentName, InstrumentValue, InstrumentType)
VALUES (1, 'Apple', '1000.00', 'Digital	Asset');

INSERT INTO Instruments (InstrumentID, InstrumentName, InstrumentValue, InstrumentType)
VALUES (2, 'SBI', '1000.00', 'Bond');

INSERT INTO Instruments (InstrumentID, InstrumentName, InstrumentValue, InstrumentType)
VALUES (3, 'Prestiage', '1000.00', 'Real	Estate');
/




