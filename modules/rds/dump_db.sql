USE [master]
GO
/****** Object:  Database [FormManagerTest]    Script Date: 5/9/2023 9:37:25 AM ******/
CREATE DATABASE [FormManagerTest]
ALTER DATABASE [FormManagerTest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FormManagerTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FormManagerTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FormManagerTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FormManagerTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FormManagerTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FormManagerTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [FormManagerTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FormManagerTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FormManagerTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FormManagerTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FormManagerTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FormManagerTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FormManagerTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FormManagerTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FormManagerTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FormManagerTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FormManagerTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FormManagerTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FormManagerTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FormManagerTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FormManagerTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FormManagerTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FormManagerTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FormManagerTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FormManagerTest] SET RECOVERY FULL 
GO
ALTER DATABASE [FormManagerTest] SET  MULTI_USER 
GO
ALTER DATABASE [FormManagerTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FormManagerTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FormManagerTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FormManagerTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FormManagerTest', N'ON'
GO
--ALTER DATABASE [FormManagerTest] SET ENCRYPTION ON
GO
USE [FormManagerTest]
GO

/****** Object:  Schema [CHSMEDICAL\scamner]    Script Date: 5/9/2023 9:37:25 AM ******/
CREATE SCHEMA [CHSMEDICAL\scamner]
GO
/****** Object:  UserDefinedFunction [dbo].[fcn_GetFormHtmlWithOptions]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fcn_GetFormHtmlWithOptions] (@FormBodyID INT, @IncludeScript BIT)
RETURNS VarChar(MAX)
AS
BEGIN
	DECLARE @RetHTML VarChar(MAX) = ''

	IF @IncludeScript = 1 AND (Select COUNT(*) FROM FormBodyScript WHERE FormBodyID = @FormBodyID) > 0
	BEGIN
		SET @RetHTML = '<script type="text/javascript">' +
		(SELECT (
			SELECT so1.Script + CHAR(13) AS [text()]
			From Script_Options so1 INNER JOIN FormBodyScript fbs ON so1.ScriptID = fbs.ScriptID
			Where fbs.FormBodyID = @FormBodyID
			ORDER BY so1.ScriptID
			For XML PATH ('')
		)) + '</script>'
	END

	IF (Select COUNT(*) FROM FormBodyCSS WHERE FormBodyID = @FormBodyID) > 0
	BEGIN
		SET @RetHTML = @RetHTML + '<style>' +
		(SELECT (
			SELECT co1.CSS + CHAR(13) AS [text()]
			From CSS_Options co1 INNER JOIN FormBodyCSS fbc ON co1.CSSID = fbc.CSSID
			Where fbc.FormBodyID = @FormBodyID
			ORDER BY co1.CSSID
			For XML PATH ('')
		)) + '</style>'
	END

	SET @RetHTML = @RetHTML + (Select FormHtml From FormBody Where FormBodyID = @FormBodyID)

	RETURN LTRIM(@RetHTML)

END


GO
/****** Object:  UserDefinedFunction [dbo].[fcn_IsCurrentFormBody]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fcn_IsCurrentFormBody] (@FormID INT, @FormVersion INT)
RETURNS BIT
AS
BEGIN
	DECLARE @IsCurrent BIT = 0
	
	IF (SELECT MAX(FormVersion) From FormBody Where FormID = @FormID) = @FormVersion
	BEGIN
		SET @IsCurrent = 1
	END

	RETURN @IsCurrent

END


GO
/****** Object:  Table [dbo].[CSS_Options]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CSS_Options](
	[CSSID] [int] IDENTITY(1,1) NOT NULL,
	[CSS] [varchar](max) NOT NULL,
	[CSSDescription] [varchar](200) NOT NULL,
 CONSTRAINT [PK_CSS] PRIMARY KEY CLUSTERED 
(
	[CSSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Form]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Form](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[FormCode] [varchar](20) NOT NULL,
	[FormName] [varchar](100) NOT NULL,
	[FormDescription] [varchar](500) NOT NULL,
	[IsObsolete] [bit] NOT NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormAnswers]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormAnswers](
	[FormAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[FormBodyID] [int] NOT NULL,
	[Answers] [xml] NOT NULL,
	[ComponentID] [int] NULL,
	[ContractID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_FormAnswers] PRIMARY KEY CLUSTERED 
(
	[FormAnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormBody]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormBody](
	[FormBodyID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[FormDate] [datetime] NOT NULL,
	[FormHtml] [varchar](max) NOT NULL,
	[FormVersion] [int] NULL,
	[IsCurrent]  AS ([dbo].[fcn_IsCurrentFormBody]([FormID],[FormVersion])),
	[Answers] [xml] NOT NULL,
	[GetHTMLWithOptions]  AS ([dbo].[fcn_GetFormHtmlWithOptions]([FormBodyID],(1))),
	[GetHTMLWithCSSOnly]  AS ([dbo].[fcn_GetFormHtmlWithOptions]([FormBodyID],(0))),
 CONSTRAINT [PK_FormBody] PRIMARY KEY CLUSTERED 
(
	[FormBodyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormBodyContract]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormBodyContract](
	[ContractId] [int] NOT NULL,
	[FormBodyId] [int] NOT NULL,
 CONSTRAINT [PK_FormBodyContract] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC,
	[FormBodyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormBodyCSS]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormBodyCSS](
	[FormBodyCSSID] [int] IDENTITY(1,1) NOT NULL,
	[FormBodyID] [int] NOT NULL,
	[CSSID] [int] NOT NULL,
 CONSTRAINT [PK_FormBodyCSS] PRIMARY KEY CLUSTERED 
(
	[FormBodyCSSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormBodyHeaderFooter]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormBodyHeaderFooter](
	[FormBodyHeaderFooterID] [int] IDENTITY(1,1) NOT NULL,
	[FormBodyID] [int] NOT NULL,
	[HeaderFooterID] [int] NOT NULL,
 CONSTRAINT [PK_FormBodyHeaderFooter] PRIMARY KEY CLUSTERED 
(
	[FormBodyHeaderFooterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormBodyScript]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormBodyScript](
	[FormBodyScriptID] [int] IDENTITY(1,1) NOT NULL,
	[FormBodyID] [int] NOT NULL,
	[ScriptID] [int] NOT NULL,
 CONSTRAINT [PK_FormBodyScript] PRIMARY KEY CLUSTERED 
(
	[FormBodyScriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeaderFooter]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HeaderFooter](
	[HeaderFooterID] [int] IDENTITY(1,1) NOT NULL,
	[Header] [varchar](max) NULL,
	[Footer] [varchar](max) NULL,
	[Description] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_HeaderFooter] PRIMARY KEY CLUSTERED 
(
	[HeaderFooterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PushLog]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PushLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[PushedTo] [varchar](20) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[FormCode] [varchar](20) NOT NULL,
	[FormBodyVersion] [int] NOT NULL,
 CONSTRAINT [PK_PushLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Script_Options]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Script_Options](
	[ScriptID] [int] IDENTITY(1,1) NOT NULL,
	[Script] [varchar](max) NOT NULL,
	[ScriptDescription] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Script_Options] PRIMARY KEY CLUSTERED 
(
	[ScriptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteSections]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteSections](
	[SiteSectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SiteSections] PRIMARY KEY CLUSTERED 
(
	[SiteSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSiteSections]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSiteSections](
	[UserSiteSectionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SiteSectionID] [int] NOT NULL,
 CONSTRAINT [PK_UserSiteSections] PRIMARY KEY CLUSTERED 
(
	[UserSiteSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwFormBodies]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[vwFormBodies] AS
SELECT FormBodyID, FormID, FormVersion, IsCurrent FROM FormBody

GO
/****** Object:  View [dbo].[vwForms]    Script Date: 5/9/2023 9:37:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[vwForms] AS
SELECT FormID, FormCode, FormName, FormDescription, IsObsolete FROM Form

GO
/****** Object:  Index [IDX_dbo_FormBody_FormID]    Script Date: 5/9/2023 9:37:25 AM ******/
CREATE NONCLUSTERED INDEX [IDX_dbo_FormBody_FormID] ON [dbo].[FormBody]
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FormBodyHeaderFooter_FormBodyID]    Script Date: 5/9/2023 9:37:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FormBodyHeaderFooter_FormBodyID] ON [dbo].[FormBodyHeaderFooter]
(
	[FormBodyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users_Username]    Script Date: 5/9/2023 9:37:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[FormAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FormAnswers_FormBody] FOREIGN KEY([FormBodyID])
REFERENCES [dbo].[FormBody] ([FormBodyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormAnswers] CHECK CONSTRAINT [FK_FormAnswers_FormBody]
GO
ALTER TABLE [dbo].[FormAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FormAnswers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FormAnswers] CHECK CONSTRAINT [FK_FormAnswers_Users]
GO
ALTER TABLE [dbo].[FormBody]  WITH CHECK ADD  CONSTRAINT [FK_FormBody_Form] FOREIGN KEY([FormID])
REFERENCES [dbo].[Form] ([FormID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBody] CHECK CONSTRAINT [FK_FormBody_Form]
GO
ALTER TABLE [dbo].[FormBodyContract]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyContract_FormBody] FOREIGN KEY([FormBodyId])
REFERENCES [dbo].[FormBody] ([FormBodyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyContract] CHECK CONSTRAINT [FK_FormBodyContract_FormBody]
GO
ALTER TABLE [dbo].[FormBodyCSS]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyCSS_CSS_Options] FOREIGN KEY([CSSID])
REFERENCES [dbo].[CSS_Options] ([CSSID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyCSS] CHECK CONSTRAINT [FK_FormBodyCSS_CSS_Options]
GO
ALTER TABLE [dbo].[FormBodyCSS]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyCSS_FormBody] FOREIGN KEY([FormBodyID])
REFERENCES [dbo].[FormBody] ([FormBodyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyCSS] CHECK CONSTRAINT [FK_FormBodyCSS_FormBody]
GO
ALTER TABLE [dbo].[FormBodyHeaderFooter]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyHeaderFooter_FormBody] FOREIGN KEY([FormBodyID])
REFERENCES [dbo].[FormBody] ([FormBodyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyHeaderFooter] CHECK CONSTRAINT [FK_FormBodyHeaderFooter_FormBody]
GO
ALTER TABLE [dbo].[FormBodyHeaderFooter]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyHeaderFooter_HeaderFooter] FOREIGN KEY([HeaderFooterID])
REFERENCES [dbo].[HeaderFooter] ([HeaderFooterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyHeaderFooter] CHECK CONSTRAINT [FK_FormBodyHeaderFooter_HeaderFooter]
GO
ALTER TABLE [dbo].[FormBodyScript]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyScript_FormBody] FOREIGN KEY([FormBodyID])
REFERENCES [dbo].[FormBody] ([FormBodyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyScript] CHECK CONSTRAINT [FK_FormBodyScript_FormBody]
GO
ALTER TABLE [dbo].[FormBodyScript]  WITH CHECK ADD  CONSTRAINT [FK_FormBodyScript_Script_Options] FOREIGN KEY([ScriptID])
REFERENCES [dbo].[Script_Options] ([ScriptID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FormBodyScript] CHECK CONSTRAINT [FK_FormBodyScript_Script_Options]
GO
ALTER TABLE [dbo].[UserSiteSections]  WITH CHECK ADD  CONSTRAINT [FK_UserSiteSections_SiteSections] FOREIGN KEY([SiteSectionID])
REFERENCES [dbo].[SiteSections] ([SiteSectionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSiteSections] CHECK CONSTRAINT [FK_UserSiteSections_SiteSections]
GO
ALTER TABLE [dbo].[UserSiteSections]  WITH CHECK ADD  CONSTRAINT [FK_UserSiteSections_UserSiteSections] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSiteSections] CHECK CONSTRAINT [FK_UserSiteSections_UserSiteSections]
GO
USE [master]
GO
ALTER DATABASE [FormManagerTest] SET  READ_WRITE 
GO
