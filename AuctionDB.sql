USE [master]
GO
/****** Object:  Database [AchievementManager]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE DATABASE [AchievementManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AchievementManager', FILENAME = N'D:\Mircosoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AchievementManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AchievementManager_log', FILENAME = N'D:\Mircosoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AchievementManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AchievementManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AchievementManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AchievementManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AchievementManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AchievementManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AchievementManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AchievementManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [AchievementManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AchievementManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AchievementManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AchievementManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AchievementManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AchievementManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AchievementManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AchievementManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AchievementManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AchievementManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AchievementManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AchievementManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AchievementManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AchievementManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AchievementManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AchievementManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AchievementManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AchievementManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AchievementManager] SET  MULTI_USER 
GO
ALTER DATABASE [AchievementManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AchievementManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AchievementManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AchievementManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AchievementManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AchievementManager] SET QUERY_STORE = OFF
GO
USE [AchievementManager]
GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Picture] [varbinary](max) NOT NULL,
	[Rare] [int] NOT NULL,
 CONSTRAINT [PK_Achievement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rare]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Rare] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[Password] [varbinary](32) NOT NULL,
	[Avatar] [varbinary](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Achievements]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Achievements](
	[IdUser] [int] NOT NULL,
	[IdAchievement] [int] NOT NULL,
 CONSTRAINT [IX_Users_Achievements] UNIQUE NONCLUSTERED 
(
	[IdAchievement] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Roles]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Roles](
	[IdUser] [int] NOT NULL,
	[IdRole] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Achievement]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Achievement] ON [dbo].[Achievement]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Achievement_1]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Achievement_1] ON [dbo].[Achievement]
(
	[Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Rare]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Rare] ON [dbo].[Rare]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Role]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Role] ON [dbo].[Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User]    Script Date: 7/10/2020 9:10:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User] ON [dbo].[User]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK_Achievement_Rare] FOREIGN KEY([Rare])
REFERENCES [dbo].[Rare] ([Id])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK_Achievement_Rare]
GO
ALTER TABLE [dbo].[Users_Achievements]  WITH CHECK ADD  CONSTRAINT [FK_Users_Achievements_Achievement] FOREIGN KEY([IdAchievement])
REFERENCES [dbo].[Achievement] ([Id])
GO
ALTER TABLE [dbo].[Users_Achievements] CHECK CONSTRAINT [FK_Users_Achievements_Achievement]
GO
ALTER TABLE [dbo].[Users_Achievements]  WITH CHECK ADD  CONSTRAINT [FK_Users_Achievements_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Users_Achievements] CHECK CONSTRAINT [FK_Users_Achievements_User]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_Users_Roles_Role]
GO
ALTER TABLE [dbo].[Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Users_Roles] CHECK CONSTRAINT [FK_Users_Roles_User]
GO
/****** Object:  StoredProcedure [dbo].[AddAchievement]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddAchievement]
	@Title NVARCHAR(50),
	@Description NVARCHAR(200),
	@Picture VARBINARY(MAX),
	@IdRare INT
AS
BEGIN
	INSERT INTO [Achievement] ([Title], [Description], [Picture], [Rare])
	VALUES (@Title, @Description, @Picture, @IdRare)
END
GO
/****** Object:  StoredProcedure [dbo].[Authorization]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Authorization]
	@Username NVARCHAR(25),
	@Password VARBINARY(32)
AS
BEGIN
	IF EXISTS(SELECT Id FROM [User] WHERE [Username] = @Username AND [Password] = @Password)
		BEGIN
			RETURN 1
		END
	ELSE
		BEGIN
			RETURN 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ChangeAvatar]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChangeAvatar]
	@Username NVARCHAR(25),
	@Avatar VARBINARY(MAX)
AS
BEGIN
	UPDATE [User]
	SET Avatar = @Avatar
	WHERE @Username = Username
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChangePassword]
	@Username NVARCHAR(25),
	@NewPassword VARBINARY(32)
AS
BEGIN
	UPDATE [User]
	SET Password = @NewPassword
	WHERE Username = @Username
END
GO
/****** Object:  StoredProcedure [dbo].[EditAchievement]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EditAchievement]
	@Title NVARCHAR(25) = NULL,
	@Description NVARCHAR(250) = NULL,
	@IdRare INT = NULL,
	@Picture VARBINARY(MAX) = NULL,
	@Id INT
AS
BEGIN
	UPDATE Achievement
	SET
		Title = COALESCE(@Title, Title),
		Rare = COALESCE(@IdRare, Rare),
		Description = COALESCE(@Description, Description),
		Picture = COALESCE(@Picture, Picture)
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchievementById]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAchievementById] 
	@Id INT
AS
BEGIN
	SELECT Achievement.Id,
	Achievement.Description,
	Achievement.Picture,
	Achievement.Title,
	Rare.Id as IdRare,
	Rare.Name,
	Rare.Points
	FROM Achievement
	INNER JOIN Rare
	ON Rare.Id = Achievement.Rare
END
GO
/****** Object:  StoredProcedure [dbo].[GetAchievementByTitle]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAchievementByTitle] 
	@Title NVARCHAR(25)
AS
BEGIN
	SELECT Achievement.Id,
		Achievement.Title,
		Achievement.Description,
		Achievement.Picture,
		Rare.Id AS IdRare,
		Rare.Name,
		Rare.Points
	FROM Achievement
	INNER JOIN Rare
	ON Rare.Id = Achievement.Rare
	WHERE Achievement.Title = @Title
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAchievement]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAchievement]	
AS
BEGIN
	SELECT Achievement.Id, [Title], [Description], [Picture], [Rare], 
	Rare.Id AS IdRare, Rare.Name AS NameRare, Rare.Points AS PointsRare FROM Achievement
	INNER JOIN Rare
	ON Achievement.Rare = Rare.Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRare]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllRare]
AS
BEGIN
	SELECT [Id], [Name], [Points] FROM [Rare]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
	SELECT Id, [Username], [Avatar]
	FROM [User]
END
GO
/****** Object:  StoredProcedure [dbo].[GetRolesForUser]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRolesForUser] 
	@Username NVARCHAR(25)
AS
BEGIN
	SELECT [Role].Name
	FROM [Role]
	INNER JOIN Users_Roles
	ON Users_Roles.IdRole = [Role].Id
	INNER JOIN [User]
	ON [User].Id = Users_Roles.IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserAchievementsById]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserAchievementsById]
	@Id INT
AS
BEGIN
	SELECT 
		Achievement.Id, 
		Achievement.Title, 
		Achievement.Description, 
		Achievement.Picture,
		Rare.Id AS IdRare,
		Rare.Name AS NameRare,
		Rare.Points AS PointsRare
	FROM Users_Achievements
	INNER JOIN Achievement
	ON IdAchievement = Id
	INNER JOIN Rare
	ON Rare.Id = Achievement.Rare
	WHERE IdUser = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserInfo] 
	@Username NVARCHAR(25)
AS
BEGIN
	SELECT Id, Username, Avatar  FROM [User]
	WHERE [Username] = @Username
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersInRole]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUsersInRole]
	@RoleName NVARCHAR(25)
AS
BEGIN
	SELECT Username
	FROM Users_Roles
	INNER JOIN [Role]
	ON [Role].Id = Users_Roles.IdRole
	INNER JOIN [User]
	ON [User].Id = Users_Roles.IdUser
END
GO
/****** Object:  StoredProcedure [dbo].[IsUserInRole]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IsUserInRole]
	@RoleName NVARCHAR(25),
	@Username NVARCHAR(25)
AS
BEGIN
	IF EXISTS(SELECT Username
	FROM Users_Roles
	INNER JOIN [Role]
	ON [Role].Id = Users_Roles.IdRole
	INNER JOIN [User]
	ON [User].Id = Users_Roles.IdUser
	WHERE [User].Username = @Username AND [Role].Name = @RoleName)
	BEGIN
			RETURN 1
		END
	ELSE
		BEGIN
			RETURN 0
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Registration]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Registration] 
	@Username NVARCHAR(25),
	@Password VARBINARY(32),
	@Avatar VARBINARY(MAX) = NULL
AS
BEGIN
	INSERT INTO [User] ([Username], [Password], [Avatar])
	VALUES (@Username, @Password, @Avatar)
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveAchievementById]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveAchievementById] 
	@Id INT
AS
BEGIN
	DELETE FROM Achievement WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Reward]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Reward]
	@IdUser INT,
	@IdAchievement INT
AS
BEGIN
	INSERT Users_Achievements (IdAchievement, IdUser)
	VALUES (@IdAchievement, @IdUser)
END
GO
/****** Object:  StoredProcedure [dbo].[Unreward]    Script Date: 7/10/2020 9:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Unreward] 
	@IdUser INT,
	@IdAchievement INT
AS
BEGIN
	DELETE Users_Achievements 
	WHERE IdUser = @IdUser AND IdAchievement = @IdAchievement
END
GO
USE [master]
GO
ALTER DATABASE [AchievementManager] SET  READ_WRITE 
GO
