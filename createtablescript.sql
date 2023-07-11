CREATE TABLE UserMaster (
  UserID INT PRIMARY KEY AUTO_INCREMENT,
  Username VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255),
  CreatedAt DATETIME,
  UpdatedAt DATETIME
);

CREATE TABLE BookMaster (
  BookID INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(255),
  Author VARCHAR(255),
  Genre VARCHAR(255),
  Description TEXT,
  `Condition` VARCHAR(255),
  UserID INT,
  CreatedAt DATETIME,
  UpdatedAt DATETIME,
  FOREIGN KEY (UserID) REFERENCES UserMaster(UserID)
);

CREATE TABLE ExchangeRequestMaster (
  RequestID INT PRIMARY KEY AUTO_INCREMENT,
  FromUserID INT,
  ToUserID INT,
  BookID INT,
  Message TEXT,
  Status VARCHAR(255),
  CreatedAt DATETIME,
  UpdatedAt DATETIME,
  FOREIGN KEY (FromUserID) REFERENCES UserMaster(UserID),
  FOREIGN KEY (ToUserID) REFERENCES UserMaster(UserID),
  FOREIGN KEY (BookID) REFERENCES BookMaster(BookID)
);

CREATE TABLE ReviewMaster (
  ReviewID INT PRIMARY KEY AUTO_INCREMENT,
  BookID INT,
  UserID INT,
  Rating INT,
  Comment TEXT,
  CreatedAt DATETIME,
  UpdatedAt DATETIME,
  FOREIGN KEY (BookID) REFERENCES BookMaster(BookID),
  FOREIGN KEY (UserID) REFERENCES UserMaster(UserID)
);

CREATE TABLE AdminMaster (
  AdminID INT PRIMARY KEY AUTO_INCREMENT,
  Username VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255),
  CreatedAt DATETIME,
  UpdatedAt DATETIME
);

CREATE TABLE ReportedListingMaster (
  ReportID INT PRIMARY KEY AUTO_INCREMENT,
  ListingID INT,
  ReporterUserID INT,
  ReportedAt DATETIME,
  Description TEXT,
  FOREIGN KEY (ListingID) REFERENCES BookMaster(BookID),
  FOREIGN KEY (ReporterUserID) REFERENCES UserMaster(UserID)
);

CREATE TABLE ReportedUserMaster (
  ReportID INT PRIMARY KEY AUTO_INCREMENT,
  UserID INT,
  ReporterUserID INT,
  ReportedAt DATETIME,
  Description TEXT,
  FOREIGN KEY (UserID) REFERENCES UserMaster(UserID),
  FOREIGN KEY (ReporterUserID) REFERENCES UserMaster(UserID)
);
