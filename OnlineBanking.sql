USE master; 
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'OnlineBanking')
BEGIN
    CREATE DATABASE OnlineBanking;
END
GO

USE OnlineBanking; 
GO

IF OBJECT_ID('dbo.[Customer]', 'U') IS NOT NULL
    DROP TABLE dbo.[Customer];
CREATE TABLE [Customer] (
  [CustomerId] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [FirstName] varchar(100),
  [MiddleName] varchar(100),
  [LastName] varchar(100),
  [Email] varchar(100),
  [LoginName] varchar(100),
  [Password] varchar(50),
  [Phone] varchar(10),
  [IdNumber] varchar(50),
  [Address] varchar(100),
  [PasswordTransaction] varchar(100),
  [flag] bit
)
GO

IF OBJECT_ID('dbo.[Policy]', 'U') IS NOT NULL
    DROP TABLE dbo.[Policy];
CREATE TABLE [Policy] (
  [PolicyId] integer IDENTITY(1,1) PRIMARY KEY,
  [PolicyName] varchar(100),
  [PolicyRule] varchar(100),
  [flag] bit
)
GO

IF OBJECT_ID('dbo.[Logging]', 'U') IS NOT NULL
    DROP TABLE dbo.[Logging];
CREATE TABLE [Logging] (
  [LoggingId] integer IDENTITY(1,1) PRIMARY KEY,
  [CustomerId] integer,
  [Action] varchar(max),
  [flag] bit
)
GO

IF OBJECT_ID('dbo.[Account]', 'U') IS NOT NULL
    DROP TABLE dbo.[Account];
CREATE TABLE [Account] (
  [AccountId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountNumber] varchar(100),
  [Balance] float,
  [CustomerId] integer,
  [AccountOpenDate] datetime,
  [BranchId] integer,
  [flag] bit,
  CONSTRAINT FK_Account_Customer FOREIGN KEY ([CustomerId]) REFERENCES [Customer] ([CustomerId])
)
GO

IF OBJECT_ID('dbo.[Bank]', 'U') IS NOT NULL
    DROP TABLE dbo.[Bank];
CREATE TABLE [Bank] (
  [BankId] integer IDENTITY(1,1) PRIMARY KEY,
  [BankName] varchar(100),
  [flag] bit
)
GO

IF OBJECT_ID('dbo.[Branch]', 'U') IS NOT NULL
    DROP TABLE dbo.[Branch];
CREATE TABLE [Branch] (
  [BranchId] integer PRIMARY KEY,
  [BankId] integer,
  [BranchName] varchar(100),
  [flag] bit,
  CONSTRAINT FK_Branch_Bank FOREIGN KEY ([BankId]) REFERENCES [Bank] ([BankId])
)
GO

IF OBJECT_ID('dbo.[Transactions]', 'U') IS NOT NULL
    DROP TABLE dbo.[Transactions];
CREATE TABLE [Transactions] (
  [TransactionId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountIdSent] integer,
  [AccountIdReceive] integer,
  [Total] integer,
  [TransactionDate] datetime,
  [Description] varchar(max),
  [TransactionCode] integer,
  [Status] varchar(100),
  [flag] bit
)
GO

IF OBJECT_ID('dbo.[check]', 'U') IS NOT NULL
    DROP TABLE dbo.[check];
CREATE TABLE [check] (
  [chequeId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountIdSent] integer,
  [AccountIdReceive] integer,
  [total] integer,
  [checkDate] datetime,
  [Status] varchar(100),
  [flag] bit,
  CONSTRAINT FK_check_Transactions_AccountIdSent FOREIGN KEY ([AccountIdSent]) REFERENCES [Transactions] ([TransactionId]),
  CONSTRAINT FK_check_Transactions_AccountIdReceive FOREIGN KEY ([AccountIdReceive]) REFERENCES [Transactions] ([TransactionId])
)
GO

IF OBJECT_ID('dbo.[Message]', 'U') IS NOT NULL
    DROP TABLE dbo.[Message];
CREATE TABLE [Message] (
  [MessageId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountId] integer,
  [MessageTitle] varchar(max),
  [MessageContent] varchar(max),
  [flag] bit,
  CONSTRAINT FK_Message_Account FOREIGN KEY ([AccountId]) REFERENCES [Account] ([AccountId])
)
GO

IF OBJECT_ID('dbo.[Admin]', 'U') IS NOT NULL
    DROP TABLE dbo.[Admin];
CREATE TABLE [Admin] (
  [AdminId] integer IDENTITY(1,1) PRIMARY KEY,
  [AdminName] varchar(50),
  [Password] varchar(50),
  [FirstName] varchar(50),
  [LastName] varchar(50),
  [Email] varchar(100),
  [Role] varchar(100),
  [flag] bit
)
GO
