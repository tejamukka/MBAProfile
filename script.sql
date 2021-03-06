USE [master]
GO
/****** Object:  Database [MBAProfile]    Script Date: 13-Nov-16 14:05:18 ******/
CREATE DATABASE [MBAProfile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MBAProfile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MBAProfile.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MBAProfile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MBAProfile_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MBAProfile] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MBAProfile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MBAProfile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MBAProfile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MBAProfile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MBAProfile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MBAProfile] SET ARITHABORT OFF 
GO
ALTER DATABASE [MBAProfile] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MBAProfile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MBAProfile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MBAProfile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MBAProfile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MBAProfile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MBAProfile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MBAProfile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MBAProfile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MBAProfile] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MBAProfile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MBAProfile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MBAProfile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MBAProfile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MBAProfile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MBAProfile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MBAProfile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MBAProfile] SET RECOVERY FULL 
GO
ALTER DATABASE [MBAProfile] SET  MULTI_USER 
GO
ALTER DATABASE [MBAProfile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MBAProfile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MBAProfile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MBAProfile] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MBAProfile] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MBAProfile', N'ON'
GO
ALTER DATABASE [MBAProfile] SET QUERY_STORE = OFF
GO
USE [MBAProfile]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MBAProfile]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CourseNumber] [nvarchar](8) NULL,
	[ConcentrationCode] [nvarchar](4) NOT NULL,
	[ProgramId] [int] NOT NULL,
	[PreqId] [nvarchar](max) NULL,
	[PrereqIsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Major]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Program]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MajorId] [int] NOT NULL,
	[Conc_Code] [nvarchar](10) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Role__3214EC0794C4B62B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_AcademicStatus]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_AcademicStatus](
	[ID] [int] NOT NULL,
	[AcademicStatus] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student_TrainingStatus]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_TrainingStatus](
	[Id] [int] NOT NULL,
	[TrainingStatus] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Training]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UCMModerator]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCMModerator](
	[ModeratorId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[programID] [nvarchar](50) NULL,
 CONSTRAINT [PK__UCMModer__737FFEA120D32E1C] PRIMARY KEY CLUSTERED 
(
	[ModeratorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UCMStudent]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCMStudent](
	[Id] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[ProgramId] [int] NOT NULL,
	[GPA] [decimal](18, 0) NOT NULL,
	[GREScore] [int] NULL,
	[GMATScore] [int] NULL,
	[StartDate] [date] NOT NULL,
	[TrainingId] [int] NULL,
	[StudentTrainingStatusId] [int] NULL,
	[Student_AcademicStatusId] [int] NOT NULL,
	[Comments] [nvarchar](200) NULL,
	[ApprovedGrad] [bit] NULL,
	[PrereqsMet] [bit] NULL,
	[Advisor] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UCMUser]    Script Date: 13-Nov-16 14:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UCMUser](
	[Id] [int] IDENTITY(700000000,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[AlternateEmail] [nvarchar](100) NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__UCMUser__3214EC0776302B49] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[courses] ([Id], [Name], [CourseNumber], [ConcentrationCode], [ProgramId], [PreqId], [PrereqIsActive]) VALUES (2, N'Economy', N'2311', N'AC', 1, N'2', NULL)
INSERT [dbo].[Major] ([Id], [Name]) VALUES (1, N'MBA')
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (1, N'Accounting', 1, N'AC', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (2, N'Finance', 1, N'FIN', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (3, N'Information Systems', 1, N'IS', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (4, N'Marketing', 1, N'Mar', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (5, N'Sports Business', 1, N'SB', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (6, N'General', 1, N'GEN', NULL)
INSERT [dbo].[Program] ([Id], [Name], [MajorId], [Conc_Code], [IsActive]) VALUES (7, N'Accounting', 1, N'AC', NULL)
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Director')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Advisor')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Student')
INSERT [dbo].[Student_AcademicStatus] ([ID], [AcademicStatus]) VALUES (2, N'WithDrawn')
INSERT [dbo].[Student_AcademicStatus] ([ID], [AcademicStatus]) VALUES (3, N'Accepted')
INSERT [dbo].[Student_AcademicStatus] ([ID], [AcademicStatus]) VALUES (4, N'AcceptedWithConditions')
INSERT [dbo].[Student_TrainingStatus] ([Id], [TrainingStatus]) VALUES (2, N'Due')
INSERT [dbo].[Student_TrainingStatus] ([Id], [TrainingStatus]) VALUES (3, N'Completed')
INSERT [dbo].[Training] ([Id], [Name]) VALUES (1, N'ACC')
INSERT [dbo].[UCMModerator] ([ModeratorId], [IsActive], [programID]) VALUES (700000005, 1, N'2')
INSERT [dbo].[UCMModerator] ([ModeratorId], [IsActive], [programID]) VALUES (700000006, 0, N'3')
INSERT [dbo].[UCMStudent] ([Id], [Address], [PhoneNumber], [ProgramId], [GPA], [GREScore], [GMATScore], [StartDate], [TrainingId], [StudentTrainingStatusId], [Student_AcademicStatusId], [Comments], [ApprovedGrad], [PrereqsMet], [Advisor]) VALUES (700000001, N'Springfield', N'2175534774', 1, CAST(3 AS Decimal(18, 0)), 300, 345, CAST(N'2016-10-15' AS Date), 1, 2, 2, N'Hi You are Selected', 0, 0, 700000005)
INSERT [dbo].[UCMStudent] ([Id], [Address], [PhoneNumber], [ProgramId], [GPA], [GREScore], [GMATScore], [StartDate], [TrainingId], [StudentTrainingStatusId], [Student_AcademicStatusId], [Comments], [ApprovedGrad], [PrereqsMet], [Advisor]) VALUES (700000002, N'Springfield', N'2175534774', 1, CAST(3 AS Decimal(18, 0)), 300, 345, CAST(N'2016-10-15' AS Date), 1, 3, 2, NULL, 0, 0, 700000005)
INSERT [dbo].[UCMStudent] ([Id], [Address], [PhoneNumber], [ProgramId], [GPA], [GREScore], [GMATScore], [StartDate], [TrainingId], [StudentTrainingStatusId], [Student_AcademicStatusId], [Comments], [ApprovedGrad], [PrereqsMet], [Advisor]) VALUES (700000003, N'Springfield', N'2175534774', 1, CAST(5 AS Decimal(18, 0)), 300, 345, CAST(N'2016-10-15' AS Date), 1, 2, 2, N'kasdlfajsdfm,mn', 0, 0, 700000006)
INSERT [dbo].[UCMStudent] ([Id], [Address], [PhoneNumber], [ProgramId], [GPA], [GREScore], [GMATScore], [StartDate], [TrainingId], [StudentTrainingStatusId], [Student_AcademicStatusId], [Comments], [ApprovedGrad], [PrereqsMet], [Advisor]) VALUES (700000004, N'Springfield', N'2175534774', 1, CAST(3 AS Decimal(18, 0)), 300, 345, CAST(N'2016-10-15' AS Date), 1, 3, 2, NULL, 1, 0, 700000005)
INSERT [dbo].[UCMStudent] ([Id], [Address], [PhoneNumber], [ProgramId], [GPA], [GREScore], [GMATScore], [StartDate], [TrainingId], [StudentTrainingStatusId], [Student_AcademicStatusId], [Comments], [ApprovedGrad], [PrereqsMet], [Advisor]) VALUES (700000007, N'158 Pleasantview Dr', N'4695165604', 1, CAST(1 AS Decimal(18, 0)), 4, 4, CAST(N'2016-12-31' AS Date), 1, 2, 3, NULL, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[UCMUser] ON 

INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000000, N'Director', N'Director', N'25d55ad283aa400af464c76d713c07ad', N'kxp99500@ucmo.edu', NULL, 1, CAST(N'2016-11-05T13:09:39.330' AS DateTime), CAST(N'2016-11-05T13:09:50.407' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000001, N'uday', N'ramini', N'25d55ad283aa400af464c76d713c07ad', N'uxr99500@ucmo.edu', N'uday55@gmail.com', 3, CAST(N'2016-11-05T13:09:39.330' AS DateTime), CAST(N'2016-11-05T13:09:50.407' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000002, N'sai', N'Reddy', N'25d55ad283aa400af464c76d713c07ad', N'sxr99500@ucmo.edu', NULL, 3, CAST(N'2016-11-05T13:09:39.330' AS DateTime), CAST(N'2016-11-05T13:09:50.407' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000003, N'sharanya', N'Marupaka', N'1234567890', N'sxm99500@ucmo.edu', NULL, 3, CAST(N'2016-01-01T10:00:00.000' AS DateTime), CAST(N'2016-11-06T01:09:50.407' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000004, N'Mounika', N'lachireddy', N'1234567890', N'mxl99500@ucmo.edu', NULL, 3, CAST(N'2016-11-05T13:09:39.330' AS DateTime), CAST(N'2016-11-05T13:09:50.407' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000005, N'Sam', N'Ramanujan', N'1212121', N'sxr99500@ucmo.edu', NULL, 2, CAST(N'2016-11-07T00:08:10.293' AS DateTime), CAST(N'2016-11-07T00:08:10.293' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000006, N'Faya', N'silvana', N'12121', N'fxs99500@ucmo.edu', NULL, 2, CAST(N'2016-11-07T00:09:10.540' AS DateTime), CAST(N'2016-11-07T00:09:10.540' AS DateTime))
INSERT [dbo].[UCMUser] ([Id], [FirstName], [LastName], [Password], [Email], [AlternateEmail], [RoleId], [CreatedDate], [ModifiedDate]) VALUES (700000007, N'Sai', N'Podduturi', N'a538babf2bf6c004b86c2bd045e18d5f', N'saikrishnareddy7392@gmail.com', N'saikrishnareddy7392@gmail.com', 3, CAST(N'2016-11-13T01:47:16.347' AS DateTime), CAST(N'2016-11-13T01:47:16.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[UCMUser] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__courses__A98290ED7A055BA3]    Script Date: 13-Nov-16 14:05:19 ******/
ALTER TABLE [dbo].[courses] ADD UNIQUE NONCLUSTERED 
(
	[CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT ((0)) FOR [PrereqIsActive]
GO
ALTER TABLE [dbo].[Program] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UCMStudent] ADD  DEFAULT ((0)) FOR [ApprovedGrad]
GO
ALTER TABLE [dbo].[UCMUser] ADD  CONSTRAINT [DF__UCMUser__Created__36B12243]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UCMUser] ADD  CONSTRAINT [DF__UCMUser__Modifie__37A5467C]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Program]  WITH CHECK ADD FOREIGN KEY([MajorId])
REFERENCES [dbo].[Major] ([Id])
GO
ALTER TABLE [dbo].[UCMModerator]  WITH CHECK ADD  CONSTRAINT [FK_UCMModerator_UCMUser] FOREIGN KEY([ModeratorId])
REFERENCES [dbo].[UCMUser] ([Id])
GO
ALTER TABLE [dbo].[UCMModerator] CHECK CONSTRAINT [FK_UCMModerator_UCMUser]
GO
ALTER TABLE [dbo].[UCMStudent]  WITH CHECK ADD  CONSTRAINT [FK__UCMStuden__Progr__1FCDBCEB] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[Program] ([Id])
GO
ALTER TABLE [dbo].[UCMStudent] CHECK CONSTRAINT [FK__UCMStuden__Progr__1FCDBCEB]
GO
ALTER TABLE [dbo].[UCMStudent]  WITH CHECK ADD  CONSTRAINT [FK__UCMStuden__Stude__2A4B4B5E] FOREIGN KEY([StudentTrainingStatusId])
REFERENCES [dbo].[Student_TrainingStatus] ([Id])
GO
ALTER TABLE [dbo].[UCMStudent] CHECK CONSTRAINT [FK__UCMStuden__Stude__2A4B4B5E]
GO
ALTER TABLE [dbo].[UCMStudent]  WITH CHECK ADD  CONSTRAINT [FK__UCMStuden__Stude__2B3F6F97] FOREIGN KEY([Student_AcademicStatusId])
REFERENCES [dbo].[Student_AcademicStatus] ([ID])
GO
ALTER TABLE [dbo].[UCMStudent] CHECK CONSTRAINT [FK__UCMStuden__Stude__2B3F6F97]
GO
ALTER TABLE [dbo].[UCMStudent]  WITH CHECK ADD  CONSTRAINT [FK__UCMStuden__Train__25869641] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Training] ([Id])
GO
ALTER TABLE [dbo].[UCMStudent] CHECK CONSTRAINT [FK__UCMStuden__Train__25869641]
GO
ALTER TABLE [dbo].[UCMUser]  WITH CHECK ADD  CONSTRAINT [FK__UCMUser__RoleId__3F466844] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UCMUser] CHECK CONSTRAINT [FK__UCMUser__RoleId__3F466844]
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 13-Nov-16 14:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddCourse]
(
@Name nvarchar(500),
@CourseNumber nvarchar(8),
@CCode nvarchar(4),
@PreqId nvarchar(max),
@PrereqIsActive bit
)
as
begin
insert into courses(Name,CourseNumber,ConcentrationCode,ProgramId,PreqId,PrereqIsActive) values(@Name,@CourseNumber,@CCode,1,@PreqId,@PrereqIsActive)
end




GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 13-Nov-16 14:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateCourse]
(
@CourseId int,
@Name nvarchar(500),
@CourseNumber nvarchar(8),
@CCode nvarchar(4),
@PreqId nvarchar(max),
@PrereqIsActive bit
)
as
begin
update courses
set Name=@Name,ConcentrationCode=@CCode,CourseNumber=@CourseNumber,PreqId=@PreqId, PrereqIsActive=@PrereqIsActive
where Id=@CourseId
end




GO
USE [master]
GO
ALTER DATABASE [MBAProfile] SET  READ_WRITE 
GO
