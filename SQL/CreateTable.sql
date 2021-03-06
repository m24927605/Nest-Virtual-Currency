USE [BitCoin]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 2017/12/29 下午 05:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Status] [tinyint] NOT NULL,
	[CanGetQuoteProice] [tinyint] NOT NULL,
	[CanGetHistoryProice] [tinyint] NOT NULL,
	[CanGetNews] [tinyint] NOT NULL,
	[CanChat] [tinyint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedUser] [varchar](50) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2017/12/29 下午 05:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Passowrd] [varchar](100) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLogoutTime] [datetime] NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedUser] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 2017/12/29 下午 05:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[LoginTime] [datetime] NULL,
	[LogoutTime] [datetime] NULL,
	[CreateTime] [datetime] NULL,
	[CreateUser] [varchar](50) NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedUser] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2017/12/29 下午 05:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedUser] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2017/12/29 下午 05:28:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Birthday] [datetime] NULL,
	[Email] [varchar](100) NOT NULL,
	[OtherEmail] [varchar](100) NULL,
	[Phone] [varchar](30) NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[ModifiedUser] [varchar](50) NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_CanGetQuoteProice]  DEFAULT ((1)) FOR [CanGetQuoteProice]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_CanGetHistoryProice]  DEFAULT ((1)) FOR [CanGetHistoryProice]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_CanGetNews]  DEFAULT ((1)) FOR [CanGetNews]
GO
ALTER TABLE [dbo].[Features] ADD  CONSTRAINT [DF_Features_CanChat]  DEFAULT ((1)) FOR [CanChat]
GO
ALTER TABLE [dbo].[Login] ADD  CONSTRAINT [DF_Login_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ((1)) FOR [Status]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:停用、1:啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Login', @level2type=N'COLUMN',@level2name=N'Status'
GO
