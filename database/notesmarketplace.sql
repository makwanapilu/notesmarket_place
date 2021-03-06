USE [master]
GO
/****** Object:  Database [notesmarketplace]    Script Date: 10-04-2021 22:23:50 ******/
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
/****** Object:  Table [dbo].[tblDownloads]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDownloads](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[isAttachmentDownloaded] [bit] NOT NULL,
 CONSTRAINT [PK_downloads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManageCountry]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManageCountry](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblManageNoteCategory]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManageNoteCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblManageNoteType]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManageNoteType](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblNoteAttachement]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoteAttachement](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblNoteDetails]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoteDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sellerID] [int] NOT NULL,
	[status] [int] NOT NULL,
	[actionedBy] [int] NULL,
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
	[filePath] [nvarchar](max) NOT NULL,
	[isNoteDetailSet] [bit] NOT NULL,
	[fileSize] [varchar](50) NULL,
 CONSTRAINT [PK_noteDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_noteTitle] UNIQUE NONCLUSTERED 
(
	[noteTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNoteReportedIsuues]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoteReportedIsuues](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblNoteReviews]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoteReviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblReferenceData]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReferenceData](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblSystemConfig]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSystemConfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_systemConfig] UNIQUE NONCLUSTERED 
(
	[supportEmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_systemConfig_event] UNIQUE NONCLUSTERED 
(
	[emailForEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserProfile]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserProfile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[dob] [datetime] NULL,
	[gender] [varchar](10) NULL,
	[secondaryEmailID] [varchar](100) NULL,
	[countryCode_phoneNo] [varchar](10) NOT NULL,
	[phoneNo] [varchar](20) NOT NULL,
	[profilePicture] [varchar](500) NULL,
	[addressLine1] [varchar](100) NULL,
	[addressLine2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zipcode] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[university] [varchar](100) NULL,
	[college] [varchar](100) NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [int] NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [int] NULL,
	[isProfileSet] [bit] NOT NULL,
 CONSTRAINT [PK_userProfile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10-04-2021 22:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[emailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblManageCountry] ADD  CONSTRAINT [manage_country_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblManageNoteCategory] ADD  CONSTRAINT [manage_note_category_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblManageNoteType] ADD  CONSTRAINT [manage_note_type_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblNoteAttachement] ADD  CONSTRAINT [note_attachemenet_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblNoteDetails] ADD  CONSTRAINT [note_details_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblNoteReviews] ADD  CONSTRAINT [note_reviews_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblReferenceData] ADD  CONSTRAINT [reference_data_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblSystemConfig] ADD  CONSTRAINT [system_config_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblUserRoles] ADD  CONSTRAINT [user_roles_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [users_isactive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[tblDownloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[tblNoteDetails] ([id])
GO
ALTER TABLE [dbo].[tblDownloads] CHECK CONSTRAINT [FK_downloads_noteDetails]
GO
ALTER TABLE [dbo].[tblDownloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_seller] FOREIGN KEY([seller])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblDownloads] CHECK CONSTRAINT [FK_downloads_seller]
GO
ALTER TABLE [dbo].[tblDownloads]  WITH CHECK ADD  CONSTRAINT [FK_tblDownloads_downloader] FOREIGN KEY([downloader])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblDownloads] CHECK CONSTRAINT [FK_tblDownloads_downloader]
GO
ALTER TABLE [dbo].[tblManageCountry]  WITH CHECK ADD  CONSTRAINT [FK_manageCountry_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblManageCountry] CHECK CONSTRAINT [FK_manageCountry_users]
GO
ALTER TABLE [dbo].[tblManageNoteCategory]  WITH CHECK ADD  CONSTRAINT [FK_manageNoteCategory_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblManageNoteCategory] CHECK CONSTRAINT [FK_manageNoteCategory_users]
GO
ALTER TABLE [dbo].[tblManageNoteType]  WITH CHECK ADD  CONSTRAINT [FK_manageNoteType_users] FOREIGN KEY([addedBy])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblManageNoteType] CHECK CONSTRAINT [FK_manageNoteType_users]
GO
ALTER TABLE [dbo].[tblNoteAttachement]  WITH CHECK ADD  CONSTRAINT [FK_noteAttachement_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[tblNoteDetails] ([id])
GO
ALTER TABLE [dbo].[tblNoteAttachement] CHECK CONSTRAINT [FK_noteAttachement_noteDetails]
GO
ALTER TABLE [dbo].[tblNoteDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNoteDetails_actionby] FOREIGN KEY([actionedBy])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblNoteDetails] CHECK CONSTRAINT [FK_tblNoteDetails_actionby]
GO
ALTER TABLE [dbo].[tblNoteDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNoteDetails_sellerId] FOREIGN KEY([sellerID])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblNoteDetails] CHECK CONSTRAINT [FK_tblNoteDetails_sellerId]
GO
ALTER TABLE [dbo].[tblNoteDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNoteDetails_status] FOREIGN KEY([status])
REFERENCES [dbo].[tblReferenceData] ([id])
GO
ALTER TABLE [dbo].[tblNoteDetails] CHECK CONSTRAINT [FK_tblNoteDetails_status]
GO
ALTER TABLE [dbo].[tblNoteDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNoteDetails_tblManageNoteCategory] FOREIGN KEY([noteCategory])
REFERENCES [dbo].[tblManageNoteCategory] ([id])
GO
ALTER TABLE [dbo].[tblNoteDetails] CHECK CONSTRAINT [FK_tblNoteDetails_tblManageNoteCategory]
GO
ALTER TABLE [dbo].[tblNoteDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblNoteDetails_tblManageNoteType] FOREIGN KEY([noteType])
REFERENCES [dbo].[tblManageNoteType] ([id])
GO
ALTER TABLE [dbo].[tblNoteDetails] CHECK CONSTRAINT [FK_tblNoteDetails_tblManageNoteType]
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_downloads] FOREIGN KEY([againstDownloadID])
REFERENCES [dbo].[tblDownloads] ([id])
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_downloads]
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[tblNoteDetails] ([id])
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_noteDetails]
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues]  WITH CHECK ADD  CONSTRAINT [FK_noteReportedIsuues_users] FOREIGN KEY([reportedByID])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblNoteReportedIsuues] CHECK CONSTRAINT [FK_noteReportedIsuues_users]
GO
ALTER TABLE [dbo].[tblNoteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_downloads] FOREIGN KEY([againstDownloadID])
REFERENCES [dbo].[tblDownloads] ([id])
GO
ALTER TABLE [dbo].[tblNoteReviews] CHECK CONSTRAINT [FK_noteReviews_downloads]
GO
ALTER TABLE [dbo].[tblNoteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_noteDetails] FOREIGN KEY([noteID])
REFERENCES [dbo].[tblNoteDetails] ([id])
GO
ALTER TABLE [dbo].[tblNoteReviews] CHECK CONSTRAINT [FK_noteReviews_noteDetails]
GO
ALTER TABLE [dbo].[tblNoteReviews]  WITH CHECK ADD  CONSTRAINT [FK_noteReviews_users] FOREIGN KEY([reviewedByID])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblNoteReviews] CHECK CONSTRAINT [FK_noteReviews_users]
GO
ALTER TABLE [dbo].[tblUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_userProfile_users] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblUserProfile] CHECK CONSTRAINT [FK_userProfile_users]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_users_userRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblUserRoles] ([id])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_users_userRoles]
GO
ALTER TABLE [dbo].[tblNoteReviews]  WITH CHECK ADD  CONSTRAINT [CK_rating] CHECK  (([rating]>(0) AND [rating]<(6)))
GO
ALTER TABLE [dbo].[tblNoteReviews] CHECK CONSTRAINT [CK_rating]
GO
USE [master]
GO
ALTER DATABASE [notesmarketplace] SET  READ_WRITE 
GO
