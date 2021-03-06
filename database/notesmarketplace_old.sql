USE [master]
GO
/****** Object:  Database [notesmarketplace]    Script Date: 11-02-2021 18:32:21 ******/
CREATE DATABASE [notesmarketplace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'notesmarketplace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\notesmarketplace.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'notesmarketplace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\notesmarketplace_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [notesmarketplace] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [notesmarketplace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [notesmarketplace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [notesmarketplace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [notesmarketplace] SET ARITHABORT OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [notesmarketplace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [notesmarketplace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [notesmarketplace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [notesmarketplace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [notesmarketplace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [notesmarketplace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [notesmarketplace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [notesmarketplace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [notesmarketplace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [notesmarketplace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [notesmarketplace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [notesmarketplace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [notesmarketplace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [notesmarketplace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [notesmarketplace] SET RECOVERY FULL 
GO
ALTER DATABASE [notesmarketplace] SET  MULTI_USER 
GO
ALTER DATABASE [notesmarketplace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [notesmarketplace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [notesmarketplace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [notesmarketplace] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [notesmarketplace] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'notesmarketplace', N'ON'
GO
ALTER DATABASE [notesmarketplace] SET QUERY_STORE = OFF
GO
USE [notesmarketplace]
GO
/****** Object:  Table [dbo].[downloads]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[downloads](
	[id] [int] NOT NULL,
	[noteID] [int] NOT NULL,
	[seller] [int] NOT NULL,
	[downloader] [int] NOT NULL,
	[isSellerHasAllowedDownload] [bit] NOT NULL,
	[attachementPath] [varchar](max) NULL,
	[attachementDownloadDate] [datetime] NULL,
	[isPaid] [bit] NOT NULL,
	[purchasedPrice] [decimal](10, 5) NULL,
	[noteTitle] [varchar](100) NOT NULL,
	[noteCategory] [varchar](100) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
 CONSTRAINT [PK_downloads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manageCountry]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manageCountry](
	[id] [int] NOT NULL,
	[addedBy] [int] NOT NULL,
	[countryName] [varchar](100) NOT NULL,
	[countryCode] [varchar](10) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_manageCountry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manageNoteCategory]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manageNoteCategory](
	[id] [int] NOT NULL,
	[addedBy] [int] NOT NULL,
	[categoryName] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_manageNoteCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manageNoteType]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manageNoteType](
	[id] [int] NOT NULL,
	[addedBy] [int] NOT NULL,
	[typeName] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_manageNoteType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteAttachement]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteAttachement](
	[id] [int] NOT NULL,
	[noteID] [int] NOT NULL,
	[fileName] [varchar](100) NOT NULL,
	[filePath] [varchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_noteAttachement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteDetails]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteDetails](
	[id] [int] NOT NULL,
	[sellerID] [int] NOT NULL,
	[status] [int] NOT NULL,
	[actionedBy] [int] NOT NULL,
	[adminRemark] [varchar](max) NULL,
	[noteTitle] [varchar](100) NOT NULL,
	[notePicture] [varchar](500) NULL,
	[noteCategory] [int] NOT NULL,
	[noteUniversity] [varchar](200) NULL,
	[noteType] [int] NULL,
	[description] [varchar](max) NOT NULL,
	[numberOfPage] [int] NULL,
	[publishedDate] [datetime] NULL,
	[country] [int] NULL,
	[courseName] [varchar](100) NULL,
	[courseCode] [varchar](100) NULL,
	[professor] [varchar](100) NULL,
	[isPaid] [bit] NOT NULL,
	[sellingPrice] [decimal](18, 5) NULL,
	[notePreview] [nvarchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_noteDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteReportedIsuues]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteReportedIsuues](
	[id] [int] NOT NULL,
	[noteID] [int] NOT NULL,
	[reportedByID] [int] NOT NULL,
	[againstDownloadID] [int] NOT NULL,
	[remarks] [varchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
 CONSTRAINT [PK_noteReportedIsuues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noteReviews]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noteReviews](
	[id] [int] NOT NULL,
	[noteID] [int] NOT NULL,
	[reviewedByID] [int] NOT NULL,
	[againstDownloadID] [int] NOT NULL,
	[rating] [decimal](10, 5) NOT NULL,
	[comments] [varchar](max) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_noteReviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refereneceData]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refereneceData](
	[id] [int] NOT NULL,
	[value] [varchar](100) NOT NULL,
	[dataValue] [varchar](100) NOT NULL,
	[refCategory] [varchar](100) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_refereneceData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[systemConfig]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[systemConfig](
	[id] [int] NOT NULL,
	[supportEmailID] [varchar](100) NOT NULL,
	[emailForEvent] [varchar](100) NOT NULL,
	[fbURL] [varchar](max) NULL,
	[twitterURL] [varchar](max) NULL,
	[linkedinURL] [varchar](max) NULL,
	[defaultNoteImage] [varchar](500) NOT NULL,
	[defaultProfilePicture] [varchar](500) NOT NULL,
	[supportPhoneNo] [varchar](15) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_systemConfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userProfile]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userProfile](
	[id] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[dob] [datetime] NULL,
	[gender] [varchar](10) NULL,
	[secondaryEmailID] [varchar](100) NULL,
	[countryCode_phoneNo] [varchar](10) NOT NULL,
	[phoneNo] [varchar](20) NOT NULL,
	[profilePicture] [varchar](500) NULL,
	[addressLine1] [varchar](100) NOT NULL,
	[addressLine2] [varchar](100) NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[zipcode] [varchar](50) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[university] [varchar](100) NULL,
	[college] [varchar](100) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
 CONSTRAINT [PK_userProfile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userRoles]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userRoles](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_userRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11-02-2021 18:32:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[roleID] [int] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[emailID] [varchar](100) NOT NULL,
	[isEmailVerified] [bit] NOT NULL,
	[password] [varchar](24) NOT NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_noteTitle]    Script Date: 11-02-2021 18:32:21 ******/
ALTER TABLE [dbo].[noteDetails] ADD  CONSTRAINT [UQ_noteTitle] UNIQUE NONCLUSTERED 
(
	[noteTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_systemConfig]    Script Date: 11-02-2021 18:32:21 ******/
ALTER TABLE [dbo].[systemConfig] ADD  CONSTRAINT [IX_systemConfig] UNIQUE NONCLUSTERED 
(
	[supportEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_systemConfig_event]    Script Date: 11-02-2021 18:32:21 ******/
ALTER TABLE [dbo].[systemConfig] ADD  CONSTRAINT [UQ_systemConfig_event] UNIQUE NONCLUSTERED 
(
	[emailForEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_userProfile]    Script Date: 11-02-2021 18:32:21 ******/
ALTER TABLE [dbo].[userProfile] ADD  CONSTRAINT [UQ_userProfile] UNIQUE NONCLUSTERED 
(
	[secondaryEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_users]    Script Date: 11-02-2021 18:32:21 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[emailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[manageCountry] ADD  CONSTRAINT [isactive_default]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[manageNoteCategory] ADD  CONSTRAINT [isactive_df]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[manageNoteType] ADD  CONSTRAINT [df_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[noteAttachement] ADD  CONSTRAINT [default_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[noteDetails] ADD  CONSTRAINT [dflt_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[noteReviews] ADD  CONSTRAINT [dfault_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[refereneceData] ADD  CONSTRAINT [dfalt_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[systemConfig] ADD  CONSTRAINT [dfolt_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[userRoles] ADD  CONSTRAINT [default_isactve]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [dfault_isactve]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[noteDetails] ([id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [FK_downloads_noteDetails]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_users] FOREIGN KEY([seller])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [FK_downloads_users]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_users1] FOREIGN KEY([downloader])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [FK_downloads_users1]
GO
ALTER TABLE [dbo].[manageCountry]  WITH CHECK ADD  CONSTRAINT [FK_manageCountry_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[manageCountry] CHECK CONSTRAINT [FK_manageCountry_users]
GO
ALTER TABLE [dbo].[manageNoteCategory]  WITH CHECK ADD  CONSTRAINT [FK_manageNoteCategory_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[manageNoteCategory] CHECK CONSTRAINT [FK_manageNoteCategory_users]
GO
ALTER TABLE [dbo].[manageNoteType]  WITH CHECK ADD  CONSTRAINT [FK_manageNoteType_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[manageNoteType] CHECK CONSTRAINT [FK_manageNoteType_users]
GO
ALTER TABLE [dbo].[noteAttachement]  WITH CHECK ADD  CONSTRAINT [FK_noteAttachement_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[noteDetails] ([id])
GO
ALTER TABLE [dbo].[noteAttachement] CHECK CONSTRAINT [FK_noteAttachement_noteDetails]
GO
ALTER TABLE [dbo].[noteDetails]  WITH CHECK ADD  CONSTRAINT [FK_noteDetails_manageNoteCategory] FOREIGN KEY([noteCategory])
REFERENCES [dbo].[manageNoteCategory] ([id])
GO
ALTER TABLE [dbo].[noteDetails] CHECK CONSTRAINT [FK_noteDetails_manageNoteCategory]
GO
ALTER TABLE [dbo].[noteDetails]  WITH CHECK ADD  CONSTRAINT [FK_noteDetails_manageNoteType] FOREIGN KEY([noteType])
REFERENCES [dbo].[manageNoteType] ([id])
GO
ALTER TABLE [dbo].[noteDetails] CHECK CONSTRAINT [FK_noteDetails_manageNoteType]
GO
ALTER TABLE [dbo].[noteDetails]  WITH CHECK ADD  CONSTRAINT [FK_noteDetails_refereneceData] FOREIGN KEY([status])
REFERENCES [dbo].[refereneceData] ([id])
GO
ALTER TABLE [dbo].[noteDetails] CHECK CONSTRAINT [FK_noteDetails_refereneceData]
GO
ALTER TABLE [dbo].[noteDetails]  WITH CHECK ADD  CONSTRAINT [FK_noteDetails_users] FOREIGN KEY([sellerID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteDetails] CHECK CONSTRAINT [FK_noteDetails_users]
GO
ALTER TABLE [dbo].[noteDetails]  WITH CHECK ADD  CONSTRAINT [FK_noteDetails_users1] FOREIGN KEY([actionedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteDetails] CHECK CONSTRAINT [FK_noteDetails_users1]
GO
ALTER TABLE [dbo].[noteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_downloads] FOREIGN KEY([againstDownloadID])
REFERENCES [dbo].[downloads] ([id])
GO
ALTER TABLE [dbo].[noteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_downloads]
GO
ALTER TABLE [dbo].[noteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[noteDetails] ([id])
GO
ALTER TABLE [dbo].[noteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_noteDetails]
GO
ALTER TABLE [dbo].[noteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_users] FOREIGN KEY([reportedByID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_users]
GO
ALTER TABLE [dbo].[noteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_downloads] FOREIGN KEY([againstDownloadID])
REFERENCES [dbo].[downloads] ([id])
GO
ALTER TABLE [dbo].[noteReviews] CHECK CONSTRAINT [FK_noteReviews_downloads]
GO
ALTER TABLE [dbo].[noteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[noteDetails] ([id])
GO
ALTER TABLE [dbo].[noteReviews] CHECK CONSTRAINT [FK_noteReviews_noteDetails]
GO
ALTER TABLE [dbo].[noteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_users] FOREIGN KEY([reviewedByID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[noteReviews] CHECK CONSTRAINT [FK_noteReviews_users]
GO
ALTER TABLE [dbo].[userProfile]  WITH CHECK ADD  CONSTRAINT [FK_userProfile_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[userProfile] CHECK CONSTRAINT [FK_userProfile_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_userRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[userRoles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_userRoles]
GO
ALTER TABLE [dbo].[noteReviews]  WITH CHECK ADD  CONSTRAINT [CK_rating] CHECK  (([rating]>(0) AND [rating]<(6)))
GO
ALTER TABLE [dbo].[noteReviews] CHECK CONSTRAINT [CK_rating]
GO
USE [master]
GO
ALTER DATABASE [notesmarketplace] SET  READ_WRITE 
GO
