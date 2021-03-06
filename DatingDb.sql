USE [master]
GO
/****** Object:  Database [DatingDb]    Script Date: 3/6/2022 2:11:44 PM ******/
CREATE DATABASE [DatingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatingDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DatingDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatingDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\DatingDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatingDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatingDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatingDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatingDb] SET  MULTI_USER 
GO
ALTER DATABASE [DatingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatingDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DatingDb]
GO
/****** Object:  Table [dbo].[DatePlan]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatePlan](
	[PlanId] [int] IDENTITY(1,1) NOT NULL,
	[DateId] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[InTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_DatePlan] PRIMARY KEY CLUSTERED 
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateRequest]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateRequest](
	[DateId] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[RequestStatus] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[ReqTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_DateRequest] PRIMARY KEY CLUSTERED 
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeUser]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeUser](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[RequestStatus] [int] NULL,
	[FriendStatus] [int] NULL,
	[ReqTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LikeUser_1] PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Picture] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Occupation] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Height] [nvarchar](max) NULL,
	[Weight] [nvarchar](max) NULL,
	[Interest] [nvarchar](max) NULL,
	[Likes] [nvarchar](max) NULL,
	[DisLikes] [nvarchar](max) NULL,
	[Goals] [nvarchar](max) NULL,
	[Commitment] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Restaurants] [nvarchar](max) NULL,
	[Movies] [nvarchar](max) NULL,
	[Books] [nvarchar](max) NULL,
	[Peoms] [nvarchar](max) NULL,
	[Saying] [nvarchar](max) NULL,
	[Contact] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Visibility] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[RegTime] [nvarchar](max) NULL,
	[UserStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetCrushList]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCrushList]
@UserId nvarchar(max)
AS
SET NOCOUNT ON
SELECT A.* FROM (SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus,UserDetails.Picture, UserDetails.Age, UserDetails.City, UserDetails.State, UserDetails.Description,LikeUser.SenderId,LikeUser.ReceiverId,LikeUser.FriendStatus
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId INNER JOIN
                         LikeUser ON Users.UserId = LikeUser.ReceiverId   
						 UNION 
						 SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus,UserDetails.Picture, UserDetails.Age, UserDetails.City, UserDetails.State, UserDetails.Description,LikeUser.SenderId,LikeUser.ReceiverId,LikeUser.FriendStatus
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId INNER JOIN
                         LikeUser ON Users.UserId = LikeUser.SenderId )A WHERE (A.ReceiverId=@UserId OR A.SenderId=@UserId) AND A.FriendStatus=1

						 EXCEPT

						  SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus,UserDetails.Picture, UserDetails.Age, UserDetails.City, UserDetails.State, UserDetails.Description,LikeUser.SenderId,LikeUser.ReceiverId,LikeUser.FriendStatus
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId INNER JOIN
                         LikeUser ON Users.UserId = LikeUser.ReceiverId WHERE USERs.UserId=@UserId
						 
						 EXCEPT

						  SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus,UserDetails.Picture, UserDetails.Age, UserDetails.City, UserDetails.State, UserDetails.Description,LikeUser.SenderId,LikeUser.ReceiverId,LikeUser.FriendStatus
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId INNER JOIN
                         LikeUser ON Users.UserId = LikeUser.SenderId WHERE USERs.UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[GetDateRequest]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDateRequest]
@ReceiverId nvarchar(max)

AS
SET NOCOUNT ON

SELECT        DateRequest.DateId, DateRequest.SenderId, DateRequest.ReceiverId, DateRequest.RequestStatus, DateRequest.Status, DateRequest.ReqTime, Users.FullName SenderName, UserDetails.Picture SenderPicture
FROM            DateRequest INNER JOIN
                         Users ON DateRequest.SenderId = Users.UserId INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId WHERE DateRequest.ReceiverId=@ReceiverId
						 UNION
						 
						 SELECT        DateRequest.DateId, DateRequest.SenderId, DateRequest.ReceiverId, DateRequest.RequestStatus, DateRequest.Status, DateRequest.ReqTime, Users.FullName SenderName, UserDetails.Picture SenderPicture
FROM            DateRequest INNER JOIN
                         Users ON DateRequest.SenderId = Users.UserId INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId WHERE DateRequest.SenderId=@ReceiverId ORDER By DateRequest.DateId DESC

 
GO
/****** Object:  StoredProcedure [dbo].[GetRequestedList]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRequestedList]
@ReceiverId nvarchar(max)
AS
SET NOCOUNT ON
SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus,UserDetails.Picture, UserDetails.Age, UserDetails.City, UserDetails.State, UserDetails.Description
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId INNER JOIN
                         LikeUser ON Users.UserId = LikeUser.SenderId WHERE LikeUser.ReceiverId=@ReceiverId AND LikeUser.FriendStatus=0 ORDER BY  LikeUser.LikeId DESC
GO
/****** Object:  StoredProcedure [dbo].[InsertUserDetails]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUserDetails]
@UserId int,
@Picture nvarchar(max),
@Gender nvarchar(max),
@Occupation nvarchar(max),
@Age int,
@Height nvarchar(max),
@Weight nvarchar(max),
@Interest nvarchar(max),
@Likes nvarchar(max),
@DisLikes nvarchar(max),
@Goals nvarchar(max),
@Commitment nvarchar(max),
@Description nvarchar(max),
@Restaurants nvarchar(max),
@Movies nvarchar(max),
@Books nvarchar(max),
@Peoms nvarchar(max),
@Saying nvarchar(max),
@Contact nvarchar(max),
@Address nvarchar(max),
@City nvarchar(max),
@State nvarchar(max),
@Visibility nvarchar(max)

AS
BEGIN
SET NOCOUNT ON
INSERT INTO UserDetails(UserId,Picture,Gender,Occupation,Age,Height,Weight,Interest,Likes,DisLikes,Goals,Commitment,Description,Restaurants,Movies,Books,Peoms,Saying,Contact,Address,City,State,Visibility) VALUES(@UserId,@Picture,@Gender,@Occupation,@Age,@Height,@Weight,@Interest,@Likes,@DisLikes,@Goals,@Commitment,@Description,@Restaurants,@Movies,@Books,@Peoms,@Saying,@Contact,@Address,@City,@State,@Visibility)
END 
GO
/****** Object:  StoredProcedure [dbo].[PlanForDate]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PlanForDate]
@DateId nvarchar(max),
@Date nvarchar(max),
@Time nvarchar(max),
@Description nvarchar(max),
@InTime nvarchar(max)

AS
SET NOCOUNT ON
  INSERT INTO DatePlan(DateId,Date,Time,Description,InTime) VALUES(@DateId,@Date,@Time,@Description,@InTime)
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterUser]   
@UserId int,
    @UserName nvarchar(max),   
    @FullName nvarchar(max),   
    @Email nvarchar(max),   
    @Password nvarchar(max),   
    @RegTime nvarchar(max), 
    @UserStatus nvarchar(max) 
AS   
SET NOCOUNT ON
  INSERT INTO Users(UserId,UserName,FullName,Email,Password,RegTime,UserStatus) VALUES(@UserId,@UserName,@FullName,@Email,@Password,@RegTime,@UserStatus)    
GO
/****** Object:  StoredProcedure [dbo].[SearchProfile]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchProfile]
@UserId nvarchar(max),
@Gender nvarchar(max),
@Age1 nvarchar(max),
@Age2 nvarchar(max),
@Commitment nvarchar(max),
@City nvarchar(max),
@State nvarchar(max) 

AS

SET NOCOUNT ON
SELECT        Users.UserId, Users.UserName, Users.FullName, Users.Email, Users.Password, Users.RegTime, Users.UserStatus, UserDetails.Picture, UserDetails.Occupation, UserDetails.Gender, UserDetails.Age, UserDetails.Height, 
                         UserDetails.Interest, UserDetails.Weight, UserDetails.Likes, UserDetails.DisLikes, UserDetails.Goals, UserDetails.Commitment, UserDetails.Description, UserDetails.Restaurants, UserDetails.Movies, UserDetails.Books, 
                         UserDetails.Peoms, UserDetails.Saying, UserDetails.Contact, UserDetails.Address, UserDetails.City, UserDetails.State, UserDetails.Visibility
FROM            Users INNER JOIN
                         UserDetails ON Users.UserId = UserDetails.UserId WHERE UserDetails.Gender=@Gender AND UserDetails.Age BETWEEN @Age1 AND @Age2 AND UserDetails.Commitment=@Commitment AND UserDetails.City=@City AND UserDetails.State=@State AND UserDetails.UserId!=@UserId  AND UserDetails.Visibility='Public'
						 
GO
/****** Object:  StoredProcedure [dbo].[SendDateRequest]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendDateRequest]
@SenderId nvarchar(max),
@ReceiverId nvarchar(max),
@Status nvarchar(max),
@RequestStatus nvarchar(max),
@ReqTime nvarchar(max)
AS
SET NOCOUNT ON
INSERT INTO DateRequest(SenderId,ReceiverId,Status,RequestStatus,ReqTime) VALUES(@SenderId,@ReceiverId,@Status,@RequestStatus,@ReqTime)
GO
/****** Object:  StoredProcedure [dbo].[SendRequest]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendRequest]
@SenderId nvarchar(max),
@ReceiverId nvarchar(max),
@RequestStatus nvarchar(max),
@FriendStatus nvarchar(max),
@ReqTime nvarchar(max)

AS

SET NOCOUNT ON

INSERT INTO LikeUser(SenderId,ReceiverId,RequestStatus,FriendStatus,ReqTime) VALUES(@SenderId,@ReceiverId,@RequestStatus,@FriendStatus,@ReqTime)	  
GO
/****** Object:  StoredProcedure [dbo].[UpdateBasic]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateBasic]
@UserId int,
@Picture nvarchar(max), 
@FullName	nvarchar(max)

AS
BEGIN
SET NOCOUNT ON
UPDATE Users SET FullName=@FullName WHERE UserId=@UserId
UPDATE UserDetails SET Picture=@Picture WHERE UserId=@UserId
END 
GO
/****** Object:  StoredProcedure [dbo].[UpdateContactInfo]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateContactInfo]
@UserId int, 
@Email nvarchar(max),
@Contact nvarchar(max),
@Address nvarchar(max),
@City nvarchar(max),
@State nvarchar(max)


AS
BEGIN
SET NOCOUNT ON
UPDATE UserDetails SET Contact=@Contact,Address=@Address,City=@City,State=@State WHERE UserId=@UserId
UPDATE Users SET Email=@Email WHERE UserId=@UserId
END 
GO
/****** Object:  StoredProcedure [dbo].[UpdateFavoriteInfo]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateFavoriteInfo]
@UserId int, 
@Restaurants nvarchar(max),
@Movies nvarchar(max),
@Books nvarchar(max),
@Peoms nvarchar(max),
@Saying nvarchar(max)


AS
BEGIN
SET NOCOUNT ON
UPDATE UserDetails SET Restaurants=@Restaurants,Movies=@Movies,Books=@Books,Peoms=@Peoms,Saying=@Saying WHERE UserId=@UserId
END 
GO
/****** Object:  StoredProcedure [dbo].[UpdateOtherInfo]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateOtherInfo]
@UserId int, 
@Visibility nvarchar(max),
@UserName nvarchar(max),
@Password nvarchar(max)


AS
BEGIN
SET NOCOUNT ON
UPDATE Users SET UserName=@UserName,Password=@Password WHERE UserId=@UserId
UPDATE UserDetails SET Visibility=@Visibility WHERE UserId=@UserId
END 
GO
/****** Object:  StoredProcedure [dbo].[UpdatePersonalInfo]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdatePersonalInfo]
@UserId int, 
@Occupation nvarchar(max),
@Gender nvarchar(max),
@Age int,
@Height nvarchar(max),
@Weight nvarchar(max),
@Interest nvarchar(max),
@Likes nvarchar(max),
@DisLikes nvarchar(max),
@Goals nvarchar(max),
@Commitment nvarchar(max),
@Description nvarchar(max)

AS
BEGIN
SET NOCOUNT ON
UPDATE UserDetails SET Occupation=@Occupation,Gender=@Gender,Age=@Age,Height=@Height,Weight=@Weight,Interest=@Interest,Likes=@Likes,DisLikes=@DisLikes,Goals=@Goals,Commitment=@Commitment,Description=@Description WHERE UserId=@UserId
END 
GO
/****** Object:  StoredProcedure [dbo].[UpdatePlan]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePlan]
@PlanId nvarchar(max),
@Date nvarchar(max),
@Time nvarchar(max),
@Description nvarchar(max)

AS
SET NOCOUNT ON
UPDATE DatePlan SET Date=@Date,Time=@Time,Description=@Description WHERE PlanId=@PlanId
GO
/****** Object:  StoredProcedure [dbo].[UserLogIn]    Script Date: 3/6/2022 2:11:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogIn]   
    @UserName nvarchar(max),    
    @Password nvarchar(max) 
AS   
SET NOCOUNT ON
  SELECT Password FROM Users WHERE UserName=@UserName AND Password=@Password AND UserStatus='A' COLLATE Latin1_General_CS_AI
GO
USE [master]
GO
ALTER DATABASE [DatingDb] SET  READ_WRITE 
GO
