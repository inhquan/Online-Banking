USE OnlineBanking;

CREATE TABLE [Customer] (
  [CustomerId] int IDENTITY not null PRIMARY KEY,
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

CREATE TABLE [Policy] (
  [PolicyId] integer IDENTITY(1,1) PRIMARY KEY,
  [PolicyName] varchar(100),
  [PolicyRule] varchar(100),
  [flag] bit
)
GO

CREATE TABLE [Logging] (
  [LoggingId] integer IDENTITY(1,1) PRIMARY KEY,
  [CustomerId] integer,
  [Action] varchar(max),
  [flag] bit
)
GO

CREATE TABLE [Account] (
  [AccountId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountNumber] varchar(100),
  [Balance] float,
  [CustomerId] integer,
  [AccountOpenDate] datetime,
  [BranchId] integer,
  [flag] bit
)
GO

CREATE TABLE [Branch] (
  [BranchId] integer IDENTITY(1,1) PRIMARY KEY,
  [BankId] integer,
  [BrachName] varchar(100),
  [flag] bit
)
GO

CREATE TABLE [Bank] (
  [BankId] integer IDENTITY(1,1) PRIMARY KEY,
  [BankName] varchar(100),
  [flag] bit
)
GO

CREATE TABLE [Transaction] (
  [TransactionId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountIdSent] integer,
  [AccountIdRecive] integer,
  [Total] integer,
  [TransactionDate] datetime,
  [Desciption] varchar(max),
  [TransactionCode] integer,
  [Status] varchar(100),
  [flag] bit
)
GO

CREATE TABLE [check] (
  [chequeId] integer IDENTITY not null PRIMARY KEY,
  [AccountIdSent] integer,
  [AccountIdRecive] integer,
  [total] integer,
  [checkDate] datetime,
  [Status] varchar(100),
  [flag] bit
)
GO

CREATE TABLE [Message] (
  [MessageId] integer IDENTITY(1,1) PRIMARY KEY,
  [AccountId] integer,
  [MessageTitle] varchar(max),
  [MessageContent] varchar(max),
  [flag] bit
)
GO

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
