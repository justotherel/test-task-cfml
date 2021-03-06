USE [CFMLDB]
GO
/****** Object:  Table [dbo].[issue]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issue](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[short_decsription] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[created_by] [nvarchar](25) NOT NULL,
	[status] [int] NOT NULL,
	[urgency] [int] NOT NULL,
	[severity] [int] NOT NULL,
 CONSTRAINT [PK_issue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[issue_history]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issue_history](
	[id] [int] IDENTITY(100,1) NOT NULL,
	[issue_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[type] [nvarchar](25) NOT NULL,
	[commentary] [nvarchar](255) NULL,
	[username] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_issue_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[severity]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[severity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[severity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_severity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urgency]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urgency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[urgency] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_urgency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14.06.2021 23:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [nvarchar](25) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[issue] ADD  CONSTRAINT [DF_issue_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[issue_history] ADD  CONSTRAINT [DF_issue_history_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FK_issue_severity] FOREIGN KEY([severity])
REFERENCES [dbo].[severity] ([id])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_severity]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FK_issue_status] FOREIGN KEY([status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_status]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FK_issue_urgency] FOREIGN KEY([urgency])
REFERENCES [dbo].[urgency] ([id])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_urgency]
GO
ALTER TABLE [dbo].[issue]  WITH CHECK ADD  CONSTRAINT [FK_issue_user] FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[issue] CHECK CONSTRAINT [FK_issue_user]
GO
ALTER TABLE [dbo].[issue_history]  WITH CHECK ADD  CONSTRAINT [FK_issue_history_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[issue_history] CHECK CONSTRAINT [FK_issue_history_users]
GO
