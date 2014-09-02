/****** Object:  Table [dbo].[ContactRequest]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContactRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ContactRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] ON
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (1, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Ich will Kontakt aufnehmen', N'Hallo bitte meldet euch mal.', CAST(0x0000A379009AB6B6 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (2, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Warum meldet sich keiner', N'Ich will immer noch Kontakt.', CAST(0x0000A379009B5C20 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (3, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Meldet euch :`(', N'Ich will immer noch Kontakt.', CAST(0x0000A379009BE058 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (4, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Hallo', N'ich bin wider da', CAST(0x0000A37A00E9D00D AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (5, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'test', N'dfgdfg', CAST(0x0000A37E00F9743A AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (6, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'test', N'dfgdfg', CAST(0x0000A37E00F98D2B AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (7, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'Test', N'test', CAST(0x0000A37E00F9E6D8 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (8, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'asdasdasdasd', N'sdfsdf', CAST(0x0000A37E00FA5C3E AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (9, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'sdfhhsdfsdfh', N'sdljkfhlksdjfsfsdf', CAST(0x0000A37E00FAAAA8 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (10, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'sdf', N'sdfsdfsf
', CAST(0x0000A37E0102EFA0 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (11, N'be5b8b47-3f87-429f-be06-bc31f68e178a', N'sdfsdf', N'sdf', CAST(0x0000A37E0105EF0C AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (12, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'TestCase', N'Ein Test', CAST(0x0000A37E010C0156 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (13, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'sdf', NULL, CAST(0x0000A37E01193CC5 AS DateTime))
INSERT [dbo].[ContactRequest] ([ID], [UserID], [Subject], [Message], [CreatedAt]) VALUES (14, N'1e74143e-33b3-4004-a704-78b0e0d19b29', NULL, NULL, CAST(0x0000A37F00A27468 AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactRequest] OFF
/****** Object:  Table [dbo].[PersonalData]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonalData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PostCode] [nvarchar](5) NULL,
	[Mobile] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastEditAt] [datetime] NULL,
	[Salutation] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PersonalData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[PersonalData] ON
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (1, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A378010C01C4 AS DateTime), CAST(0x0000A37F00AFDAAB AS DateTime), N'Herr')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (2, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37E0113CB37 AS DateTime), CAST(0x0000A37E0113CB37 AS DateTime), N'zu8piopuiop')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (3, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37E0113D9B8 AS DateTime), CAST(0x0000A37E0113D93E AS DateTime), N'sadfasdfasdf')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (4, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37E01140AD4 AS DateTime), CAST(0x0000A37E0113F4FB AS DateTime), N'7689')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (5, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37E01144F01 AS DateTime), CAST(0x0000A37E01144F01 AS DateTime), N'00ß80ß')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (6, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37E011687CF AS DateTime), CAST(0x0000A37E011686C9 AS DateTime), N'465465')
INSERT [dbo].[PersonalData] ([ID], [UserID], [FirstName], [LastName], [Email], [PostCode], [Mobile], [CreatedAt], [LastEditAt], [Salutation]) VALUES (7, N'1e74143e-33b3-4004-a704-78b0e0d19b29', N'Sebastian', N'van Elten', N'sve@joinmedia.de', N'45481', N'4917624121558', CAST(0x0000A37F00A1A84A AS DateTime), CAST(0x0000A37F00A1A849 AS DateTime), N'4234214')
SET IDENTITY_INSERT [dbo].[PersonalData] OFF
/****** Object:  Table [dbo].[sysuser]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysuser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysuser](
	[sysuser_id] [uniqueidentifier] NOT NULL,
	[sysuser_apikey] [uniqueidentifier] NULL,
	[sysuser_login] [nvarchar](64) NOT NULL,
	[sysuser_password] [nvarchar](64) NULL,
	[sysuser_firstname] [nvarchar](128) NULL,
	[sysuser_surname] [nvarchar](128) NULL,
	[sysuser_email] [nvarchar](128) NULL,
	[sysuser_group_id] [uniqueidentifier] NULL,
	[sysuser_culture] [nvarchar](5) NULL,
	[sysuser_last_login] [datetime] NULL,
	[sysuser_prev_login] [datetime] NULL,
	[sysuser_locked] [bit] NOT NULL,
	[sysuser_locked_until] [datetime] NULL,
	[sysuser_created] [datetime] NOT NULL,
	[sysuser_updated] [datetime] NOT NULL,
	[sysuser_created_by] [uniqueidentifier] NULL,
	[sysuser_updated_by] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sysuser_id] PRIMARY KEY CLUSTERED 
(
	[sysuser_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'fe868d4f-797c-4e60-b876-64e6fc2424aa', N'sys', NULL, NULL, NULL, NULL, N'7c536b66-d292-4369-8f37-948b32229b83', NULL, NULL, NULL, 0, NULL, CAST(0x0000A37900CAEEB3 AS DateTime), CAST(0x0000A37900CAEEB3 AS DateTime), NULL, NULL)
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'0da356f4-4774-4ea1-adb3-92071edbf905', NULL, N'svanelten', N'Y3mDGLMjneul5AqD46g3G/mI3j5wO3JhfkpIMWh4JKE=', NULL, NULL, N'sve@gravitydesign.de', N'7c536b66-d292-4369-8f37-948b32229b83', NULL, CAST(0x0000A39900AEA3DC AS DateTime), CAST(0x0000A39500BFACFD AS DateTime), 0, NULL, CAST(0x0000A37900CAF36D AS DateTime), CAST(0x0000A39900AEA3DF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'a058c673-39bb-459c-9f28-d93545cec7be', NULL, N'joinmedia', N'lDlVcaIuOE//2t1okvjvu2t+1xPLfQ1TGyDxkd9pJiQ=', N'Johnny', N'Media', N'dz@joinmedia.de', N'7c536b66-d292-4369-8f37-948b32229b83', NULL, CAST(0x0000A39A009A6584 AS DateTime), CAST(0x0000A39900FC913F AS DateTime), 0, NULL, CAST(0x0000A38500B29BE2 AS DateTime), CAST(0x0000A39A009A6585 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Table [dbo].[relation]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[relation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[relation](
	[relation_id] [uniqueidentifier] NOT NULL,
	[relation_draft] [bit] NOT NULL,
	[relation_type] [nvarchar](16) NOT NULL,
	[relation_data_id] [uniqueidentifier] NOT NULL,
	[relation_related_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_relation_id] PRIMARY KEY CLUSTERED 
(
	[relation_id] ASC,
	[relation_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[relation] ([relation_id], [relation_draft], [relation_type], [relation_data_id], [relation_related_id]) VALUES (N'ea2270a0-557e-4a62-8035-d0ae66796ce1', 0, N'CONTENTCATEGORY', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1')
/****** Object:  Table [dbo].[page]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[page]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[page](
	[page_id] [uniqueidentifier] NOT NULL,
	[page_sitetree_id] [uniqueidentifier] NOT NULL,
	[page_original_id] [uniqueidentifier] NULL,
	[page_draft] [bit] NOT NULL,
	[page_template_id] [uniqueidentifier] NOT NULL,
	[page_group_id] [uniqueidentifier] NULL,
	[page_group_disable_id] [ntext] NULL,
	[page_parent_id] [uniqueidentifier] NULL,
	[page_permalink_id] [uniqueidentifier] NOT NULL,
	[page_seqno] [int] NOT NULL,
	[page_title] [nvarchar](128) NOT NULL,
	[page_navigation_title] [nvarchar](128) NULL,
	[page_is_hidden] [bit] NOT NULL,
	[page_keywords] [nvarchar](128) NULL,
	[page_description] [nvarchar](255) NULL,
	[page_attachments] [ntext] NULL,
	[page_controller] [nvarchar](128) NULL,
	[page_view] [nvarchar](128) NULL,
	[page_redirect] [nvarchar](128) NULL,
	[page_created] [datetime] NOT NULL,
	[page_updated] [datetime] NOT NULL,
	[page_published] [datetime] NULL,
	[page_last_published] [datetime] NULL,
	[page_last_modified] [datetime] NULL,
	[page_created_by] [uniqueidentifier] NOT NULL,
	[page_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_page_id] PRIMARY KEY CLUSTERED 
(
	[page_id] ASC,
	[page_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'70f2b68d-cf8e-4d80-8843-8807ff28103a', 2, N'2. Ebene', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'70f2b68d-cf8e-4d80-8843-8807ff28103a', 2, N'2. Ebene', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, N'[]', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'2e168001-d113-4216-acc5-03c61c2d0c21', 1, N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, N'[]', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'2e168001-d113-4216-acc5-03c61c2d0c21', 1, N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'06ca675f-3118-489d-ac25-c4bd09a0bfde', NULL, N'[]', NULL, N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', 1, N'Willkommen. Das ist die JBS!', N'Startseite', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A393011A231C AS DateTime), CAST(0x0000A3880144F510 AS DateTime), CAST(0x0000A393011A231C AS DateTime), CAST(0x0000A393011A231C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'06ca675f-3118-489d-ac25-c4bd09a0bfde', NULL, N'[]', NULL, N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', 1, N'Willkommen. Das ist die JBS!', N'Startseite', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A393011A231C AS DateTime), CAST(0x0000A3880144F510 AS DateTime), CAST(0x0000A393011A231C AS DateTime), CAST(0x0000A393011A231C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'747b1318-4f07-48e9-94f2-58cb61640eae', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'3a2fd452-5f49-4d60-b773-60170b6e9a14', 1, N'Leve 1 Page', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF672E AS DateTime), CAST(0x0000A39200BC82FC AS DateTime), CAST(0x0000A39200BF672E AS DateTime), CAST(0x0000A39200BF672E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'747b1318-4f07-48e9-94f2-58cb61640eae', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'3a2fd452-5f49-4d60-b773-60170b6e9a14', 1, N'Leve 1 Page', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF672E AS DateTime), CAST(0x0000A39200BC82FC AS DateTime), CAST(0x0000A39200BF672E AS DateTime), CAST(0x0000A39200BF672E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', 3, N'Ganz vorne dabei', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A38801261225 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', 3, N'Ganz vorne dabei', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A38801261225 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'258b2bda-f282-429e-8e93-a1c919fbabba', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'eefe0d70-a5a7-4ed4-b32e-800fb25268ba', 4, N'Level2', N'Level2', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38E0114048C AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A38E0115434C AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'258b2bda-f282-429e-8e93-a1c919fbabba', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'eefe0d70-a5a7-4ed4-b32e-800fb25268ba', 4, N'Level2', N'Level2', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38E0114048C AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A38E0115434C AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', NULL, N'[]', NULL, N'398e5409-bfe3-4db6-ae0d-8db92322b31f', 2, N'Q & A', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A39501143442 AS DateTime), CAST(0x0000A38D00EB053C AS DateTime), CAST(0x0000A39501143442 AS DateTime), CAST(0x0000A39501143442 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', NULL, N'[]', NULL, N'398e5409-bfe3-4db6-ae0d-8db92322b31f', 2, N'Q & A', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A39501143442 AS DateTime), CAST(0x0000A38D00EB053C AS DateTime), CAST(0x0000A39501143442 AS DateTime), CAST(0x0000A39501143442 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
/****** Object:  Table [dbo].[pagetemplate]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pagetemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pagetemplate](
	[pagetemplate_id] [uniqueidentifier] NOT NULL,
	[pagetemplate_name] [nvarchar](64) NOT NULL,
	[pagetemplate_description] [nvarchar](255) NULL,
	[pagetemplate_preview] [ntext] NULL,
	[pagetemplate_page_regions] [ntext] NULL,
	[pagetemplate_properties] [ntext] NULL,
	[pagetemplate_controller] [nvarchar](128) NULL,
	[pagetemplate_controller_show] [bit] NOT NULL,
	[pagetemplate_view] [nvarchar](128) NULL,
	[pagetemplate_view_show] [bit] NOT NULL,
	[pagetemplate_redirect] [nvarchar](128) NULL,
	[pagetemplate_redirect_show] [bit] NOT NULL,
	[pagetemplate_site_template] [bit] NOT NULL,
	[pagetemplate_type] [nvarchar](255) NULL,
	[pagetemplate_created] [datetime] NOT NULL,
	[pagetemplate_updated] [datetime] NOT NULL,
	[pagetemplate_created_by] [uniqueidentifier] NOT NULL,
	[pagetemplate_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_pagetemplate_id] PRIMARY KEY CLUSTERED 
(
	[pagetemplate_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 1, NULL, CAST(0x0000A37900CAEEE7 AS DateTime), CAST(0x0000A37900CAEEE7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'FaqPage', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'FaqPage', 0, NULL, 0, 0, NULL, CAST(0x0000A38B0108A470 AS DateTime), CAST(0x0000A38D00EAD062 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Level1', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level1', 0, NULL, 0, 0, NULL, CAST(0x0000A38E0112B564 AS DateTime), CAST(0x0000A39200B8B24C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Level2', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level2', 0, NULL, 0, 0, NULL, CAST(0x0000A38E0112CA7C AS DateTime), CAST(0x0000A39501168962 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Stage', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, NULL, 0, NULL, 0, 0, NULL, CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFB2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Level0', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level0', 0, NULL, 0, 0, NULL, CAST(0x0000A38801042CB0 AS DateTime), CAST(0x0000A38E012EE1BE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'906761ea-6c04-4f4b-9365-f2c350ff4372', N'Standard page', N'Standard page type.', N'<table class="template"><tr><td id="Content"></td></tr></table>', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, CAST(0x0000A37900CAEEC7 AS DateTime), CAST(0x0000A37900CAEEC7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[posttemplate]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posttemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[posttemplate](
	[posttemplate_id] [uniqueidentifier] NOT NULL,
	[posttemplate_permalink_id] [uniqueidentifier] NULL,
	[posttemplate_name] [nvarchar](64) NOT NULL,
	[posttemplate_description] [nvarchar](255) NULL,
	[posttemplate_preview] [ntext] NULL,
	[posttemplate_properties] [ntext] NULL,
	[posttemplate_controller] [nvarchar](128) NULL,
	[posttemplate_controller_show] [bit] NOT NULL,
	[posttemplate_view] [nvarchar](128) NULL,
	[posttemplate_view_show] [bit] NOT NULL,
	[posttemplate_archive_controller] [nvarchar](128) NULL,
	[posttemplate_archive_controller_show] [bit] NOT NULL,
	[posttemplate_rss] [bit] NOT NULL,
	[posttemplate_type] [nvarchar](255) NULL,
	[posttemplate_created] [datetime] NOT NULL,
	[posttemplate_updated] [datetime] NOT NULL,
	[posttemplate_created_by] [uniqueidentifier] NOT NULL,
	[posttemplate_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_posttemplate_id] PRIMARY KEY CLUSTERED 
(
	[posttemplate_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[posttemplate] ([posttemplate_id], [posttemplate_permalink_id], [posttemplate_name], [posttemplate_description], [posttemplate_preview], [posttemplate_properties], [posttemplate_controller], [posttemplate_controller_show], [posttemplate_view], [posttemplate_view_show], [posttemplate_archive_controller], [posttemplate_archive_controller_show], [posttemplate_rss], [posttemplate_type], [posttemplate_created], [posttemplate_updated], [posttemplate_created_by], [posttemplate_updated_by]) VALUES (N'5017dbe4-5685-4941-921b-ca922edc7a12', NULL, N'Standard post', N'Standard post type.', N'<table class="template"><tr><td></td></tr></table>', NULL, NULL, 0, NULL, 0, NULL, 0, 1, NULL, CAST(0x0000A37900CAEEE1 AS DateTime), CAST(0x0000A37900CAEEE1 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[category]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[category](
	[category_id] [uniqueidentifier] NOT NULL,
	[category_parent_id] [uniqueidentifier] NULL,
	[category_permalink_id] [uniqueidentifier] NOT NULL,
	[category_name] [nvarchar](64) NOT NULL,
	[category_description] [nvarchar](255) NULL,
	[category_created] [datetime] NOT NULL,
	[category_updated] [datetime] NOT NULL,
	[category_created_by] [uniqueidentifier] NOT NULL,
	[category_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_category_id] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'1248b2e6-451c-4b1a-ae0d-44718231ff35', NULL, N'02a1ac67-4339-4d2d-a53a-e8fdd80e0213', N'MidTeaser', NULL, CAST(0x0000A38B008E5653 AS DateTime), CAST(0x0000A38B008E5653 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', NULL, N'3c3e5513-a8ff-4844-aa1e-6f89675470d9', N'SmallTeaser', NULL, CAST(0x0000A38B008E4388 AS DateTime), CAST(0x0000A38B008E4ED0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1', NULL, N'6f6df54c-72f6-4953-9476-17d042b6b03c', N'LargeTeaser', NULL, CAST(0x0000A38B008E5F89 AS DateTime), CAST(0x0000A38B008E5F89 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Table [dbo].[sysgroup]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysgroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysgroup](
	[sysgroup_id] [uniqueidentifier] NOT NULL,
	[sysgroup_parent_id] [uniqueidentifier] NULL,
	[sysgroup_name] [nvarchar](64) NOT NULL,
	[sysgroup_description] [nvarchar](255) NULL,
	[sysgroup_created] [datetime] NOT NULL,
	[sysgroup_updated] [datetime] NOT NULL,
	[sysgroup_created_by] [uniqueidentifier] NULL,
	[sysgroup_updated_by] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sysgroup_id] PRIMARY KEY CLUSTERED 
(
	[sysgroup_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'798bc71a-98e2-4e2a-8ddb-21537f6004b7', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'Entwickler', NULL, CAST(0x0000A37A00B4532E AS DateTime), CAST(0x0000A37A00B4532E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'7c536b66-d292-4369-8f37-948b32229b83', NULL, N'Systemadministrator', N'System administrator group with full permissions.', CAST(0x0000A37900CAEEB4 AS DateTime), CAST(0x0000A37900CAEEB4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'8940b41a-e3a9-44f3-b564-bfd281416141', N'7c536b66-d292-4369-8f37-948b32229b83', N'Administrator', N'Web site administrator group.', CAST(0x0000A37900CAEEB5 AS DateTime), CAST(0x0000A37900CAEEB5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[sysaccess]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysaccess]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysaccess](
	[sysaccess_id] [uniqueidentifier] NOT NULL,
	[sysaccess_group_id] [uniqueidentifier] NOT NULL,
	[sysaccess_function] [nvarchar](64) NOT NULL,
	[sysaccess_description] [nvarchar](255) NULL,
	[sysaccess_locked] [bit] NOT NULL,
	[sysaccess_created] [datetime] NOT NULL,
	[sysaccess_updated] [datetime] NOT NULL,
	[sysaccess_created_by] [uniqueidentifier] NULL,
	[sysaccess_updated_by] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sysaccess_id] PRIMARY KEY CLUSTERED 
(
	[sysaccess_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'08d17dbf-cd1d-40a9-b558-0866210ac4ec', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_GROUP', N'Access to add, update and delete user groups.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'da291f10-5bb6-44a5-ae20-1c9932c870e9', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_PAGE_PUBLISH', N'Access to publish, depublish and delete pages.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'f65bd7dd-6dfe-45b7-87e3-20a11e1f8d55', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_COMMENT', N'Access to administrate comments.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'222119de-a510-427f-92ff-3d357bdf0c2c', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CONTENT_PUBLISH', N'Access to publish, depublish and delete images & documents.', 1, CAST(0x0000A37900CAEEBA AS DateTime), CAST(0x0000A37900CAEEBA AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'f71ca1b9-1276-4c3e-a090-5fba6c4980ce', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_SITETREE', N'Access to administrate site trees.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'4fbdedb7-10ec-4a10-8f82-7d4c5cf61f2c', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN', N'Access to login to the admin panel.', 1, CAST(0x0000A37900CAEEB5 AS DateTime), CAST(0x0000A37900CAEEB5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'0f367b04-ef7b-4007-88bd-7d78cbdea64a', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_ACCESS', N'Access to add, update and delete access rules.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'c8b44826-d3e6-4add-b241-8ce95429a17e', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_POST', N'Access to add and update posts.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'8a4ca0f3-261b-4689-8c1f-98065b65f9ee', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_USER', N'Access to add, update and delete users.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'1bb90c7d-f3dd-43fe-aff5-985368d316e6', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_POST_PUBLISH', N'Access to publish, depublish and delete posts.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'e08ae820-d438-4a38-b6e1-ac3aca3cf933', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CONTENT', N'Access to add and update images & documents.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'36fbc1ad-4e17-4767-9fdc-af92802e5ebb', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_PAGE', N'Access to add and update pages.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'00074fd5-6c81-4181-8a09-ba6ef94f8364', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_PAGE_TEMPLATE', N'Access to add, update and delete page types.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'0c19578a-d6c0-45f8-9ffd-bcffa5d84772', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_PARAM', N'Access to add, update and delete system parameters.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'ff296d65-d24d-446a-8f02-d93a7ab57086', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_POST_TEMPLATE', N'Access to add, update and delete post types.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'79ed0e9e-188c-4c5b-81ba-db15bb9f8ad5', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CATEGORY', N'Access to add, update and delete categories.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[sysparam]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysparam]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysparam](
	[sysparam_id] [uniqueidentifier] NOT NULL,
	[sysparam_name] [nvarchar](64) NOT NULL,
	[sysparam_value] [nvarchar](128) NULL,
	[sysparam_description] [nvarchar](255) NULL,
	[sysparam_locked] [bit] NOT NULL,
	[sysparam_created] [datetime] NOT NULL,
	[sysparam_updated] [datetime] NOT NULL,
	[sysparam_created_by] [uniqueidentifier] NULL,
	[sysparam_updated_by] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sysparam_id] PRIMARY KEY CLUSTERED 
(
	[sysparam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'08e8a582-7825-43b2-a12d-2522889f04be', N'IMAGE_MAX_WIDTH', N'940', N'Maximum width for uploaded images.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'4c694949-dee0-465e-ab08-253927bdcbd8', N'SITE_PRIVATE_KEY', N'CE03A696D4C24918', N'The private key used for public key encryption.', 1, CAST(0x0000A37900CAEEC1 AS DateTime), CAST(0x0000A37900CAEEC1 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'c08b1891-aba2-4e0d-ad61-2abdfba81a59', N'CACHE_PUBLIC_EXPIRES', N'0', N'How many minutes browsers are allowed to cache public content.', 1, CAST(0x0000A37900CAEEBE AS DateTime), CAST(0x0000A37900CAEEBE AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'5a0d6307-f041-41a1-b63a-563e712f3b8c', N'HIERARCHICAL_PERMALINKS', N'1', N'Weather or not permalink generation should be hierarchical.', 1, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900FD82E8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'48bdf688-ba95-46b4-91c7-6a8430f387ff', N'CACHE_PUBLIC_MAXAGE', N'0', N'How many minutes cached content is valid in the browser.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'cf06bf4c-c426-4047-8e5e-6e0082aaf1bf', N'SITE_LAST_MODIFIED', N'Sep  2 2014  9:17AM', N'Global last modification date.', 1, CAST(0x0000A37900CAEEBE AS DateTime), CAST(0x0000A37900CAEEBE AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'095502dd-d655-4001-86f9-97d18222a548', N'SITEMAP_EXPANDED_LEVELS', N'0', N'The number of pre-expanded levels in the manager panel for the page list.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'a64a8479-8125-47ba-9980-b30b36e744d3', N'RSS_USE_EXCERPT', N'1', N'Weather to use an excerpt in the feeds or export the full content.', 1, CAST(0x0000A37900CAEEC0 AS DateTime), CAST(0x0000A37900CAEEC0 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'40230360-71ce-441e-a8df-d50cfa79acc2', N'RSS_NUM_POSTS', N'10', N'The maximum number posts to be exported in a feed. For an infinite amount of posts, use the value 0.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'9a14664f-806d-4a4f-9a72-e8368fb358d5', N'SITE_VERSION', N'32', N'The currently installed version of Piranha.', 1, CAST(0x0000A37900CAEEBB AS DateTime), CAST(0x0000A37900CAEEBB AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[syslog]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[syslog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[syslog](
	[syslog_id] [uniqueidentifier] NOT NULL,
	[syslog_parent_id] [uniqueidentifier] NOT NULL,
	[syslog_parent_type] [nvarchar](128) NOT NULL,
	[syslog_action] [nvarchar](64) NOT NULL,
	[syslog_created] [datetime] NOT NULL,
	[syslog_updated] [datetime] NOT NULL,
	[syslog_created_by] [uniqueidentifier] NOT NULL,
	[syslog_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_syslog_id] PRIMARY KEY CLUSTERED 
(
	[syslog_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a222d44d-d96a-4777-b2a7-004c54e632b2', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'UPDATE', CAST(0x0000A3880125E0CD AS DateTime), CAST(0x0000A3880125E0CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83502e11-441d-478c-9441-00b616f3654e', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'INSERT', CAST(0x0000A37900F87D97 AS DateTime), CAST(0x0000A37900F87D97 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e20568e5-93ea-45c6-bcd1-015a5546f575', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39501185836 AS DateTime), CAST(0x0000A39501185836 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0bb79cb-d1c0-407f-9b10-017ca5200186', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D48 AS DateTime), CAST(0x0000A38B009A6D48 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2de8a075-0980-4720-a14c-019856af4dbd', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01067DE3 AS DateTime), CAST(0x0000A38D01067DE3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a693880d-99f4-4ad7-ac81-026cb5aba176', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0672 AS DateTime), CAST(0x0000A39200BF0672 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'681737c4-9a68-4088-9558-02e948a7a17c', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0098208A AS DateTime), CAST(0x0000A38D0098208A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd31c53d5-5ea2-4df1-afef-02eaa6e17b34', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC601A AS DateTime), CAST(0x0000A39200BC601A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1250e0ff-f36b-4d09-bd9a-02f9b3b914aa', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01065E8A AS DateTime), CAST(0x0000A38D01065E8A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2ea95f72-b03d-4259-a29d-032a5eda37d4', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'INSERT', CAST(0x0000A39500FA6680 AS DateTime), CAST(0x0000A39500FA6680 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9d766823-6970-459b-86ae-05fc05bc6e51', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0670 AS DateTime), CAST(0x0000A39200BF0670 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'481390db-1659-4188-8a18-063db4c2e280', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DEE208 AS DateTime), CAST(0x0000A39900DEE208 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a3e142cc-dee7-4d8c-af4c-06ce7e4a611a', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38801255CEF AS DateTime), CAST(0x0000A38801255CEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0f6ae47-1b19-4a10-9988-06f3c5b790ee', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA5C AS DateTime), CAST(0x0000A38B0094CA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b7a8b005-1a0f-4d22-8611-0787fabef2c9', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38D00EAD06A AS DateTime), CAST(0x0000A38D00EAD06A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e8c74ec-97a3-4e14-ba73-07bf40de98d1', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00984CA4 AS DateTime), CAST(0x0000A38D00984CA4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4508560b-cb53-4121-abbf-093b1e8e2c54', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DE554B AS DateTime), CAST(0x0000A39900DE554B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3b130c97-4c78-4648-9a1b-094999248580', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38801255CEE AS DateTime), CAST(0x0000A38801255CEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eecd4077-fba6-4c20-9d22-09deb3cfd313', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A3950116A649 AS DateTime), CAST(0x0000A3950116A649 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9fc80145-6f75-433d-8f9e-09e34e2e7d7c', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D8A960 AS DateTime), CAST(0x0000A38D00D8A960 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1168fe40-2372-4d7c-81d5-0abced85e77d', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0663 AS DateTime), CAST(0x0000A39200BF0663 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'736ed2ff-647f-4525-8c71-0b9b45f30090', N'3e9e83bd-0b7f-49ea-833e-9562ac4b1a8d', N'PAGE', N'DELETE', CAST(0x0000A38C01072CDC AS DateTime), CAST(0x0000A38C01072CDC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ac662cad-d104-4090-9078-0bc384a04fa7', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010EF94E AS DateTime), CAST(0x0000A388010EF94E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f01923d8-8ddb-4420-a4a7-0c0e623ddcaf', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF1D49 AS DateTime), CAST(0x0000A39200BF1D49 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'30f437a6-06ce-4a1d-a026-0c105757e982', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BC2B4B AS DateTime), CAST(0x0000A39200BC2B4B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9f082525-09b9-4621-89bd-0e010249e6aa', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B87 AS DateTime), CAST(0x0000A38B009B8B87 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'db5cb352-3790-49a1-a1bd-0f9f28e452c1', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A3950117B542 AS DateTime), CAST(0x0000A3950117B543 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7ea7dbe3-d37f-45fc-9529-103f00a85613', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B00948A9F AS DateTime), CAST(0x0000A38B00948A9F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'22d3bdd6-c8a5-49ab-9430-10536a142d3c', N'037c1a14-7021-4d6b-b438-959065aee3c1', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A6719F AS DateTime), CAST(0x0000A38600A6719F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fe0a7876-80c9-4b8c-93d6-1099718db689', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D008E5AA3 AS DateTime), CAST(0x0000A38D008E5AA3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'60ad9a66-0c2a-41fc-8f05-1102b88d3dd6', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CC0EE AS DateTime), CAST(0x0000A38E011CC0EE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8beff2c1-7555-4641-89f8-121557769826', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A3850130767F AS DateTime), CAST(0x0000A3850130767F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'adbcc4c9-142a-4ebe-82de-123a0cbdddf5', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF83A AS DateTime), CAST(0x0000A39200BEF83A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ca997eb-a0fc-4305-8990-1397b4687492', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388011D9044 AS DateTime), CAST(0x0000A388011D9044 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd0cd1b53-6764-4abf-a7d6-148dad75f1bc', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472E AS DateTime), CAST(0x0000A38B009A472E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3225251e-b87b-4975-8f17-14ac7b950a21', N'5be762ce-7944-4ae8-90f4-41a9b5a27546', N'PAGE', N'DELETE', CAST(0x0000A38C01158373 AS DateTime), CAST(0x0000A38C01158373 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55039a0c-8eeb-46d5-8e0e-1595457af4fa', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D0107FA13 AS DateTime), CAST(0x0000A38D0107FA13 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'49dc2201-f152-4f93-a10b-165975cb989f', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01092BA7 AS DateTime), CAST(0x0000A38D01092BA7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f9798979-8fc4-4359-b7e5-165a7f5d4e97', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E81266 AS DateTime), CAST(0x0000A38C00E81266 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'46413133-ca69-422c-9eb9-17f30168f027', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'PUBLISH', CAST(0x0000A38D0104EB5E AS DateTime), CAST(0x0000A38D0104EB5E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f7ac1fee-cf53-4e5f-aa06-180723aab274', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'INSERT', CAST(0x0000A38B00948AA4 AS DateTime), CAST(0x0000A38B00948AA4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e56e4e2c-3006-46f4-ba04-1a5993e7f701', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E0413C AS DateTime), CAST(0x0000A39900E0413C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fcf51f2a-d05d-4db3-a7f9-1b1fce9d7380', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125C679 AS DateTime), CAST(0x0000A3880125C679 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5f28f38c-168c-4fa0-bff9-1bd9df322c01', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E011FB4B6 AS DateTime), CAST(0x0000A38E011FB4B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9103c043-5656-426a-9a98-1d1a79c92bbb', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38F0111B6EE AS DateTime), CAST(0x0000A38F0111B6EE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a1de2c26-153a-46f4-80c0-1d2d71754ed6', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E76B64 AS DateTime), CAST(0x0000A38D00E76B64 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f51582a0-0b1c-41b1-be89-1d7718a4b7ac', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BF4A58 AS DateTime), CAST(0x0000A39200BF4A58 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fe2ff268-df42-4ed2-a6e7-1e03e428eab9', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'PUBLISH', CAST(0x0000A39500FA6681 AS DateTime), CAST(0x0000A39500FA6681 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b2f3bd0d-6146-43b3-8dcb-1e7fd1ac82ca', N'f85851a4-32b3-4b95-8340-1f039a708f83', N'PAGE', N'DELETE', CAST(0x0000A38E0113B7FB AS DateTime), CAST(0x0000A38E0113B7FB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9b4d9d72-9f8b-4419-be6d-1e8a110e2928', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38500C7919A AS DateTime), CAST(0x0000A38500C7919A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ea2b5e0c-31b5-4705-b6ed-1e8f725c9dff', N'269dfd25-6de3-454e-8056-b14b922497c9', N'PAGE', N'DELETE', CAST(0x0000A38C01029916 AS DateTime), CAST(0x0000A38C01029917 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eaf5687d-e61d-4e84-a82d-1eb50b92cd1b', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39500F60038 AS DateTime), CAST(0x0000A39500F60038 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b7766578-4d76-4dd0-b10c-1f3f70eee806', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E0360F AS DateTime), CAST(0x0000A39900E0360F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cf6c6087-a320-45b8-94ed-1fc7be334525', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DF20AB AS DateTime), CAST(0x0000A39900DF20AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bedaa6a6-55e9-4eb4-960b-20302139c345', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BF4A59 AS DateTime), CAST(0x0000A39200BF4A59 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'91419012-78ac-4d09-9bff-208ac531ac77', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38E01154436 AS DateTime), CAST(0x0000A38E01154436 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ad7f5f6-51ea-49d8-95f9-20e470b7ab1b', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1D3E AS DateTime), CAST(0x0000A39200BF1D3E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c796d72-fdf9-40fe-8444-21fe3ebdb7a7', N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B008E17C0 AS DateTime), CAST(0x0000A38B008E17C0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'92f4dc08-93d2-433c-9b73-222feb8c778e', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38800C0A541 AS DateTime), CAST(0x0000A38800C0A541 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'662376cc-4d5b-4b32-8001-224618bed813', N'f9792f8d-1cee-4db6-b01c-21b4e2b5f25f', N'PAGE', N'INSERT', CAST(0x0000A38C01082492 AS DateTime), CAST(0x0000A38C01082492 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a6fb3f2-d106-4a90-afeb-227f0f3e053d', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880126122A AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'48eafd0e-363c-4033-a508-22ab6a27e4bd', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'UPDATE', CAST(0x0000A37900CBA5AB AS DateTime), CAST(0x0000A37900CBA5AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a4800a51-3c3f-4131-a610-23c549beaf04', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010740AF AS DateTime), CAST(0x0000A38D010740AF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6f2d67b0-fa3c-4bce-99ae-24429407b50a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38F01124625 AS DateTime), CAST(0x0000A38F01124625 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'efabcc1f-18a9-4d9f-a987-24763f1ccfc8', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'INSERT', CAST(0x0000A38C01114420 AS DateTime), CAST(0x0000A38C01114420 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0c3ad20a-76b3-4e5d-bbe2-24ac4ddd5de6', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F3D AS DateTime), CAST(0x0000A38B00C28F3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e6924835-c9a3-47c6-9299-250e0a5d7639', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B81 AS DateTime), CAST(0x0000A38B009B8B81 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d4f6dd6-a087-4a61-973d-2611919fae86', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010D52A9 AS DateTime), CAST(0x0000A388010D52A9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4e14aa1a-caab-4152-a733-2616876ebdfd', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A39500C53E3D AS DateTime), CAST(0x0000A39500C53E3D AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'725b48ee-e3bc-4320-a924-263a0fcafd7a', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F684C6 AS DateTime), CAST(0x0000A38C00F684C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa2f699a-510a-4964-9c5e-2684a9dc3af8', N'8282d7aa-1c4a-4d51-bfc7-06b633a62dad', N'PAGE', N'INSERT', CAST(0x0000A38C010E0D11 AS DateTime), CAST(0x0000A38C010E0D11 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'93109c2b-0dcb-49ce-ab28-26a8564d3568', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'DELETE', CAST(0x0000A38D0106C6AD AS DateTime), CAST(0x0000A38D0106C6AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'51729ac7-89a6-4df2-a70c-272dc3c80311', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E77F2B AS DateTime), CAST(0x0000A38D00E77F2B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'108c276a-abb8-4621-8a99-275018f28b1b', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E01234F9A AS DateTime), CAST(0x0000A38E01234F9A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'854460c9-5164-42ed-98ac-28bf5f21a691', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0FF9 AS DateTime), CAST(0x0000A39200BF0FF9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4e02efee-fa48-43e7-ba21-28d3081fd14f', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012EE1C4 AS DateTime), CAST(0x0000A38E012EE1C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ee615d8c-62b9-4190-b8ee-29721c417a51', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3880107BFC7 AS DateTime), CAST(0x0000A3880107BFC7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'37aab9ad-5e48-443a-9133-2a8938edc232', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'PUBLISH', CAST(0x0000A37900CBA5AD AS DateTime), CAST(0x0000A37900CBA5AD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'73765194-c087-4095-a1f3-2a9d1bced8c4', N'6017f844-b0c2-4fa8-897a-8d5cfaff94ef', N'PAGE', N'DELETE', CAST(0x0000A38E0113F3AE AS DateTime), CAST(0x0000A38E0113F3AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1046ca05-d5ae-414d-92d5-2b96cea5d990', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'PUBLISH', CAST(0x0000A38800C0C7C6 AS DateTime), CAST(0x0000A38800C0C7C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'93ffdc11-aefc-4dae-b55a-2bbd4f534263', N'f85851a4-32b3-4b95-8340-1f039a708f83', N'PAGE', N'INSERT', CAST(0x0000A38E0113AE00 AS DateTime), CAST(0x0000A38E0113AE00 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2f44975e-5ec2-4720-a3ab-2bc8451ab41e', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472D AS DateTime), CAST(0x0000A38B009A472D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'01c229ec-eec6-4ebc-94f4-2c071b0603ef', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'PUBLISH', CAST(0x0000A37900F87D98 AS DateTime), CAST(0x0000A37900F87D98 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a11f1d1-bcb7-4d1a-8c55-2c99a2f84b7b', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'DEPUBLISH', CAST(0x0000A37900FDA2EF AS DateTime), CAST(0x0000A37900FDA2EF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b3cfcc90-2cf5-4e84-85ee-2d7086f0abbe', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D0108D169 AS DateTime), CAST(0x0000A38D0108D169 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e1f4477a-4fe6-40a2-8775-2e0663a2b18d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A395011883BD AS DateTime), CAST(0x0000A395011883BD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'84e8c207-2936-40e1-baf2-2e2d6e9c71d6', N'6de553fa-b855-439a-b350-1eb460d50a51', N'POST', N'INSERT', CAST(0x0000A37900F5F1DD AS DateTime), CAST(0x0000A37900F5F1DD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'73df39cb-b131-4ad0-8e1f-2e3f065de04e', N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E5F8B AS DateTime), CAST(0x0000A38B008E5F8B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7debbe78-a59e-4533-aa84-30b2be533c64', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB5198 AS DateTime), CAST(0x0000A38D00EB5198 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'20fff514-cf90-4e5d-93fb-33c53b5566f1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D00FEA57E AS DateTime), CAST(0x0000A38D00FEA57E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'df707524-5a0c-43ae-bdd4-33c760a83130', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D01067DE4 AS DateTime), CAST(0x0000A38D01067DE4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'acccf652-da53-4ad7-8f25-33d24d09d46d', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F72D41 AS DateTime), CAST(0x0000A38C00F72D41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0164ea8d-7800-4bd6-9db0-34003afcb99e', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'INSERT', CAST(0x0000A38B00948A99 AS DateTime), CAST(0x0000A38B00948A99 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'01529407-86cf-4536-a7c2-3647f7858717', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'DELETE', CAST(0x0000A39200BEFB32 AS DateTime), CAST(0x0000A39200BEFB32 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f6223a88-60b0-4d3b-89d0-3735a71a8ac5', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC662F AS DateTime), CAST(0x0000A39200BC662F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8b72932d-b9e2-4dc4-8c7e-37bf2bcffdd9', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'DEPUBLISH', CAST(0x0000A38F01126BEE AS DateTime), CAST(0x0000A38F01126BEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'84da37d4-71c6-486e-b603-38cd719f4138', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38E012EFF49 AS DateTime), CAST(0x0000A38E012EFF49 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'734e2c24-1b94-47a5-8906-38f15f6fde06', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A3880125E0CD AS DateTime), CAST(0x0000A3880125E0CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3acd1f2a-566a-4118-90ce-393694330a66', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA0 AS DateTime), CAST(0x0000A38D00926EA0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1a2630c2-114a-4799-81c8-393751ea8bab', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DF209E AS DateTime), CAST(0x0000A39900DF209E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd23334df-3f4b-4d9a-b0c7-3a3652c3f9e1', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388012302C2 AS DateTime), CAST(0x0000A388012302C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
print 'Processed 100 total records'
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d9935fb-976c-40f0-af79-3b87f4bfb25a', N'af5bf5e4-efa3-4c82-97a8-1f8f3a93d325', N'PAGE', N'INSERT', CAST(0x0000A38E01131E96 AS DateTime), CAST(0x0000A38E01131E96 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d91c029-1eb5-4ee8-b287-3be0e6ffda81', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0104E9AC AS DateTime), CAST(0x0000A38D0104E9AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8804b019-c30c-44f4-a013-3c203f74b244', N'037c1a14-7021-4d6b-b438-959065aee3c1', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600A6312F AS DateTime), CAST(0x0000A38600A6312F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8267cabe-2e90-43c5-9d2f-3d62ed4a1ee6', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A37900F8C23F AS DateTime), CAST(0x0000A37900F8C23F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0d0f033a-40f8-4e1e-b8cd-3da451bb24c8', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'UPDATE', CAST(0x0000A388012594CC AS DateTime), CAST(0x0000A388012594CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aae3b850-1a6c-4d84-9524-3dd7f5362372', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125F880 AS DateTime), CAST(0x0000A3880125F880 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b0b369f9-715a-411f-9489-3dfbfdb3aaaf', N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E4441 AS DateTime), CAST(0x0000A38B008E4441 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e564a742-a250-4932-a9e6-3e332c9e0af8', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39501168963 AS DateTime), CAST(0x0000A39501168963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c63d54dd-ae07-4252-a9b5-3e878b698c6f', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D0108D168 AS DateTime), CAST(0x0000A38D0108D168 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4ea22c4d-8f17-457e-8589-3f60bddc1e95', N'05de453d-814d-4064-be59-1e5480a0e7d7', N'PAGE', N'DELETE', CAST(0x0000A38C01057C42 AS DateTime), CAST(0x0000A38C01057C42 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c178bec1-929f-4b82-9f69-418a0c4831a8', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38E011FC18C AS DateTime), CAST(0x0000A38E011FC18C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eb42a8dc-a1eb-4456-b9c8-41ab5783d9b8', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125C67C AS DateTime), CAST(0x0000A3880125C67C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'23d1c8b6-af9a-4106-86e2-43810c38fb5b', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'INSERT', CAST(0x0000A38C00E5249B AS DateTime), CAST(0x0000A38C00E5249B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4a2591f9-0908-426a-ab2a-441c7fd5db44', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00FCE77A AS DateTime), CAST(0x0000A38C00FCE77A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'78ee3c4e-49eb-4ce2-a0a6-44b09100e6f9', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E021BB AS DateTime), CAST(0x0000A39900E021BB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'30f508a4-1085-4fa6-a0b8-453fdee6fdc0', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B88 AS DateTime), CAST(0x0000A38B009B8B88 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47155bf9-cb69-4028-a3cb-45aece7793b3', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CCFBF AS DateTime), CAST(0x0000A38E011CCFBF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7e1bf129-93a3-40cd-928d-46fea00deae3', N'269dfd25-6de3-454e-8056-b14b922497c9', N'PAGE', N'INSERT', CAST(0x0000A38C0100CA11 AS DateTime), CAST(0x0000A38C0100CA11 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c119c615-7d9a-425f-9ee1-478172ba4658', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D01284869 AS DateTime), CAST(0x0000A38D01284869 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aabc67e2-a90e-4a42-8498-47b1dd7c2dff', N'a058c673-39bb-459c-9f28-d93545cec7be', N'SYSUSER', N'INSERT', CAST(0x0000A38500B29BE6 AS DateTime), CAST(0x0000A38500B29BE6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'13f172ae-54b7-4116-9d41-47b2b5682a3f', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'UPDATE', CAST(0x0000A38800C0052D AS DateTime), CAST(0x0000A38800C0052D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'075dd0c2-adb1-4c24-bbb2-47d08da1052a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A3950114344F AS DateTime), CAST(0x0000A3950114344F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c83fd952-ce0f-436c-8a21-47dd5d0f8652', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DA4991 AS DateTime), CAST(0x0000A38D00DA4991 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8d565cdc-56b5-4e5e-8d11-4868b0e741bb', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'INSERT', CAST(0x0000A38E0114052A AS DateTime), CAST(0x0000A38E0114052A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'003b92b5-01cb-4648-860d-4b1737b16e64', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0674 AS DateTime), CAST(0x0000A39200BF0674 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5aeda62f-002f-4cab-af87-4bdb7f789e1f', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'PUBLISH', CAST(0x0000A37900F890C5 AS DateTime), CAST(0x0000A37900F890C5 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'139e6954-f4bd-4d57-ba73-4c2b83f0e62b', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E0413B AS DateTime), CAST(0x0000A39900E0413B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd4419b6f-c01e-4865-bcdd-4c449687f50e', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'DELETE', CAST(0x0000A39200BEFB34 AS DateTime), CAST(0x0000A39200BEFB34 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'db7210c3-fd17-4f1b-8cd7-4ce41e66bac0', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC52C4 AS DateTime), CAST(0x0000A39200BC52C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'57f526d5-1b3a-46ea-b0c5-4d4ecf2f0691', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A37A00B2DEA3 AS DateTime), CAST(0x0000A37A00B2DEA3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3f2a791e-e01e-4a6e-9011-50f6036a88b3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38E012D2335 AS DateTime), CAST(0x0000A38E012D2335 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'09a3feaf-fb3e-486e-a22e-511faac25abe', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB0623 AS DateTime), CAST(0x0000A38D00EB0623 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4878e881-e4b7-4a87-a13c-52aa50a9a95a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E7EA5C AS DateTime), CAST(0x0000A38D00E7EA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e99672b7-d22b-4540-b40a-534495e9ef96', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3880108E4C7 AS DateTime), CAST(0x0000A3880108E4C7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5f38060-0620-4e39-884b-535cf52efa82', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'DELETE', CAST(0x0000A38C0114F1F3 AS DateTime), CAST(0x0000A38C0114F1F3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5223abd-5a81-430d-944a-555aa5794d37', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B00948AAC AS DateTime), CAST(0x0000A38B00948AAC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bc6fa756-0af9-46a4-91f7-55e835c205da', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E0360E AS DateTime), CAST(0x0000A39900E0360E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0bc582a2-6d13-4770-9eee-5651359dbc7b', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B0091D1C8 AS DateTime), CAST(0x0000A38B0091D1C8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'70a00f11-dd70-4b47-a8ce-565d29774d76', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA5C AS DateTime), CAST(0x0000A38B0094CA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ceaed1da-1f15-45b7-b0b2-5763767abc2f', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BD0870 AS DateTime), CAST(0x0000A39200BD0870 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cb7231a-3f45-4906-a1f0-582373ba94a7', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B0091D1CC AS DateTime), CAST(0x0000A38B0091D1CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ef3ff66f-cdc7-47c9-bdb5-588ace04ab26', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A3950114344C AS DateTime), CAST(0x0000A3950114344C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9753d8b4-72fd-4aca-8919-591cb8ee027f', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39500FC6CF3 AS DateTime), CAST(0x0000A39500FC6CF3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4c59f65e-3343-4b09-9784-59adf78c9dc8', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BF672F AS DateTime), CAST(0x0000A39200BF672F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2948f31b-3424-48c4-ac9d-5a1d718a0ceb', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A3880103F190 AS DateTime), CAST(0x0000A3880103F190 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3207aed1-f306-4db1-9d28-5a84652e4c35', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'DEPUBLISH', CAST(0x0000A38D0106BF6C AS DateTime), CAST(0x0000A38D0106BF6C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ce18d6e-8b94-41fe-8c24-5a9d0badd72e', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A3950117B545 AS DateTime), CAST(0x0000A3950117B545 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'32ac8295-42ac-471d-84dd-5b1dcdb39178', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A3880125E962 AS DateTime), CAST(0x0000A3880125E962 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9cc85263-588c-4994-9d3e-5ba52f1be24b', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA5 AS DateTime), CAST(0x0000A38D00926EA5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'80fbce56-0c2b-4472-a8bf-5c88c01b22a1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880145061A AS DateTime), CAST(0x0000A3880145061A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a84405f1-398b-4bf9-bb56-6015c8355b9a', N'8282d7aa-1c4a-4d51-bfc7-06b633a62dad', N'PAGE', N'DELETE', CAST(0x0000A38C010FF911 AS DateTime), CAST(0x0000A38C010FF911 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'564a5e48-6d70-453c-b286-60d8c284e1b0', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'INSERT', CAST(0x0000A37900FDB726 AS DateTime), CAST(0x0000A37900FDB726 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa7342e8-9d1f-4d00-b4f0-60e03b13ab7c', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472B AS DateTime), CAST(0x0000A38B009A472B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f40616d5-c25a-4bb3-a3dd-61b02bbdb250', N'02da6c49-eaee-48fa-97c2-d5c1220fe2a5', N'PAGE', N'INSERT', CAST(0x0000A38C00FE6783 AS DateTime), CAST(0x0000A38C00FE6783 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0f9ba3fd-b232-44e6-8845-61dbdd203922', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bea14096-586c-47f2-88dc-62b440b3ff93', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'DELETE', CAST(0x0000A38C010D6D86 AS DateTime), CAST(0x0000A38C010D6D86 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'48f208c2-56a9-472b-93fd-62b8cd60f017', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333D5 AS DateTime), CAST(0x0000A38B00A333D5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cbf312b2-a0b5-4784-8313-63131b03cd3b', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'INSERT', CAST(0x0000A38C010C8C57 AS DateTime), CAST(0x0000A38C010C8C57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'12666e70-8af6-4d9c-984c-633a6c752ff9', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A3880125E962 AS DateTime), CAST(0x0000A3880125E962 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'be0c2e69-03a9-42fc-8f81-64621e205dda', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010DD3D9 AS DateTime), CAST(0x0000A388010DD3D9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'badebb83-365c-4e0a-9315-646414f9e213', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A00962FB9 AS DateTime), CAST(0x0000A39A00962FB9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'086186ff-2b49-4ab2-ad8f-648e946dd184', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F662D4 AS DateTime), CAST(0x0000A38C00F662D4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f302df63-dc3a-4169-8a12-651e08ec2d98', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E7B2F6 AS DateTime), CAST(0x0000A38D00E7B2F6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'16757e2b-40b0-4f67-92cb-670ca45209ad', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E0115696C AS DateTime), CAST(0x0000A38E0115696C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b538852b-ebbb-41e5-aa2e-672914274f97', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600A2F88B AS DateTime), CAST(0x0000A38600A2F88B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5c57a868-1ebc-4a96-8559-67a1a9c072e7', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A67608 AS DateTime), CAST(0x0000A38600A67608 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2835a315-c223-4181-a4f7-67b24aea5f87', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'DEPUBLISH', CAST(0x0000A39500FC07E4 AS DateTime), CAST(0x0000A39500FC07E4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ccae22e2-8c6b-428f-a045-6830723994eb', N'f0218392-1d83-4c42-bf99-a0dc1b70a9ee', N'PAGE', N'INSERT', CAST(0x0000A38C0116620D AS DateTime), CAST(0x0000A38C0116620D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'dceb6821-15c2-40a0-9f02-68a407f93515', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'UPDATE', CAST(0x0000A38C01116DF4 AS DateTime), CAST(0x0000A38C01116DF4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'29d973b7-1d61-4373-8f05-68b572330d06', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A37A00B2C718 AS DateTime), CAST(0x0000A37A00B2C718 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'13f0df57-33fa-4001-ae16-68d67c2472cb', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38500CA1CBB AS DateTime), CAST(0x0000A38500CA1CBB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cfee864-f991-4c7c-acc8-68fc36a482d8', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'UPDATE', CAST(0x0000A37900F890C5 AS DateTime), CAST(0x0000A37900F890C5 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'faa8834a-0388-4c2a-afb5-697af9adea94', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F41 AS DateTime), CAST(0x0000A38B00C28F41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e0e917e2-ec5f-4ed2-b94f-6a4178bcadb4', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'DELETE', CAST(0x0000A39200BFD5B7 AS DateTime), CAST(0x0000A39200BFD5B7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'295361c9-24b2-436b-b15e-6a4513d4f8b6', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1006 AS DateTime), CAST(0x0000A39200BF1006 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'50d19e88-9c57-4a85-979b-6b482fd164f6', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC663E AS DateTime), CAST(0x0000A39200BC663E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a85be2d-cd0b-4e67-947e-6c2b2af103a5', N'765ec467-7ab1-45c5-8e68-a6f90437ec74', N'PAGE', N'DELETE', CAST(0x0000A38C01068495 AS DateTime), CAST(0x0000A38C01068495 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd62a6984-8c0b-4884-9029-6d557142b4a0', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB762C AS DateTime), CAST(0x0000A38D00EB762D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a093f790-2a07-4e6c-9211-6e14f27d57e4', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600BA51F8 AS DateTime), CAST(0x0000A38600BA51F8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd6da387e-b931-4a74-9884-6ea85d1e11aa', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009898AA AS DateTime), CAST(0x0000A38B009898AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4fcb894d-93b2-402e-acc7-6ee78f779fa0', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0FF3 AS DateTime), CAST(0x0000A39200BF0FF3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'59b005ce-a3be-41ad-9625-6f00fead9cdd', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38C0080D2F5 AS DateTime), CAST(0x0000A38C0080D2F5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd98e8135-21ed-40f1-babf-6f4b0d5abbed', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'PUBLISH', CAST(0x0000A38800C0052F AS DateTime), CAST(0x0000A38800C0052F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b286791c-e9ec-4f6e-a582-6ffc4d30c27c', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38F01124626 AS DateTime), CAST(0x0000A38F01124626 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8dc3fcf5-7a45-4896-8a5e-708fbb345458', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA6 AS DateTime), CAST(0x0000A38D00926EA6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9a7413bb-cf2d-4524-a18d-7117a5a007fb', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DE5553 AS DateTime), CAST(0x0000A39900DE5553 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa0dd78b-e0d8-489d-9aeb-711b928865e4', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388010925F2 AS DateTime), CAST(0x0000A388010925F2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e093b793-9c7d-4a39-b959-71ab76f27be2', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'INSERT', CAST(0x0000A39200BC6013 AS DateTime), CAST(0x0000A39200BC6013 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'315a1141-f0f3-4270-8395-71e52fe5249d', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38F0111D370 AS DateTime), CAST(0x0000A38F0111D370 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ecf9a51-b874-40e0-adb5-725fe4fc6816', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A3950116A649 AS DateTime), CAST(0x0000A3950116A649 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ab0aa1ba-712b-4f50-8f2f-7273b4b99f00', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D996F4 AS DateTime), CAST(0x0000A38D00D996F4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ee321b6c-a5f4-4bd9-a5f0-73bc2be28f61', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BD086F AS DateTime), CAST(0x0000A39200BD086F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c86fbe94-5236-4be7-bbc3-743daae0792e', N'798bc71a-98e2-4e2a-8ddb-21537f6004b7', N'SYSGROUP', N'INSERT', CAST(0x0000A37A00B4532F AS DateTime), CAST(0x0000A37A00B4532F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8a47e38-76b4-44f5-b832-748db57ccd98', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB762D AS DateTime), CAST(0x0000A38D00EB762D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'17e26ac3-f97e-4164-aac8-74aa9ba99d59', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5B623 AS DateTime), CAST(0x0000A38C00E5B623 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'acd43699-243f-4485-9916-74c32c605ebe', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0099E6FD AS DateTime), CAST(0x0000A38D0099E6FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7b64ab59-8ddd-4098-a5af-76accd1f7bda', N'af5bf5e4-efa3-4c82-97a8-1f8f3a93d325', N'PAGE', N'DELETE', CAST(0x0000A38E0113A0C3 AS DateTime), CAST(0x0000A38E0113A0C3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2ed553cd-93a3-49a8-8160-77321f7457d7', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'DELETE', CAST(0x0000A37900FDA2F1 AS DateTime), CAST(0x0000A37900FDA2F1 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ce98145f-e413-4322-bf6c-77f786cb6b5b', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A38801261229 AS DateTime), CAST(0x0000A38801261229 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'037e10cb-8580-4a7b-8e3d-78278bcebe7b', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39501174E61 AS DateTime), CAST(0x0000A39501174E61 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'91a56e90-4763-4b20-b098-78e134663623', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38E012D2327 AS DateTime), CAST(0x0000A38E012D2327 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
print 'Processed 200 total records'
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'70c08b7b-492b-425d-af0b-79c437b01e16', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388011D98D2 AS DateTime), CAST(0x0000A388011D98D2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'80e39ecd-bc31-4c73-8c88-7a564620c411', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'DELETE', CAST(0x0000A3880101F8B5 AS DateTime), CAST(0x0000A3880101F8B5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0c22b084-186c-43d6-bc58-7a9dbee5dcf1', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF5CC AS DateTime), CAST(0x0000A39200BEF5CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'621019a1-20af-4cfb-af4a-7b0d061983d6', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E0115696C AS DateTime), CAST(0x0000A38E0115696C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'16bc9daa-6770-4148-b089-7c26d44ae05d', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'INSERT', CAST(0x0000A38B009898AB AS DateTime), CAST(0x0000A38B009898AB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b03f763f-d5b3-4d5c-99a3-7e424238cf37', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39200B8742D AS DateTime), CAST(0x0000A39200B8742E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ac6a296c-d9f6-475d-a799-7e4fffdce1bd', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B0091D1B9 AS DateTime), CAST(0x0000A38B0091D1B9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c7014bc-610a-4316-bd00-7eb076efbbe1', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38801085761 AS DateTime), CAST(0x0000A38801085761 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'516b2d08-6622-4f83-837c-7f0c03eeda0e', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D010FB86B AS DateTime), CAST(0x0000A38D010FB86B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'861dbfe2-136d-4188-87ff-800d3288b7de', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA8 AS DateTime), CAST(0x0000A38D00926EA8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7607b9f2-fe30-4e70-91a5-807e5dacd0bf', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF1D4C AS DateTime), CAST(0x0000A39200BF1D4C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ce49b7a4-961a-4e3b-8f5d-809af465c6b3', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600C87958 AS DateTime), CAST(0x0000A38600C87958 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8257547-3a66-4157-af85-80de108fff53', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DED49E AS DateTime), CAST(0x0000A39900DED49E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c88ef11d-11d8-4abf-b6c4-8507f783bccf', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388010C940B AS DateTime), CAST(0x0000A388010C940B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'86cf4f52-67a0-48cc-b205-859afeab129a', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CC919 AS DateTime), CAST(0x0000A38E011CC919 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c7b82b5f-1cb8-4ce1-a3bf-859b853609c6', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'DEPUBLISH', CAST(0x0000A38D0106C6AD AS DateTime), CAST(0x0000A38D0106C6AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f5a31beb-3086-4b92-ad99-87ab8c5fd18a', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF100F AS DateTime), CAST(0x0000A39200BF100F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'161ce0fa-a522-4b51-9b63-8835f1d41f9e', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333CF AS DateTime), CAST(0x0000A38B00A333CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ddb32045-59e2-468c-aea9-88d41280e7df', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DA2C08 AS DateTime), CAST(0x0000A39900DA2C08 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1f432535-d312-4527-bf48-8921b8f4078a', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A4723 AS DateTime), CAST(0x0000A38B009A4723 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2d30bc04-6534-44e9-a221-8975c00efd7a', N'05de453d-814d-4064-be59-1e5480a0e7d7', N'PAGE', N'INSERT', CAST(0x0000A38C0102C137 AS DateTime), CAST(0x0000A38C0102C137 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fbeaedba-89e6-4fe9-8b12-8abf958d71a2', N'f9792f8d-1cee-4db6-b01c-21b4e2b5f25f', N'PAGE', N'DELETE', CAST(0x0000A38C010D70ED AS DateTime), CAST(0x0000A38C010D70ED AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4c47c529-87bc-403b-9f6d-8af070e4dc77', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F38 AS DateTime), CAST(0x0000A38B00C28F38 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'594d99e4-6943-49ce-ac14-8b0c89c7a157', N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'PAGE', N'UPDATE', CAST(0x0000A37900CBCF1B AS DateTime), CAST(0x0000A37900CBCF1B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2cab1c5a-4bc3-4cc8-a8ec-8b575d8cc714', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'DEPUBLISH', CAST(0x0000A38F0112509F AS DateTime), CAST(0x0000A38F0112509F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'92de4815-d9da-47db-b0cd-8d0edbaca5d2', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0107FA13 AS DateTime), CAST(0x0000A38D0107FA13 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd9c63b75-cf3a-4110-9e07-8d13381931c3', N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B008E179B AS DateTime), CAST(0x0000A38B008E179B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cd949c81-fb9b-4f0f-871c-8d50c7ba38e7', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C011FAA14 AS DateTime), CAST(0x0000A38C011FAA14 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'34dbd1c2-f1be-464b-bac5-8d70ed914494', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DEF36C AS DateTime), CAST(0x0000A39900DEF36C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9f9dbcf4-2019-49d6-b7f4-8dab3d398556', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'UPDATE', CAST(0x0000A38800C0C7C2 AS DateTime), CAST(0x0000A38800C0C7C3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ab446ea1-f58c-4e88-afbc-8e60ce605538', N'23d20863-94fb-43e8-8138-1332e5784a3f', N'PAGE', N'DELETE', CAST(0x0000A38C010750CF AS DateTime), CAST(0x0000A38C010750CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1bfc7d94-ace8-4e65-8c57-90390fc99b2c', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39200B8B24C AS DateTime), CAST(0x0000A39200B8B24C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b4b532a6-2db3-4daf-b322-909fb34fd52c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A3880144F5B5 AS DateTime), CAST(0x0000A3880144F5B5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8e872a0-2e25-40ef-a4cc-9116f452d99c', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38E011FC18C AS DateTime), CAST(0x0000A38E011FC18C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8540731a-22ea-49e4-8a7e-918e52a5ff45', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D0128486E AS DateTime), CAST(0x0000A38D0128486E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4aa9088b-c51b-4a80-9375-92b031937dbe', N'02da6c49-eaee-48fa-97c2-d5c1220fe2a5', N'PAGE', N'DELETE', CAST(0x0000A38C00FF17C6 AS DateTime), CAST(0x0000A38C00FF17C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ddf81080-0f56-4af8-a84c-9435e4d019f5', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A386009FE9C4 AS DateTime), CAST(0x0000A386009FE9C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0ea25248-74d3-4220-9336-947872134a05', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39501174E60 AS DateTime), CAST(0x0000A39501174E60 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5f0b59cb-0184-41e9-98e8-94ba0589497f', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A39501167432 AS DateTime), CAST(0x0000A39501167432 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8e845fe4-bab0-4923-9b62-9518a7aae8fe', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA4D AS DateTime), CAST(0x0000A38B0094CA4D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'929e46d1-655e-4c40-8264-95417cc804f3', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A37900FDB727 AS DateTime), CAST(0x0000A37900FDB727 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ccc10d79-654f-4930-892d-9564ec9971be', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA56 AS DateTime), CAST(0x0000A38B0094CA56 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'53b9a583-50bf-40c1-a278-9671eeae3439', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DED49E AS DateTime), CAST(0x0000A39900DED49E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'113869a1-0730-4c27-8cce-9750e067a42c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880144F5BC AS DateTime), CAST(0x0000A3880144F5BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5b172bd0-c723-4966-83bd-97c1fdd4e4a6', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'DELETE', CAST(0x0000A38B009888B6 AS DateTime), CAST(0x0000A38B009888B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b130bc16-9089-4a88-a169-97ff4e65652a', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'INSERT', CAST(0x0000A3880108739F AS DateTime), CAST(0x0000A3880108739F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'62afa117-b8d8-48db-afc3-994b4ae2e423', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E0120A2FD AS DateTime), CAST(0x0000A38E0120A2FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'769d4511-bfa3-496c-a1e7-99606a90846f', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB0625 AS DateTime), CAST(0x0000A38D00EB0625 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7f323789-f2f7-407e-8462-99e902848228', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6649 AS DateTime), CAST(0x0000A39200BC6649 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7df150f9-58fe-41cb-8ef8-99eebf55692b', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39501167B96 AS DateTime), CAST(0x0000A39501167B96 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c8fe66a1-8f24-4c5e-ac4e-9b1723d4002f', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E011FB4B6 AS DateTime), CAST(0x0000A38E011FB4B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'65968cf9-3c46-4a4c-aeba-9d307e6d1203', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D01028D5C AS DateTime), CAST(0x0000A38D01028D5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3f0bc3ef-23c7-4baa-8b18-9d6e7f7d6bfc', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'DELETE', CAST(0x0000A38D0106BF6E AS DateTime), CAST(0x0000A38D0106BF6E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bb436c94-0255-498b-83e1-9e4ccdbe3fcb', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200B8A330 AS DateTime), CAST(0x0000A39200B8A330 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0a672a49-ce8e-40ae-aa0e-9e7a65155092', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'INSERT', CAST(0x0000A39200BC52C0 AS DateTime), CAST(0x0000A39200BC52C0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b122d5b0-f055-450d-9e8c-9ee9daf1e278', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C011A007B AS DateTime), CAST(0x0000A38C011A007B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4757fbf5-90f5-48ed-9def-9f6cadf98536', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38E012EFF41 AS DateTime), CAST(0x0000A38E012EFF41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1a09d2a1-63fb-41ff-9eb6-a04ea237c61b', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6646 AS DateTime), CAST(0x0000A39200BC6646 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4181069d-903a-44dd-8bed-a07bb8e4e9fb', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A3880125A7B8 AS DateTime), CAST(0x0000A3880125A7B8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fec62314-b1c5-4adb-a57a-a17ad323c80a', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38F0111B6E9 AS DateTime), CAST(0x0000A38F0111B6E9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'046a98a8-edbd-423b-8521-a1be98f1fbc6', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'INSERT', CAST(0x0000A37A00B2C716 AS DateTime), CAST(0x0000A37A00B2C716 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0496d18-cbaa-444e-bb27-a210ee95cb87', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D3F AS DateTime), CAST(0x0000A38B009A6D3F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'778bcda6-8e30-4502-ad65-a33af4f284fa', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A388012594C9 AS DateTime), CAST(0x0000A388012594C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'34dc2353-c0bf-4985-91b1-a40797802251', N'765ec467-7ab1-45c5-8e68-a6f90437ec74', N'PAGE', N'INSERT', CAST(0x0000A38C01059B9F AS DateTime), CAST(0x0000A38C01059B9F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'31a1b718-c913-47ad-8b32-a43b5052fd02', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38B0108A4EB AS DateTime), CAST(0x0000A38B0108A4EB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2a9066f9-c712-4cbd-a1d8-a632fb2a2e05', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38801450619 AS DateTime), CAST(0x0000A38801450619 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4b6f1340-6b94-4a18-a206-a79b16bef8f3', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B0091D1C2 AS DateTime), CAST(0x0000A38B0091D1C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd35fa8d2-12ba-4046-a6ee-a7de7c2dd0ab', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A3880125D170 AS DateTime), CAST(0x0000A3880125D170 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c1214a8c-ac09-4a01-bfd4-a8677700785f', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333C9 AS DateTime), CAST(0x0000A38B00A333C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'10d3ad14-4266-4f22-9692-a9b13f463999', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A388012554D8 AS DateTime), CAST(0x0000A388012554D8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6290f884-316d-4686-aa17-a9fd9d56a7d2', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010740AD AS DateTime), CAST(0x0000A38D010740AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f368a4b2-5fda-491e-8a0c-aa6391546511', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E021B8 AS DateTime), CAST(0x0000A39900E021B8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55890a14-9e8c-4dc2-997e-ac0dcd55fe56', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0098BB31 AS DateTime), CAST(0x0000A38D0098BB31 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e154afe8-dd4c-43f5-84d6-ac251f3bd8b7', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'INSERT', CAST(0x0000A388010CC8C7 AS DateTime), CAST(0x0000A388010CC8C7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'66e0002c-5d02-477e-aa31-ac7dcc5e1fa8', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F683D AS DateTime), CAST(0x0000A38B008F683D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f68ef67-698a-4ddc-991f-ad9eaa755065', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DA2C19 AS DateTime), CAST(0x0000A39900DA2C19 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'77bb8563-fcdd-4c16-93db-aedeb3dc185c', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1D4A AS DateTime), CAST(0x0000A39200BF1D4A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47f04ac7-4a35-4243-b0b1-aee79bc8c910', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A0098779A AS DateTime), CAST(0x0000A39A0098779A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'95e4fbce-aa57-45cc-a15a-aefa8bb49eb7', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D00FEA578 AS DateTime), CAST(0x0000A38D00FEA578 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b8bb6d04-fff7-41de-98d8-afd064029b54', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010682A8 AS DateTime), CAST(0x0000A38D010682A8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f98427f8-f0b1-4473-8e23-b0233794ab01', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D010FB86E AS DateTime), CAST(0x0000A38D010FB86E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3c65fcbb-2785-4c6e-9c0d-b0f528e2a46a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00985D27 AS DateTime), CAST(0x0000A38D00985D27 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cc101f79-3fc2-41b8-b1e1-b1a6946164e0', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0101CAC2 AS DateTime), CAST(0x0000A38D0101CAC2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3b911863-61af-4d84-b554-b259884866fa', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880125D171 AS DateTime), CAST(0x0000A3880125D171 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'78cf7437-5304-4644-b544-b4160f7256cb', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'DELETE', CAST(0x0000A38C00FE8183 AS DateTime), CAST(0x0000A38C00FE8183 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aa012382-8d90-4570-a633-b4b761933374', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'DELETE', CAST(0x0000A38F01126BEF AS DateTime), CAST(0x0000A38F01126BEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7631ca92-093f-4211-8556-b6be6ea7e48a', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125D7DB AS DateTime), CAST(0x0000A3880125D7DB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8202c395-8624-4d65-8767-b8212f574e2b', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BC835B AS DateTime), CAST(0x0000A39200BC835B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7d2a20e8-c604-402e-94b0-b92770bd35dd', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A386009FD0D9 AS DateTime), CAST(0x0000A386009FD0D9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'da73493b-91a0-4ba2-ac50-ba0715ba7a4b', N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'PAGE', N'PUBLISH', CAST(0x0000A37900CBCF1C AS DateTime), CAST(0x0000A37900CBCF1C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'52b9dd94-a136-466a-a489-ba4409da7767', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'INSERT', CAST(0x0000A37900F8C23E AS DateTime), CAST(0x0000A37900F8C23E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c9504c30-54bb-4fdc-8312-bae1da19eac0', N'6de553fa-b855-439a-b350-1eb460d50a51', N'POST', N'PUBLISH', CAST(0x0000A37900F5F1DE AS DateTime), CAST(0x0000A37900F5F1DE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0fe06703-91f7-4718-973e-bb9deb883323', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E01234546 AS DateTime), CAST(0x0000A38E01234546 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0db83497-d984-42f8-a846-bccb0a73671d', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'UPDATE', CAST(0x0000A38C0114CEF3 AS DateTime), CAST(0x0000A38C0114CEF3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'098ed071-be16-44bc-ac92-bd8617e3ea89', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF83C AS DateTime), CAST(0x0000A39200BEF83C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83848f68-625a-4808-8de2-beb1791c6c78', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A393011A231F AS DateTime), CAST(0x0000A393011A231F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7502700e-cfa0-4565-8e53-c01c78d96a97', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6015 AS DateTime), CAST(0x0000A39200BC6015 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9d96063c-5b80-4927-8876-c38a917bdc8d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00987795 AS DateTime), CAST(0x0000A39A00987795 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'99d35957-020c-41ab-8816-c3995ce52a3c', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0104EB5C AS DateTime), CAST(0x0000A38D0104EB5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cd8c206-8723-4000-a260-c5887e7c664b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C0118A31D AS DateTime), CAST(0x0000A38C0118A31D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'15a8aaaa-2c92-48a4-8fe5-c6e03b63d4de', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'INSERT', CAST(0x0000A39200B88D76 AS DateTime), CAST(0x0000A39200B88D76 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
print 'Processed 300 total records'
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'08866729-cac8-4043-bdf9-c80f675d902e', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DA5833 AS DateTime), CAST(0x0000A38D00DA5833 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d2db80c-c92c-4739-8052-c875a786f67a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0099902D AS DateTime), CAST(0x0000A38D0099902D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e8b668a1-2097-4eac-8345-c89b341b147a', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38800BFF123 AS DateTime), CAST(0x0000A38800BFF123 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3c75b070-e754-4a91-a49b-c96c9a170fa9', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A2E2C4 AS DateTime), CAST(0x0000A38600A2E2C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4d507e88-f6f5-4563-8a3b-c9a0e4ce6e8d', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0105B37B AS DateTime), CAST(0x0000A38D0105B37B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b17507cd-454b-47bc-aac1-cb8b6be4dbb4', N'90af1b6b-a139-44e0-ab2a-5f910f61bc00', N'PAGE', N'INSERT', CAST(0x0000A3880106FC78 AS DateTime), CAST(0x0000A3880106FC78 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'440c2fa5-acd2-4518-8487-cc3534840021', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39200BFB951 AS DateTime), CAST(0x0000A39200BFB951 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0446a7fe-adba-4ba0-a2e6-cc5aa8d58c17', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38E01154435 AS DateTime), CAST(0x0000A38E01154435 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'11379519-7b5b-41dc-9f44-ccf733dbca62', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC52BE AS DateTime), CAST(0x0000A39200BC52BE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f0be85da-04a7-4f19-b440-cd29dc5f204e', N'90af1b6b-a139-44e0-ab2a-5f910f61bc00', N'PAGE', N'DELETE', CAST(0x0000A38D0106BC1F AS DateTime), CAST(0x0000A38D0106BC1F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'72d5dd5a-1e2e-49d8-83fe-cf13b7ccc207', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BC835D AS DateTime), CAST(0x0000A39200BC835D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bd834510-5ad1-4481-97a1-cfff749277ff', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A00992B90 AS DateTime), CAST(0x0000A39A00992B90 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'60f18191-264e-4019-b1ec-d00a8a929e77', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'DELETE', CAST(0x0000A38F011250A1 AS DateTime), CAST(0x0000A38F011250A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'29cdc8cb-b88b-441d-a264-d00dcc3b9211', N'a058c673-39bb-459c-9f28-d93545cec7be', N'SYSUSER', N'UPDATE', CAST(0x0000A3880102DA0F AS DateTime), CAST(0x0000A3880102DA0F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'87c68dc9-dd68-4aca-a7c1-d1a2666d49b7', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38801231899 AS DateTime), CAST(0x0000A38801231899 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'71c76d55-8663-44c6-9933-d1b85197e220', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BF6730 AS DateTime), CAST(0x0000A39200BF6730 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd55bb0fc-2891-4b1d-99b6-d1dbb23af0d4', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38801232D6E AS DateTime), CAST(0x0000A38801232D6E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'de86e81c-bfec-4f17-a3c3-d1e12caebcda', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38E0112CAEF AS DateTime), CAST(0x0000A38E0112CAEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83a66085-d245-4f35-8dc5-d256891df9a6', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DE9872 AS DateTime), CAST(0x0000A39900DE9872 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c4eb7ddc-09cd-4dec-89a1-d26ba9de0e18', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D3D AS DateTime), CAST(0x0000A38B009A6D3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ad899c5b-b3c4-4efd-b32e-d2d8b2d3d9c9', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'INSERT', CAST(0x0000A38B008F683B AS DateTime), CAST(0x0000A38B008F683B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1252ae61-83dc-4286-a07c-d5c1f6b21927', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'INSERT', CAST(0x0000A38C01170C9B AS DateTime), CAST(0x0000A38C01170C9B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7695f740-eed4-4345-aa6e-d5f4fe6b9c06', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF5C9 AS DateTime), CAST(0x0000A39200BEF5C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'35a4c174-d754-4327-ae60-d609156e3861', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D35 AS DateTime), CAST(0x0000A38B009A6D35 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'592ee563-8302-4b6f-9b81-d75ddc3f2d2f', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E601D0 AS DateTime), CAST(0x0000A38C00E601D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aa062d74-1a78-402a-9ace-d81e48f6904e', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38801042D22 AS DateTime), CAST(0x0000A38801042D22 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a9d21244-e754-4b21-aa63-da810bb2485d', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'INSERT', CAST(0x0000A39200BC6017 AS DateTime), CAST(0x0000A39200BC6017 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'352223e9-6530-4417-98a4-dc452ff61be3', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B8A AS DateTime), CAST(0x0000A38B009B8B8A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c4b62a3b-0f5b-4228-9548-dc9e90b516a2', N'6017f844-b0c2-4fa8-897a-8d5cfaff94ef', N'PAGE', N'INSERT', CAST(0x0000A38E0113C8CF AS DateTime), CAST(0x0000A38E0113C8CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'868cc364-1d8e-4f7e-8b6c-dd7b94967390', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D01092BA8 AS DateTime), CAST(0x0000A38D01092BA8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'808ad37f-b611-44d6-844e-ded7ff71a88f', N'5be762ce-7944-4ae8-90f4-41a9b5a27546', N'PAGE', N'INSERT', CAST(0x0000A38C011552D7 AS DateTime), CAST(0x0000A38C011552D7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7377f67b-e383-4f7a-8bec-df6cafbb489b', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'INSERT', CAST(0x0000A38B009898A0 AS DateTime), CAST(0x0000A38B009898A0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ec0d009-9a9a-4da5-ba28-dfacf6af1633', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E0120A2FE AS DateTime), CAST(0x0000A38E0120A2FE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f44336a6-7fa6-4903-abd7-e04a12af577f', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012D4313 AS DateTime), CAST(0x0000A38E012D4313 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c5b5ce8-85e0-47c2-b609-e0c993cc01b2', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010914AA AS DateTime), CAST(0x0000A38D010914AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b5f035ec-2150-497b-b73f-e0ccf5502765', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D983F6 AS DateTime), CAST(0x0000A38D00D983F6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8faaf072-b7ac-4c52-84d5-e10c08047482', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333CE AS DateTime), CAST(0x0000A38B00A333CE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7e527038-80de-4ba1-9bcb-e128dc616665', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A395011883BE AS DateTime), CAST(0x0000A395011883BE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6b20211e-0ea5-4898-b806-e1eb98badc4a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DEF36B AS DateTime), CAST(0x0000A39900DEF36B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8dea48df-e56d-44d0-9516-e2f1311063cd', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DE987A AS DateTime), CAST(0x0000A39900DE987A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'557ad05e-031a-47d6-a616-e48a2251738f', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38E0112B65D AS DateTime), CAST(0x0000A38E0112B65D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2639a415-1f42-4fc3-afd6-e4a1bdf62ef5', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009898AE AS DateTime), CAST(0x0000A38B009898AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'184d2fa0-06f9-42a4-a74d-e5423c920fd0', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125D7DA AS DateTime), CAST(0x0000A3880125D7DA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c61795c-3ebf-4134-8c2b-e55e8ffa2eea', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'PUBLISH', CAST(0x0000A388011D98E9 AS DateTime), CAST(0x0000A388011D98E9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd8919005-97ba-457a-b057-e59c7cbce671', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F6839 AS DateTime), CAST(0x0000A38B008F6839 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c2f013e6-938a-4c12-aaa2-e5e66d4f6182', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'INSERT', CAST(0x0000A38B008EDF35 AS DateTime), CAST(0x0000A38B008EDF35 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'105fd3ff-7f00-450c-9041-e61973153088', N'1248b2e6-451c-4b1a-ae0d-44718231ff35', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E5654 AS DateTime), CAST(0x0000A38B008E5654 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ff8b4052-48e1-4de7-b43b-e63907fc2e4d', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A3880103ECE4 AS DateTime), CAST(0x0000A3880103ECE4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd5d4bc27-6c90-4fec-b473-e708bf87a785', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A37A00B2DEA3 AS DateTime), CAST(0x0000A37A00B2DEA3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'463152ce-f696-4431-9102-e79e575d5013', N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', N'CATEGORY', N'UPDATE', CAST(0x0000A38B008E4ED2 AS DateTime), CAST(0x0000A38B008E4ED2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f5a3afd-d27a-4670-8c43-e8df942e5985', N'5a0d6307-f041-41a1-b63a-563e712f3b8c', N'SYSPARAM', N'UPDATE', CAST(0x0000A37900FD82EA AS DateTime), CAST(0x0000A37900FD82EA AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c8f51a18-658e-40b4-848d-e90f7d7bfbe3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'INSERT', CAST(0x0000A38801231885 AS DateTime), CAST(0x0000A38801231885 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e284a679-4d66-47f1-bd96-e9549a76b2d3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39200BFB94F AS DateTime), CAST(0x0000A39200BFB94F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'12830633-c1cd-4aa3-b271-e9c275e6093f', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'DEPUBLISH', CAST(0x0000A39200BFD5B6 AS DateTime), CAST(0x0000A39200BFD5B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'94a2140b-48b6-4632-9a38-e9c62c259f14', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008EDF3E AS DateTime), CAST(0x0000A38B008EDF3E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7d58f9b9-dc3e-496c-ba0a-eaf1fe6af317', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5FA33 AS DateTime), CAST(0x0000A38C00E5FA33 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55ba221d-2adf-42f7-aab5-eb64f5c09051', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39501185839 AS DateTime), CAST(0x0000A39501185839 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c7a2ee6-c308-4f7d-ba8e-ecfb72c5411c', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F6837 AS DateTime), CAST(0x0000A38B008F6837 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f123a175-fee8-4107-9370-ed8e0fc49581', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'DELETE', CAST(0x0000A39500FC07E7 AS DateTime), CAST(0x0000A39500FC07E7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f7ba7c77-c5e7-4c34-9ab5-edc4031342e6', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00962FB6 AS DateTime), CAST(0x0000A39A00962FB6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e392155e-82f7-4ddd-b9d4-ee1199b107c7', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'INSERT', CAST(0x0000A39200BC52B6 AS DateTime), CAST(0x0000A39200BC52B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4cc4fe3e-ba9b-4746-9ed6-eeee762ff3e5', N'3e9e83bd-0b7f-49ea-833e-9562ac4b1a8d', N'PAGE', N'INSERT', CAST(0x0000A38C010712E7 AS DateTime), CAST(0x0000A38C010712E7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c03297e3-03ac-495e-bd8f-eef41e6c041b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB5198 AS DateTime), CAST(0x0000A38D00EB5198 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1b444fd3-7d19-41ac-a006-ef2b4031cb21', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'UPDATE', CAST(0x0000A38C010D05BC AS DateTime), CAST(0x0000A38C010D05BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'40b301db-cbc4-487e-a9e1-efd3c0ecafc6', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DD3510 AS DateTime), CAST(0x0000A38D00DD3510 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b25e0463-a19c-419a-8fb2-eff03880ddf2', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A388010C360B AS DateTime), CAST(0x0000A388010C360B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a13174cc-6e3d-4a4a-ae06-f0bddd0a815e', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'DELETE', CAST(0x0000A38B009888AE AS DateTime), CAST(0x0000A38B009888AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0b516aff-dc43-4860-8185-f0f1d2f9ec40', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125F881 AS DateTime), CAST(0x0000A3880125F881 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'001b60f7-797f-4ee3-b30b-f1aca96c048c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010682A7 AS DateTime), CAST(0x0000A38D010682A7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0ff9b25-bc8f-4855-a711-f254db4488a9', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010914AA AS DateTime), CAST(0x0000A38D010914AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c1b4f8a2-7a1d-4470-98a6-f2b7f08cab4e', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A393011A2320 AS DateTime), CAST(0x0000A393011A2320 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd22f07fc-a80a-4e23-aade-f3d14ca36189', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F3F AS DateTime), CAST(0x0000A38B00C28F3F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c086786f-e440-4a3d-8e2c-f44d70cf5699', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DEE208 AS DateTime), CAST(0x0000A39900DEE208 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6775b983-0d1d-4f1a-8016-f53507429879', N'f0218392-1d83-4c42-bf99-a0dc1b70a9ee', N'PAGE', N'DELETE', CAST(0x0000A38C0116F9D3 AS DateTime), CAST(0x0000A38C0116F9D3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a3fbe88a-16de-4650-bbc0-f817150f3bf0', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'DEPUBLISH', CAST(0x0000A3880101F88D AS DateTime), CAST(0x0000A3880101F88D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8d18ba69-ff40-4933-8710-f833b472c178', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012CB5A8 AS DateTime), CAST(0x0000A38E012CB5A9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0f8de69f-3852-446f-a3be-f8372b5d2311', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A393011A16BC AS DateTime), CAST(0x0000A393011A16BD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'94e7344b-edbe-40ba-ad9e-f9614cb11627', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5DE05 AS DateTime), CAST(0x0000A38C00E5DE05 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cdcb07de-c2c2-49e8-a744-fb90c053c3c7', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A3880125A7BC AS DateTime), CAST(0x0000A3880125A7BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e162a4c-279f-450a-b16b-fbcb691a07c5', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'INSERT', CAST(0x0000A38800BFFF2E AS DateTime), CAST(0x0000A38800BFFF2E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bb1523bb-551b-48be-95f1-fd69932e1d51', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'INSERT', CAST(0x0000A38E0113E7E2 AS DateTime), CAST(0x0000A38E0113E7E2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'111045f5-69e6-4249-9042-fe7df792ba66', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38600A694D0 AS DateTime), CAST(0x0000A38600A694D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'541fc59b-b8b3-49f4-a787-ff90948b96ff', N'23d20863-94fb-43e8-8138-1332e5784a3f', N'PAGE', N'INSERT', CAST(0x0000A38C01073E0C AS DateTime), CAST(0x0000A38C01073E0C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Table [dbo].[namespace]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[namespace]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[namespace](
	[namespace_id] [uniqueidentifier] NOT NULL,
	[namespace_internal_id] [nvarchar](32) NOT NULL,
	[namespace_name] [nvarchar](64) NOT NULL,
	[namespace_description] [nvarchar](255) NULL,
	[namespace_created] [datetime] NOT NULL,
	[namespace_updated] [datetime] NOT NULL,
	[namespace_created_by] [uniqueidentifier] NOT NULL,
	[namespace_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_namespace_id] PRIMARY KEY CLUSTERED 
(
	[namespace_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'c8342fb4-d38e-4eaf-bbc1-4ef3bdd7500c', N'ARCHIVE', N'Archive namespace', N'This is the archive namespace for all post types.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'Media namespace', N'This is the media namespace for all images & documents.', CAST(0x0000A37900CAEEE5 AS DateTime), CAST(0x0000A37900CAEEE5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'DEFAULT', N'Default namespace', N'This is the default namespace for all pages and posts.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'Category namespace', N'This is the namespace for all categories.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
/****** Object:  Table [dbo].[sitetree]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sitetree]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sitetree](
	[sitetree_id] [uniqueidentifier] NOT NULL,
	[sitetree_namespace_id] [uniqueidentifier] NOT NULL,
	[sitetree_internal_id] [nvarchar](32) NOT NULL,
	[sitetree_name] [nvarchar](64) NOT NULL,
	[sitetree_description] [nvarchar](255) NULL,
	[sitetree_meta_title] [nvarchar](128) NULL,
	[sitetree_meta_description] [nvarchar](255) NULL,
	[sitetree_hostnames] [ntext] NULL,
	[sitetree_created] [datetime] NOT NULL,
	[sitetree_updated] [datetime] NOT NULL,
	[sitetree_created_by] [uniqueidentifier] NOT NULL,
	[sitetree_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sitetree_id] PRIMARY KEY CLUSTERED 
(
	[sitetree_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[sitetree] ([sitetree_id], [sitetree_namespace_id], [sitetree_internal_id], [sitetree_name], [sitetree_description], [sitetree_meta_title], [sitetree_meta_description], [sitetree_hostnames], [sitetree_created], [sitetree_updated], [sitetree_created_by], [sitetree_updated_by]) VALUES (N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'DEFAULT_SITE', N'Default site', N'This is the default site tree.', N'JM.Foundation', N'Die Basissolution für alle Fälle', NULL, CAST(0x0000A37900CAEEE5 AS DateTime), CAST(0x0000A37900CBCF3E AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
/****** Object:  Table [dbo].[regiontemplate]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[regiontemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[regiontemplate](
	[regiontemplate_id] [uniqueidentifier] NOT NULL,
	[regiontemplate_template_id] [uniqueidentifier] NOT NULL,
	[regiontemplate_internal_id] [nvarchar](32) NOT NULL,
	[regiontemplate_seqno] [int] NOT NULL,
	[regiontemplate_name] [nvarchar](64) NOT NULL,
	[regiontemplate_description] [nvarchar](255) NULL,
	[regiontemplate_type] [nvarchar](255) NOT NULL,
	[regiontemplate_created] [datetime] NOT NULL,
	[regiontemplate_updated] [datetime] NOT NULL,
	[regiontemplate_created_by] [uniqueidentifier] NOT NULL,
	[regiontemplate_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_regiontemplate_id] PRIMARY KEY CLUSTERED 
(
	[regiontemplate_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[regiontemplate]') AND name = N'index_regiontemplate_internal_id')
CREATE UNIQUE NONCLUSTERED INDEX [index_regiontemplate_internal_id] ON [dbo].[regiontemplate] 
(
	[regiontemplate_template_id] ASC,
	[regiontemplate_internal_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'7e1ee6f3-99f6-416a-a680-042482043a61', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Teaser2', 4, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A3880107BFEE AS DateTime), CAST(0x0000A3880107BFEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'93c752e5-c647-45eb-841a-09edc5dfafdb', N'037c1a14-7021-4d6b-b438-959065aee3c1', N't3', 1, N't3', NULL, N'TeaserExtension', CAST(0x0000A38600A6313D AS DateTime), CAST(0x0000A38600A6313D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'084e254d-9eff-428d-b65d-150620828d05', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Teaser2', 3, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A38E012EE1D0 AS DateTime), CAST(0x0000A38E012EE1D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'f8f2df80-b483-4f4f-b4dd-1f63b659968b', N'5a156e99-f961-4b23-92f0-592c89299466', N'Html', 1, N'HTML', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38500C79110 AS DateTime), CAST(0x0000A38600A694DE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Teaser1', 2, N'Teaser1', NULL, N'TeaserExtension', CAST(0x0000A38E012CB5A4 AS DateTime), CAST(0x0000A38E012EE1CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'38238874-9494-4eb0-8764-48714337d67e', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Togglebox', 3, N'Togglebox', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFE7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd5e19a48-64e4-4120-890f-5248dd5a192a', N'5a156e99-f961-4b23-92f0-592c89299466', N'Image', 3, N'Image', NULL, N'Piranha.Extend.Regions.AttachmentRegion', CAST(0x0000A38500CA1CA0 AS DateTime), CAST(0x0000A38600A694EB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd2b47bd8-1d0f-4025-84da-56ba97d98716', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'Content', 2, N'Content', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38800C0A544 AS DateTime), CAST(0x0000A38800C0A544 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'19d63331-b086-4bcd-90d9-99590fd98a7d', N'5a156e99-f961-4b23-92f0-592c89299466', N'Teaser', 4, N'Teaser', NULL, N'TeaserExtension', CAST(0x0000A38600A694F3 AS DateTime), CAST(0x0000A38600A694F3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'96adac79-5dc5-453d-a0de-a6871d74fd99', N'906761ea-6c04-4f4b-9365-f2c350ff4372', N'Content', 1, N'Content', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A37900CAEEE3 AS DateTime), CAST(0x0000A37900CAEEE3 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'156e42b3-f44a-4147-baae-b2c8fab44635', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Stage-Teaser', 1, N'Stage-Teaser', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFD8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'397356c7-75ec-4dde-9338-b6e8405e12dc', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser1', 2, N'Teaser1', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'1126a009-ad65-4998-909f-b98466d029a2', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'TestRegion2', 1, N'TestRegion2', NULL, N'FaqRegion', CAST(0x0000A386009FE9C4 AS DateTime), CAST(0x0000A386009FE9C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'Faq', 1, N'Faq', NULL, N'FaqRegion', CAST(0x0000A38C0080D2E8 AS DateTime), CAST(0x0000A38D00EAD06D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'385ff931-ea81-4c8d-85d7-be982df3ae29', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'test', 1, N'Test', NULL, N'FaqRegion', CAST(0x0000A38501307685 AS DateTime), CAST(0x0000A38501307685 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'2466d937-3fe7-440a-9d72-cc91e8e895a6', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'StageTeaser', 1, N'StageTeaser', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B256 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser4', 5, N'Teaser4', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'0a17e9f0-c9ab-417a-b4f9-d0c460c593da', N'5a156e99-f961-4b23-92f0-592c89299466', N'Text', 2, N'Text', NULL, N'Piranha.Extend.Regions.TextRegion', CAST(0x0000A38500C79110 AS DateTime), CAST(0x0000A38600A694E5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'9908fa95-1a73-4d09-8fea-d3bd992bd495', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'r3', 1, N'TestRegion3', NULL, N'FaqRegion', CAST(0x0000A38600A2F88C AS DateTime), CAST(0x0000A38600A2F88C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'e3eea34b-1590-4210-8c98-d731d5809c8d', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Teaser', 2, N'Teaser', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFDF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'07e6c9e0-a861-4eef-8b5d-e3c8f963c131', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'faq', 1, N'faq', NULL, N'FaqRegion', CAST(0x0000A38600C87918 AS DateTime), CAST(0x0000A38800C0A543 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'2db70bae-b8a2-44d4-96a9-e9581000fb69', N'a67dbaed-0474-4245-9775-857032fb8faf', N'Tabs', 1, N'Reiter', NULL, N'TabsRegion', CAST(0x0000A39500F60042 AS DateTime), CAST(0x0000A39500F60042 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser2', 3, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'3c753c0f-944d-4083-a2ed-f1335802fb5e', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Tabs', 1, N'Tabs', NULL, N'TabsRegion', CAST(0x0000A39501168963 AS DateTime), CAST(0x0000A39501168963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'5b4be865-d4ed-458b-aba7-f699f27eaace', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'StageTeaser', 1, N'StageTeaser', NULL, N'TeaserExtension', CAST(0x0000A38801042CB0 AS DateTime), CAST(0x0000A38E012EE1CA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'99040abf-46f6-4eee-abe9-fa6c3b93d403', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser3', 4, N'Teaser3', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Table [dbo].[region]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[region]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[region](
	[region_id] [uniqueidentifier] NOT NULL,
	[region_draft] [bit] NOT NULL,
	[region_page_id] [uniqueidentifier] NULL,
	[region_page_draft] [bit] NOT NULL,
	[region_regiontemplate_id] [uniqueidentifier] NULL,
	[region_name] [nvarchar](64) NULL,
	[region_body] [ntext] NULL,
	[region_created] [datetime] NOT NULL,
	[region_updated] [datetime] NOT NULL,
	[region_created_by] [uniqueidentifier] NOT NULL,
	[region_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_region_id] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC,
	[region_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'2b2b7f6c-9af6-4dac-8671-20ce8c3ea3d5', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser2","Alt":"140429_Gateway_Teaser2","Height":181,"Width":641,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6733 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'2b2b7f6c-9af6-4dac-8671-20ce8c3ea3d5', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser2","Alt":"140429_Gateway_Teaser2","Height":181,"Width":641,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6733 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'277bc751-2443-40ac-833f-44a34cd34570', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'99040abf-46f6-4eee-abe9-fa6c3b93d403', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6734 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'277bc751-2443-40ac-833f-44a34cd34570', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'99040abf-46f6-4eee-abe9-fa6c3b93d403', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6734 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'944f2d68-0885-4be0-95c6-585f5a3af5c7', 0, N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', 0, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Dies ist die 2.Ebene</p>', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'944f2d68-0885-4be0-95c6-585f5a3af5c7', 1, N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', 1, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Dies ist die 2.Ebene</p>', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b58a2303-7055-41f1-b205-6867fad03da0', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'5b4be865-d4ed-458b-aba7-f699f27eaace', NULL, N'{"Header":"Stage Teaser auf startseite","FooterText":"my footer text","FooterLink":"https://my-footer.com","BulletPoints":["bp 1","bp 2","","",""],"Image":{"ImageName":"stage-teaser","Alt":"Stage-Teaser-ALT","Height":391,"Width":1283,"HeightTablet":468,"WidthTablet":960,"HeightMobile":197,"WidthMobile":768,"Attributes":["System.Object[]"]}}', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A393011A2321 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b58a2303-7055-41f1-b205-6867fad03da0', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'5b4be865-d4ed-458b-aba7-f699f27eaace', NULL, N'{"Header":"Stage Teaser auf startseite","FooterText":"my footer text","FooterLink":"https://my-footer.com","BulletPoints":["bp 1","bp 2","","",""],"Image":{"ImageName":"stage-teaser","Alt":"Stage-Teaser-ALT","Height":391,"Width":1283,"HeightTablet":468,"WidthTablet":960,"HeightMobile":197,"WidthMobile":768,"Attributes":["System.Object[]"]}}', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A393011A2321 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'5a3435bb-c16d-4c76-81b7-79156197ca1e', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'2466d937-3fe7-440a-9d72-cc91e8e895a6', NULL, N'{"Header":"Stage Teaser auf Level1","FooterText":"my footer text","FooterLink":"https://my-footer.com","BulletPoints":["","","","",""],"Image":{"ImageName":"stage-teaser","Alt":"Stage-Teaser-ALT","Height":391,"Width":1283,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6731 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'5a3435bb-c16d-4c76-81b7-79156197ca1e', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'2466d937-3fe7-440a-9d72-cc91e8e895a6', NULL, N'{"Header":"Stage Teaser auf Level1","FooterText":"my footer text","FooterLink":"https://my-footer.com","BulletPoints":["","","","",""],"Image":{"ImageName":"stage-teaser","Alt":"Stage-Teaser-ALT","Height":391,"Width":1283,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6730 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b936f6c0-b276-4ff1-acbd-9f5c66a29363', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6735 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b936f6c0-b276-4ff1-acbd-9f5c66a29363', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6735 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c1dc024b-3ce1-4e60-ba50-aab5bd126615', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', NULL, N'{"Header":"Test1","FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":"sdf","Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A38E012D22A0 AS DateTime), CAST(0x0000A393011A2322 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c1dc024b-3ce1-4e60-ba50-aab5bd126615', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', NULL, N'{"Header":"Test1","FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":"sdf","Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A38E012D22A0 AS DateTime), CAST(0x0000A393011A2321 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'edfae097-cdb9-4d8a-8f3d-b1458d275da5', 0, N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', 0, N'3c753c0f-944d-4083-a2ed-f1335802fb5e', NULL, N'{"Tabs":[{"Title":"Reiter 1","Body":"\u003cp\u003eContent \u003cstrong\u003e1fdsfsdf\u003c/strong\u003e\u003c/p\u003e"},{"Title":"Reiter 2","Body":"\u003col\u003e\r\n\u003cli\u003eContent 2 ist jetzt Html \u0026nbsp;\u003c/li\u003e\r\n\u003cli\u003edffdghdfgh\u003c/li\u003e\r\n\u003cli\u003e89\u0026szlig;090\u0026szlig;\u003c/li\u003e\r\n\u003c/ol\u003e\r\n\u003cp\u003e\u0026nbsp;\u003c/p\u003e"},{"Title":"Reiter 3","Body":"\u003cp\u003eReiter111\u003c/p\u003e"}]}', CAST(0x0000A3950116A534 AS DateTime), CAST(0x0000A39A00992B92 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'edfae097-cdb9-4d8a-8f3d-b1458d275da5', 1, N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', 1, N'3c753c0f-944d-4083-a2ed-f1335802fb5e', NULL, N'{"Tabs":[{"Title":"Reiter 1","Body":"\u003cp\u003eContent \u003cstrong\u003e1fdsfsdf\u003c/strong\u003e\u003c/p\u003e"},{"Title":"Reiter 2","Body":"\u003col\u003e\r\n\u003cli\u003eContent 2 ist jetzt Html \u0026nbsp;\u003c/li\u003e\r\n\u003cli\u003edffdghdfgh\u003c/li\u003e\r\n\u003cli\u003e89\u0026szlig;090\u0026szlig;\u003c/li\u003e\r\n\u003c/ol\u003e\r\n\u003cp\u003e\u0026nbsp;\u003c/p\u003e"},{"Title":"Reiter 3","Body":"\u003cp\u003eReiter111\u003c/p\u003e"}]}', CAST(0x0000A3950116A534 AS DateTime), CAST(0x0000A39A00992B90 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'e5f170a4-a490-40ad-9d60-b40ec56c30e4', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'397356c7-75ec-4dde-9338-b6e8405e12dc', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6732 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'e5f170a4-a490-40ad-9d60-b40ec56c30e4', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'397356c7-75ec-4dde-9338-b6e8405e12dc', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser1","Alt":null,"Height":181,"Width":640,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6732 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'eadf6c9c-157c-4b32-9783-c538d5230cd4', 0, N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', 0, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Wir sind die Innovatoren hier und immer schon da, wenn es was Neues gibt.</p>', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'eadf6c9c-157c-4b32-9783-c538d5230cd4', 1, N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', 1, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Wir sind die Innovatoren hier und immer schon da, wenn es was Neues gibt.</p>', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'11a1ece6-6b0c-4cc1-8f8f-ef8d1aa2e2c1', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'084e254d-9eff-428d-b65d-150620828d05', NULL, N'{"Header":"Test2","FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser2","Alt":"sdfsdf","Height":181,"Width":641,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A38E012EFE68 AS DateTime), CAST(0x0000A393011A2323 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'11a1ece6-6b0c-4cc1-8f8f-ef8d1aa2e2c1', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'084e254d-9eff-428d-b65d-150620828d05', NULL, N'{"Header":"Test2","FooterText":null,"FooterLink":null,"BulletPoints":null,"Image":{"ImageName":"GatewayTeaser2","Alt":"sdfsdf","Height":181,"Width":641,"HeightTablet":0,"WidthTablet":0,"HeightMobile":0,"WidthMobile":0,"Attributes":["System.Object[]"]}}', CAST(0x0000A38E012EFE68 AS DateTime), CAST(0x0000A393011A2322 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'd536ede5-6bdc-4f91-b5f2-f806296d37cf', 0, N'ed965a13-a99d-467f-b9b8-faad61779ad9', 0, N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', NULL, N'{"Faqs":[{"Title":"Woher kommt diese Frage und die Antwort?","Body":"Piranha"},{"Title":"5","Body":"Fünfhundert"},{"Title":"6","Body":"6"},{"Title":"wefwef","Body":"wefwef"}]}', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A39501143453 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'd536ede5-6bdc-4f91-b5f2-f806296d37cf', 1, N'ed965a13-a99d-467f-b9b8-faad61779ad9', 1, N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', NULL, N'{"Faqs":[{"Title":"Woher kommt diese Frage und die Antwort?","Body":"Piranha"},{"Title":"5","Body":"Fünfhundert"},{"Title":"6","Body":"6"},{"Title":"wefwef","Body":"wefwef"}]}', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A39501143450 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
/****** Object:  Table [dbo].[property]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[property]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[property](
	[property_id] [uniqueidentifier] NOT NULL,
	[property_draft] [bit] NOT NULL,
	[property_parent_id] [uniqueidentifier] NOT NULL,
	[property_name] [nvarchar](64) NOT NULL,
	[property_value] [ntext] NULL,
	[property_created] [datetime] NOT NULL,
	[property_updated] [datetime] NOT NULL,
	[property_created_by] [uniqueidentifier] NOT NULL,
	[property_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_property_id] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC,
	[property_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[post]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[post]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[post](
	[post_id] [uniqueidentifier] NOT NULL,
	[post_draft] [bit] NOT NULL,
	[post_template_id] [uniqueidentifier] NOT NULL,
	[post_permalink_id] [uniqueidentifier] NOT NULL,
	[post_title] [nvarchar](128) NOT NULL,
	[post_keywords] [nvarchar](128) NULL,
	[post_description] [nvarchar](255) NULL,
	[post_rss] [bit] NOT NULL,
	[post_excerpt] [nvarchar](255) NULL,
	[post_body] [ntext] NULL,
	[post_attachments] [ntext] NULL,
	[post_controller] [nvarchar](128) NULL,
	[post_view] [nvarchar](128) NULL,
	[post_archive_controller] [nvarchar](128) NULL,
	[post_created] [datetime] NOT NULL,
	[post_updated] [datetime] NOT NULL,
	[post_published] [datetime] NULL,
	[post_last_published] [datetime] NULL,
	[post_last_modified] [datetime] NULL,
	[post_created_by] [uniqueidentifier] NOT NULL,
	[post_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_post_id] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[post_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[post] ([post_id], [post_draft], [post_template_id], [post_permalink_id], [post_title], [post_keywords], [post_description], [post_rss], [post_excerpt], [post_body], [post_attachments], [post_controller], [post_view], [post_archive_controller], [post_created], [post_updated], [post_published], [post_last_published], [post_last_modified], [post_created_by], [post_updated_by]) VALUES (N'6de553fa-b855-439a-b350-1eb460d50a51', 0, N'5017dbe4-5685-4941-921b-ca922edc7a12', N'4065756c-2225-47e0-b077-a46d09e56916', N'Neuste Nachrichten', NULL, NULL, 1, N'Wir freuen uns, euch heute von der ersten geglückten Verschmelzung von zwei gegensätzlichen Dingen berichten zu können.', N'<p>Wir freuen uns, euch heute von der ersten gegl&uuml;ckten Verschmelzung von zwei gegens&auml;tzlichen Dingen berichten zu k&ouml;nnen.</p>
<p>There''s an issue when using another authentication together with the SinglePageController &amp; SinglePostController. The issue is that the they try to check for permissions/access rights and assumes that the logged in user is from the Piranha CMS db. When the id of the current user is not in a Guid format the security check breaks.</p>
<p>Another issue is when being logged in with you forms authentication and then navigating to the manager interface. The same assumption will be made and the security check will crash.</p>
<p>There&acute;s a currently open issue on this here (<a class="issue-link" title="Integrate Piranha CMS with the common membership system?" href="https://github.com/PiranhaCMS/Piranha/issues/168">#168</a>) and some tricks on how to get around it here (<a class="issue-link" title="Security guid parsing error" href="https://github.com/PiranhaCMS/Piranha/issues/177">#177</a>).</p>
<p>Note that the existing authentication mechanism in Piranha CMS will be removed and instead the framework will integrate with the existing authentication of the web application.</p>', N'[]', NULL, NULL, NULL, CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[post] ([post_id], [post_draft], [post_template_id], [post_permalink_id], [post_title], [post_keywords], [post_description], [post_rss], [post_excerpt], [post_body], [post_attachments], [post_controller], [post_view], [post_archive_controller], [post_created], [post_updated], [post_published], [post_last_published], [post_last_modified], [post_created_by], [post_updated_by]) VALUES (N'6de553fa-b855-439a-b350-1eb460d50a51', 1, N'5017dbe4-5685-4941-921b-ca922edc7a12', N'4065756c-2225-47e0-b077-a46d09e56916', N'Neuste Nachrichten', NULL, NULL, 1, N'Wir freuen uns, euch heute von der ersten geglückten Verschmelzung von zwei gegensätzlichen Dingen berichten zu können.', N'<p>Wir freuen uns, euch heute von der ersten gegl&uuml;ckten Verschmelzung von zwei gegens&auml;tzlichen Dingen berichten zu k&ouml;nnen.</p>
<p>There''s an issue when using another authentication together with the SinglePageController &amp; SinglePostController. The issue is that the they try to check for permissions/access rights and assumes that the logged in user is from the Piranha CMS db. When the id of the current user is not in a Guid format the security check breaks.</p>
<p>Another issue is when being logged in with you forms authentication and then navigating to the manager interface. The same assumption will be made and the security check will crash.</p>
<p>There&acute;s a currently open issue on this here (<a class="issue-link" title="Integrate Piranha CMS with the common membership system?" href="https://github.com/PiranhaCMS/Piranha/issues/168">#168</a>) and some tricks on how to get around it here (<a class="issue-link" title="Security guid parsing error" href="https://github.com/PiranhaCMS/Piranha/issues/177">#177</a>).</p>
<p>Note that the existing authentication mechanism in Piranha CMS will be removed and instead the framework will integrate with the existing authentication of the web application.</p>', N'[]', NULL, NULL, NULL, CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
/****** Object:  Table [dbo].[content]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[content]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[content](
	[content_id] [uniqueidentifier] NOT NULL,
	[content_draft] [bit] NOT NULL,
	[content_parent_id] [uniqueidentifier] NULL,
	[content_permalink_id] [uniqueidentifier] NULL,
	[content_filename] [nvarchar](128) NULL,
	[content_url] [nvarchar](255) NULL,
	[content_synced] [datetime] NULL,
	[content_name] [nvarchar](128) NULL,
	[content_type] [nvarchar](255) NULL,
	[content_size] [int] NOT NULL,
	[content_image] [bit] NOT NULL,
	[content_folder] [bit] NOT NULL,
	[content_width] [int] NULL,
	[content_height] [int] NULL,
	[content_alt] [nvarchar](128) NULL,
	[content_description] [nvarchar](255) NULL,
	[content_created] [datetime] NOT NULL,
	[content_updated] [datetime] NOT NULL,
	[content_published] [datetime] NULL,
	[content_last_published] [datetime] NULL,
	[content_created_by] [uniqueidentifier] NOT NULL,
	[content_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_content_id] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[content_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'37dccf84-07fc-4250-a193-361ae6547447', 0, NULL, N'2e4963a4-827a-4efa-95c6-98e14e8f012c', N'GatewayTeaser2-641-181.jpg', NULL, NULL, NULL, N'image/jpeg', 135652, 1, 0, 641, 181, NULL, NULL, CAST(0x0000A39200BF0671 AS DateTime), CAST(0x0000A39200BF0671 AS DateTime), CAST(0x0000A39200BF065C AS DateTime), CAST(0x0000A39200BF065C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'37dccf84-07fc-4250-a193-361ae6547447', 1, NULL, N'2e4963a4-827a-4efa-95c6-98e14e8f012c', N'GatewayTeaser2-641-181.jpg', NULL, NULL, NULL, N'image/jpeg', 135652, 1, 0, 641, 181, NULL, NULL, CAST(0x0000A39200BF065C AS DateTime), CAST(0x0000A39200BF065C AS DateTime), CAST(0x0000A39200BF065C AS DateTime), CAST(0x0000A39200BF065C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'966a684d-cf68-4b4d-b809-5ac7755a53be', 0, NULL, N'66be007c-6a60-465b-a8eb-0be5370174d6', N'stage-teaser-1283-391.jpg', NULL, NULL, NULL, N'image/jpeg', 55297, 1, 0, 940, 286, NULL, NULL, CAST(0x0000A39200BF1D49 AS DateTime), CAST(0x0000A39200BF1D49 AS DateTime), CAST(0x0000A39200BF1D3D AS DateTime), CAST(0x0000A39200BF1D3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'966a684d-cf68-4b4d-b809-5ac7755a53be', 1, NULL, N'66be007c-6a60-465b-a8eb-0be5370174d6', N'stage-teaser-1283-391.jpg', NULL, NULL, NULL, N'image/jpeg', 55297, 1, 0, 940, 286, NULL, NULL, CAST(0x0000A39200BF1D3D AS DateTime), CAST(0x0000A39200BF1D3D AS DateTime), CAST(0x0000A39200BF1D3D AS DateTime), CAST(0x0000A39200BF1D3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'4870673b-684c-4b9d-8f03-af85039e6f87', 0, NULL, NULL, NULL, NULL, NULL, N'stage-teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A38B0091D1C7 AS DateTime), CAST(0x0000A38B0091D1C7 AS DateTime), CAST(0x0000A38B0091D1B3 AS DateTime), CAST(0x0000A38B0091D1B3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'4870673b-684c-4b9d-8f03-af85039e6f87', 1, NULL, NULL, NULL, NULL, NULL, N'stage-teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A38B0091D1B3 AS DateTime), CAST(0x0000A38B0091D1B3 AS DateTime), CAST(0x0000A38B0091D1B3 AS DateTime), CAST(0x0000A38B0091D1B3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'28b7b418-1bae-4290-bb03-b7dc3cd47514', 1, NULL, NULL, NULL, NULL, NULL, N'Teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A38B008E1789 AS DateTime), CAST(0x0000A38B008E17A9 AS DateTime), NULL, NULL, N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'b5bc4109-a0b9-4a38-acad-d0b19d331858', 0, NULL, N'e223275b-819c-47a2-a57a-a4322be53818', N'GatewayTeaser1-640-181.jpg', NULL, NULL, NULL, N'image/jpeg', 124648, 1, 0, 640, 181, NULL, NULL, CAST(0x0000A39200BF1001 AS DateTime), CAST(0x0000A39200BF1001 AS DateTime), CAST(0x0000A39200BF0FF0 AS DateTime), CAST(0x0000A39200BF0FF0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'b5bc4109-a0b9-4a38-acad-d0b19d331858', 1, NULL, N'e223275b-819c-47a2-a57a-a4322be53818', N'GatewayTeaser1-640-181.jpg', NULL, NULL, NULL, N'image/jpeg', 124648, 1, 0, 640, 181, NULL, NULL, CAST(0x0000A39200BF0FF0 AS DateTime), CAST(0x0000A39200BF0FF0 AS DateTime), CAST(0x0000A39200BF0FF0 AS DateTime), CAST(0x0000A39200BF0FF0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'd9e0baea-32eb-4bd2-9982-db85641cc24f', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'51097f76-957d-4aaf-943a-4658def4b7c0', N'140429_Hidrostal_International_MainTeaser.jpg', NULL, NULL, N'Hidrostal_International_MainTeaser_Large', N'image/jpeg', 55297, 1, 0, 940, 286, N'Alt Text', NULL, CAST(0x0000A38B008F683A AS DateTime), CAST(0x0000A38B008F683A AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'd9e0baea-32eb-4bd2-9982-db85641cc24f', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'51097f76-957d-4aaf-943a-4658def4b7c0', N'140429_Hidrostal_International_MainTeaser.jpg', NULL, NULL, N'Hidrostal_International_MainTeaser_Large', N'image/jpeg', 55297, 1, 0, 940, 286, N'Alt Text', NULL, CAST(0x0000A38B008EDE38 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Table [dbo].[upload]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[upload]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[upload](
	[upload_id] [uniqueidentifier] NOT NULL,
	[upload_parent_id] [uniqueidentifier] NULL,
	[upload_filename] [nvarchar](128) NOT NULL,
	[upload_type] [nvarchar](255) NOT NULL,
	[upload_created] [datetime] NOT NULL,
	[upload_updated] [datetime] NOT NULL,
	[upload_created_by] [uniqueidentifier] NOT NULL,
	[upload_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_upload_id] PRIMARY KEY CLUSTERED 
(
	[upload_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[extension]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[extension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[extension](
	[extension_id] [uniqueidentifier] NOT NULL,
	[extension_draft] [bit] NOT NULL,
	[extension_parent_id] [uniqueidentifier] NOT NULL,
	[extension_body] [ntext] NULL,
	[extension_type] [nvarchar](255) NOT NULL,
	[extension_created] [datetime] NOT NULL,
	[extension_updated] [datetime] NOT NULL,
	[extension_created_by] [uniqueidentifier] NOT NULL,
	[extension_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_extension_id] PRIMARY KEY CLUSTERED 
(
	[extension_id] ASC,
	[extension_draft] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[comment]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comment](
	[comment_id] [uniqueidentifier] NOT NULL,
	[comment_parent_id] [uniqueidentifier] NOT NULL,
	[comment_parent_draft] [bit] NOT NULL,
	[comment_status] [int] NOT NULL,
	[comment_reported_count] [int] NOT NULL,
	[comment_title] [nvarchar](64) NULL,
	[comment_body] [ntext] NOT NULL,
	[comment_author_name] [nvarchar](128) NULL,
	[comment_author_email] [nvarchar](128) NULL,
	[comment_created] [datetime] NOT NULL,
	[comment_updated] [datetime] NOT NULL,
	[comment_created_by] [uniqueidentifier] NULL,
	[comment_updated_by] [uniqueidentifier] NULL,
 CONSTRAINT [pk_comment_id] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[permalink]    Script Date: 09/02/2014 09:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permalink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[permalink](
	[permalink_id] [uniqueidentifier] NOT NULL,
	[permalink_namespace_id] [uniqueidentifier] NOT NULL,
	[permalink_type] [nvarchar](16) NOT NULL,
	[permalink_name] [nvarchar](128) NOT NULL,
	[permalink_created] [datetime] NOT NULL,
	[permalink_updated] [datetime] NOT NULL,
	[permalink_created_by] [uniqueidentifier] NOT NULL,
	[permalink_updated_by] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_permalink_id] PRIMARY KEY CLUSTERED 
(
	[permalink_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[permalink]') AND name = N'index_permalink_name')
CREATE UNIQUE NONCLUSTERED INDEX [index_permalink_name] ON [dbo].[permalink] 
(
	[permalink_namespace_id] ASC,
	[permalink_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'2e168001-d113-4216-acc5-03c61c2d0c21', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'SITE', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF1D AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'66be007c-6a60-465b-a8eb-0be5370174d6', N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'stage-teaser-1283-391.jpg', CAST(0x0000A39200BF1D23 AS DateTime), CAST(0x0000A39200BF1D23 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'6f6df54c-72f6-4953-9476-17d042b6b03c', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'largeteaser', CAST(0x0000A38B008E5F89 AS DateTime), CAST(0x0000A38B008E5F89 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'51097f76-957d-4aaf-943a-4658def4b7c0', N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'140429hidrostalinternationalmainteaser.jpg', CAST(0x0000A38B008EDE38 AS DateTime), CAST(0x0000A38B008F682C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'title', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A393011A2323 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'3a2fd452-5f49-4d60-b773-60170b6e9a14', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'leve-1-page', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39200BF6736 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'3c3e5513-a8ff-4844-aa1e-6f89675470d9', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'smallpic', CAST(0x0000A38B008E4388 AS DateTime), CAST(0x0000A38B008E4ECE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'eefe0d70-a5a7-4ed4-b32e-800fb25268ba', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'title/level1/level2', CAST(0x0000A38E0114048C AS DateTime), CAST(0x0000A39A00992B93 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'70f2b68d-cf8e-4d80-8843-8807ff28103a', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'2-ebene', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'398e5409-bfe3-4db6-ae0d-8db92322b31f', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'aa', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A39501143454 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'2e4963a4-827a-4efa-95c6-98e14e8f012c', N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'gatewayteaser2-641-181.jpg', CAST(0x0000A39200BF0657 AS DateTime), CAST(0x0000A39200BF0657 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'e223275b-819c-47a2-a57a-a4322be53818', N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'gatewayteaser1-640-181.jpg', CAST(0x0000A39200BF0FEA AS DateTime), CAST(0x0000A39200BF0FEA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'4065756c-2225-47e0-b077-a46d09e56916', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'POST', N'neuste-nachrichten', CAST(0x0000A37900F5F1D3 AS DateTime), CAST(0x0000A37900F5F1D4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'ganz-vorne-dabei', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'02a1ac67-4339-4d2d-a53a-e8fdd80e0213', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'midteaser', CAST(0x0000A38B008E5652 AS DateTime), CAST(0x0000A38B008E5652 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
/****** Object:  Default [DF__comment__comment__04E4BC85]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__comment__comment__04E4BC85]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__comment__comment__04E4BC85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_parent_draft]
END


End
GO
/****** Object:  Default [DF__comment__comment__05D8E0BE]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__comment__comment__05D8E0BE]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__comment__comment__05D8E0BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_status]
END


End
GO
/****** Object:  Default [DF__comment__comment__06CD04F7]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__comment__comment__06CD04F7]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__comment__comment__06CD04F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_reported_count]
END


End
GO
/****** Object:  Default [DF__content__content__73BA3083]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__content__content__73BA3083]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__content__content__73BA3083]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((1)) FOR [content_draft]
END


End
GO
/****** Object:  Default [DF__content__content__74AE54BC]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__content__content__74AE54BC]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__content__content__74AE54BC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_size]
END


End
GO
/****** Object:  Default [DF__content__content__75A278F5]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__content__content__75A278F5]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__content__content__75A278F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_image]
END


End
GO
/****** Object:  Default [DF__content__content__76969D2E]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__content__content__76969D2E]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__content__content__76969D2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_folder]
END


End
GO
/****** Object:  Default [DF__extension__exten__00200768]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__extension__exten__00200768]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__extension__exten__00200768]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[extension] ADD  DEFAULT ((1)) FOR [extension_draft]
END


End
GO
/****** Object:  Default [DF__page__page_draft__52593CB8]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__page__page_draft__52593CB8]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__page__page_draft__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_draft]
END


End
GO
/****** Object:  Default [DF__page__page_seqno__534D60F1]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__page__page_seqno__534D60F1]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__page__page_seqno__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_seqno]
END


End
GO
/****** Object:  Default [DF__page__page_is_hi__5441852A]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__page__page_is_hi__5441852A]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__page__page_is_hi__5441852A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((0)) FOR [page_is_hidden]
END


End
GO
/****** Object:  Default [DF__pagetempl__paget__3A81B327]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__pagetempl__paget__3A81B327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_controller_show]
END


End
GO
/****** Object:  Default [DF__pagetempl__paget__3B75D760]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__pagetempl__paget__3B75D760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_view_show]
END


End
GO
/****** Object:  Default [DF__pagetempl__paget__3C69FB99]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__pagetempl__paget__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_redirect_show]
END


End
GO
/****** Object:  Default [DF__pagetempl__paget__3D5E1FD2]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__pagetempl__paget__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_site_template]
END


End
GO
/****** Object:  Default [DF__post__post_draft__6C190EBB]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__post__post_draft__6C190EBB]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__post__post_draft__6C190EBB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_draft]
END


End
GO
/****** Object:  Default [DF__post__post_rss__6D0D32F4]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__post__post_rss__6D0D32F4]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__post__post_rss__6D0D32F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_rss]
END


End
GO
/****** Object:  Default [DF__posttempl__postt__4222D4EF]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__4222D4EF]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__posttempl__postt__4222D4EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_controller_show]
END


End
GO
/****** Object:  Default [DF__posttempl__postt__4316F928]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__4316F928]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__posttempl__postt__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_view_show]
END


End
GO
/****** Object:  Default [DF__posttempl__postt__440B1D61]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__posttempl__postt__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_archive_controller_show]
END


End
GO
/****** Object:  Default [DF__posttempl__postt__44FF419A]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__44FF419A]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__posttempl__postt__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((1)) FOR [posttemplate_rss]
END


End
GO
/****** Object:  Default [DF__property__proper__6754599E]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__property__proper__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__property__proper__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[property] ADD  DEFAULT ((1)) FOR [property_draft]
END


End
GO
/****** Object:  Default [DF__region__region_d__5FB337D6]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__region__region_d__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__region__region_d__5FB337D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_draft]
END


End
GO
/****** Object:  Default [DF__region__region_p__60A75C0F]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__region__region_p__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__region__region_p__60A75C0F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_page_draft]
END


End
GO
/****** Object:  Default [DF__regiontem__regio__5AEE82B9]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__regiontem__regio__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__regiontem__regio__5AEE82B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[regiontemplate] ADD  DEFAULT ((1)) FOR [regiontemplate_seqno]
END


End
GO
/****** Object:  Default [DF__relation__relati__4F7CD00D]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__relation__relati__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[relation]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__relation__relati__4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[relation] ADD  DEFAULT ((1)) FOR [relation_draft]
END


End
GO
/****** Object:  Default [DF__sysaccess__sysac__21B6055D]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__sysaccess__sysac__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__sysaccess__sysac__21B6055D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysaccess] ADD  DEFAULT ((0)) FOR [sysaccess_locked]
END


End
GO
/****** Object:  Default [DF__sysparam__syspar__267ABA7A]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__sysparam__syspar__267ABA7A]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__sysparam__syspar__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysparam] ADD  DEFAULT ((0)) FOR [sysparam_locked]
END


End
GO
/****** Object:  Default [DF__sysuser__sysuser__1B0907CE]    Script Date: 09/02/2014 09:54:49 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__sysuser__sysuser__1B0907CE]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysuser]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__sysuser__sysuser__1B0907CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysuser] ADD  DEFAULT ((0)) FOR [sysuser_locked]
END


End
GO
/****** Object:  ForeignKey [fk_category_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_created_by] FOREIGN KEY([category_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_created_by]
GO
/****** Object:  ForeignKey [fk_category_permalink_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_permalink_id] FOREIGN KEY([category_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_permalink_id]
GO
/****** Object:  ForeignKey [fk_category_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_updated_by] FOREIGN KEY([category_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_updated_by]
GO
/****** Object:  ForeignKey [fk_comment_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_created_by] FOREIGN KEY([comment_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_created_by]
GO
/****** Object:  ForeignKey [fk_comment_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_updated_by] FOREIGN KEY([comment_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_updated_by]
GO
/****** Object:  ForeignKey [fk_content_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_created_by] FOREIGN KEY([content_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_created_by]
GO
/****** Object:  ForeignKey [fk_content_permalink_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_permalink_id] FOREIGN KEY([content_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_permalink_id]
GO
/****** Object:  ForeignKey [fk_content_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_updated_by] FOREIGN KEY([content_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_updated_by]
GO
/****** Object:  ForeignKey [fk_extension_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_created_by] FOREIGN KEY([extension_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_created_by]
GO
/****** Object:  ForeignKey [fk_extension_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_updated_by] FOREIGN KEY([extension_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_updated_by]
GO
/****** Object:  ForeignKey [fk_namespace_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_created_by] FOREIGN KEY([namespace_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_created_by]
GO
/****** Object:  ForeignKey [fk_namespace_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_updated_by] FOREIGN KEY([namespace_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_updated_by]
GO
/****** Object:  ForeignKey [fk_page_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_created_by] FOREIGN KEY([page_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_created_by]
GO
/****** Object:  ForeignKey [fk_page_permalink_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_permalink_id] FOREIGN KEY([page_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_permalink_id]
GO
/****** Object:  ForeignKey [fk_page_template_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_template_id] FOREIGN KEY([page_template_id])
REFERENCES [dbo].[pagetemplate] ([pagetemplate_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_template_id]
GO
/****** Object:  ForeignKey [fk_page_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_updated_by] FOREIGN KEY([page_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_updated_by]
GO
/****** Object:  ForeignKey [fk_pagetemplate_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_created_by] FOREIGN KEY([pagetemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_created_by]
GO
/****** Object:  ForeignKey [fk_pagetemplate_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_updated_by] FOREIGN KEY([pagetemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_updated_by]
GO
/****** Object:  ForeignKey [fk_permalink_namespace_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_permalink_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[permalink]'))
ALTER TABLE [dbo].[permalink]  WITH CHECK ADD  CONSTRAINT [fk_permalink_namespace_id] FOREIGN KEY([permalink_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_permalink_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[permalink]'))
ALTER TABLE [dbo].[permalink] CHECK CONSTRAINT [fk_permalink_namespace_id]
GO
/****** Object:  ForeignKey [fk_post_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_created_by] FOREIGN KEY([post_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_created_by]
GO
/****** Object:  ForeignKey [fk_post_permalink_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_permalink_id] FOREIGN KEY([post_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_permalink_id]
GO
/****** Object:  ForeignKey [fk_post_template_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_template_id] FOREIGN KEY([post_template_id])
REFERENCES [dbo].[posttemplate] ([posttemplate_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_template_id]
GO
/****** Object:  ForeignKey [fk_post_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_updated_by] FOREIGN KEY([post_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_updated_by]
GO
/****** Object:  ForeignKey [fk_posttemplate_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_created_by] FOREIGN KEY([posttemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_created_by]
GO
/****** Object:  ForeignKey [fk_posttemplate_permalink_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_permalink_id] FOREIGN KEY([posttemplate_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_permalink_id]
GO
/****** Object:  ForeignKey [fk_posttemplate_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_updated_by] FOREIGN KEY([posttemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_updated_by]
GO
/****** Object:  ForeignKey [fk_property_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_created_by] FOREIGN KEY([property_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_created_by]
GO
/****** Object:  ForeignKey [fk_property_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_updated_by] FOREIGN KEY([property_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_updated_by]
GO
/****** Object:  ForeignKey [fk_region_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_created_by] FOREIGN KEY([region_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_created_by]
GO
/****** Object:  ForeignKey [fk_region_page_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_page_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_page_id] FOREIGN KEY([region_page_id], [region_page_draft])
REFERENCES [dbo].[page] ([page_id], [page_draft])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_page_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_page_id]
GO
/****** Object:  ForeignKey [fk_region_regiontemplate]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_regiontemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_regiontemplate] FOREIGN KEY([region_regiontemplate_id])
REFERENCES [dbo].[regiontemplate] ([regiontemplate_id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_regiontemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_regiontemplate]
GO
/****** Object:  ForeignKey [fk_region_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_updated_by] FOREIGN KEY([region_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_updated_by]
GO
/****** Object:  ForeignKey [fk_regiontemplate_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_created_by] FOREIGN KEY([regiontemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_created_by]
GO
/****** Object:  ForeignKey [fk_regiontemplate_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_updated_by] FOREIGN KEY([regiontemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_updated_by]
GO
/****** Object:  ForeignKey [fk_sitetree_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_created_by] FOREIGN KEY([sitetree_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_created_by]
GO
/****** Object:  ForeignKey [fk_sitetree_namespace_id]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_namespace_id] FOREIGN KEY([sitetree_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_namespace_id]
GO
/****** Object:  ForeignKey [fk_sitetree_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_updated_by] FOREIGN KEY([sitetree_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_updated_by]
GO
/****** Object:  ForeignKey [fk_sysaccess_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_created_by] FOREIGN KEY([sysaccess_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_created_by]
GO
/****** Object:  ForeignKey [fk_sysaccess_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_updated_by] FOREIGN KEY([sysaccess_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_updated_by]
GO
/****** Object:  ForeignKey [fk_sysgroup_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_created_by] FOREIGN KEY([sysgroup_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_created_by]
GO
/****** Object:  ForeignKey [fk_sysgroup_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_updated_by] FOREIGN KEY([sysgroup_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_updated_by]
GO
/****** Object:  ForeignKey [fk_syslog_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_created_by] FOREIGN KEY([syslog_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_created_by]
GO
/****** Object:  ForeignKey [fk_syslog_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_updated_by] FOREIGN KEY([syslog_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_updated_by]
GO
/****** Object:  ForeignKey [fk_sysparam_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_created_by] FOREIGN KEY([sysparam_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_created_by]
GO
/****** Object:  ForeignKey [fk_sysparam_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_updated_by] FOREIGN KEY([sysparam_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_updated_by]
GO
/****** Object:  ForeignKey [fk_upload_created_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_created_by] FOREIGN KEY([upload_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_created_by]
GO
/****** Object:  ForeignKey [fk_upload_updated_by]    Script Date: 09/02/2014 09:54:49 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_updated_by] FOREIGN KEY([upload_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_updated_by]
GO
