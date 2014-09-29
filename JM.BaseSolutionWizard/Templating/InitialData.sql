/****** Object:  Table [dbo].[category]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[comment]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[content]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[extension]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[namespace]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[page]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[pagetemplate]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[permalink]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[post]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[posttemplate]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[property]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[region]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[regiontemplate]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[relation]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sitetree]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sysaccess]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sysgroup]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[syslog]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sysparam]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[sysuser]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[upload]    Script Date: 18.09.2014 14:03:52 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'1248b2e6-451c-4b1a-ae0d-44718231ff35', NULL, N'02a1ac67-4339-4d2d-a53a-e8fdd80e0213', N'MidTeaser', NULL, CAST(0x0000A38B008E5653 AS DateTime), CAST(0x0000A38B008E5653 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', NULL, N'3c3e5513-a8ff-4844-aa1e-6f89675470d9', N'SmallTeaser', NULL, CAST(0x0000A38B008E4388 AS DateTime), CAST(0x0000A38B008E4ED0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[category] ([category_id], [category_parent_id], [category_permalink_id], [category_name], [category_description], [category_created], [category_updated], [category_created_by], [category_updated_by]) VALUES (N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1', NULL, N'6f6df54c-72f6-4953-9476-17d042b6b03c', N'LargeTeaser', NULL, CAST(0x0000A38B008E5F89 AS DateTime), CAST(0x0000A38B008E5F89 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'5869354a-9f32-4285-b7c3-261289a8aeea', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser5', N'image/jpeg', 28641, 1, 0, 610, 190, N'Teaser5', NULL, CAST(0x0000A39C00AF597D AS DateTime), CAST(0x0000A39C00AF597D AS DateTime), CAST(0x0000A39C00AF5978 AS DateTime), CAST(0x0000A39C00AF5978 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'5869354a-9f32-4285-b7c3-261289a8aeea', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser5', N'image/jpeg', 28641, 1, 0, 610, 190, N'Teaser5', NULL, CAST(0x0000A39C00AF5978 AS DateTime), CAST(0x0000A39C00AF5978 AS DateTime), CAST(0x0000A39C00AF5978 AS DateTime), CAST(0x0000A39C00AF5978 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'aea05fa9-e3f1-4f24-9bad-27e09794827c', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser1', N'image/jpeg', 36558, 1, 0, 610, 190, N'Teaser1', NULL, CAST(0x0000A39C00ADEC72 AS DateTime), CAST(0x0000A39C00ADEC72 AS DateTime), CAST(0x0000A39C00ADEC6A AS DateTime), CAST(0x0000A39C00ADEC6A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'aea05fa9-e3f1-4f24-9bad-27e09794827c', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser1', N'image/jpeg', 36558, 1, 0, 610, 190, N'Teaser1', NULL, CAST(0x0000A39C00ADEC6A AS DateTime), CAST(0x0000A39C00ADEC6A AS DateTime), CAST(0x0000A39C00ADEC6A AS DateTime), CAST(0x0000A39C00ADEC6A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', 0, NULL, NULL, NULL, NULL, NULL, N'teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A39D009743B9 AS DateTime), CAST(0x0000A39D009743B9 AS DateTime), CAST(0x0000A39D009743B3 AS DateTime), CAST(0x0000A39D009743B3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', 1, NULL, NULL, NULL, NULL, NULL, N'teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A39D009743B3 AS DateTime), CAST(0x0000A39D009743B3 AS DateTime), CAST(0x0000A39D009743B3 AS DateTime), CAST(0x0000A39D009743B3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'965fba5d-f763-4b06-b05a-585831954b8a', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser01', N'image/jpeg', 52770, 1, 0, 620, 250, N'Teaser01', NULL, CAST(0x0000A39C00BAEE03 AS DateTime), CAST(0x0000A39C00BAEE03 AS DateTime), CAST(0x0000A39C00BAEDF7 AS DateTime), CAST(0x0000A39C00BAEDF7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'965fba5d-f763-4b06-b05a-585831954b8a', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser01', N'image/jpeg', 52770, 1, 0, 620, 250, N'Teaser01', NULL, CAST(0x0000A39C00BAEDF7 AS DateTime), CAST(0x0000A39C00BAEDF7 AS DateTime), CAST(0x0000A39C00BAEDF7 AS DateTime), CAST(0x0000A39C00BAEDF7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', 0, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'stage-teaser05', N'image/jpeg', 121174, 1, 0, 1240, 468, N'stage-teaser05', NULL, CAST(0x0000A39D009A1CDB AS DateTime), CAST(0x0000A39D009A1CDB AS DateTime), CAST(0x0000A39D009A1CD2 AS DateTime), CAST(0x0000A39D009A1CD2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', 1, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'stage-teaser05', N'image/jpeg', 121174, 1, 0, 1240, 468, N'stage-teaser05', NULL, CAST(0x0000A39D009A1CD2 AS DateTime), CAST(0x0000A39D009A1CD2 AS DateTime), CAST(0x0000A39D009A1CD2 AS DateTime), CAST(0x0000A39D009A1CD2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'de265da8-53e5-4c3e-98e0-7a71c08e55af', 0, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser02_tumblr_mopqdfx05t1st5lhmo1_1280.jpg', NULL, NULL, N'teaser02', N'image/jpeg', 65226, 1, 0, 620, 250, N'teaser02', NULL, CAST(0x0000A39D0099D306 AS DateTime), CAST(0x0000A39D0099D306 AS DateTime), CAST(0x0000A39D0099D2FD AS DateTime), CAST(0x0000A39D0099D2FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'de265da8-53e5-4c3e-98e0-7a71c08e55af', 1, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser02_tumblr_mopqdfx05t1st5lhmo1_1280.jpg', NULL, NULL, N'teaser02', N'image/jpeg', 65226, 1, 0, 620, 250, N'teaser02', NULL, CAST(0x0000A39D0099D2FD AS DateTime), CAST(0x0000A39D0099D2FD AS DateTime), CAST(0x0000A39D0099D2FD AS DateTime), CAST(0x0000A39D0099D2FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', 0, NULL, NULL, NULL, NULL, NULL, N'stage-teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A39D009734B7 AS DateTime), CAST(0x0000A39D009734B7 AS DateTime), CAST(0x0000A39D009734B1 AS DateTime), CAST(0x0000A39D009734B1 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', 1, NULL, NULL, NULL, NULL, NULL, N'stage-teaser', NULL, 0, 0, 1, 0, 0, NULL, NULL, CAST(0x0000A39D009734B1 AS DateTime), CAST(0x0000A39D009734B1 AS DateTime), CAST(0x0000A39D009734B1 AS DateTime), CAST(0x0000A39D009734B1 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'381e4348-804a-4300-967a-9a73c04481e9', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser02_tumblr_mopqdfx05t1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser02', N'image/jpeg', 65226, 1, 0, 620, 250, N'Teaser02', NULL, CAST(0x0000A39C00C100D7 AS DateTime), CAST(0x0000A39C00C100D7 AS DateTime), CAST(0x0000A39C00C100D3 AS DateTime), CAST(0x0000A39C00C100D3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'381e4348-804a-4300-967a-9a73c04481e9', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser02_tumblr_mopqdfx05t1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser02', N'image/jpeg', 65226, 1, 0, 620, 250, N'Teaser02', NULL, CAST(0x0000A39C00C100D3 AS DateTime), CAST(0x0000A39C00C100D3 AS DateTime), CAST(0x0000A39C00C100D3 AS DateTime), CAST(0x0000A39C00C100D3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser05', N'image/jpeg', 37854, 1, 0, 620, 250, N'Teaser05', NULL, CAST(0x0000A39C00BB094D AS DateTime), CAST(0x0000A39C00BB094D AS DateTime), CAST(0x0000A39C00BB0949 AS DateTime), CAST(0x0000A39C00BB0949 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser05_tumblr_mx3trrzUOJ1st5lhmo1_1280.jpg', NULL, NULL, N'Teaser05', N'image/jpeg', 37854, 1, 0, 620, 250, N'Teaser05', NULL, CAST(0x0000A39C00BB0949 AS DateTime), CAST(0x0000A39C00BB0949 AS DateTime), CAST(0x0000A39C00BB0949 AS DateTime), CAST(0x0000A39C00BB0949 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser03_tumblr_mpp6jgOer51st5lhmo1_1280.jpg', NULL, NULL, N'Teaser03', N'image/jpeg', 45124, 1, 0, 620, 250, N'Teaser03', NULL, CAST(0x0000A39C00C173CA AS DateTime), CAST(0x0000A39C00C173CA AS DateTime), CAST(0x0000A39C00C173C2 AS DateTime), CAST(0x0000A39C00C173C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser03_tumblr_mpp6jgOer51st5lhmo1_1280.jpg', NULL, NULL, N'Teaser03', N'image/jpeg', 45124, 1, 0, 620, 250, N'Teaser03', NULL, CAST(0x0000A39C00C173C2 AS DateTime), CAST(0x0000A39C00C173C2 AS DateTime), CAST(0x0000A39C00C173C2 AS DateTime), CAST(0x0000A39C00C173C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'17945f85-0b22-48c3-885a-c91279fe3360', 0, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage04_tumblr_mwhd396nl71st5lhmo1_1280.jpg', NULL, NULL, N'stage-teaser04', N'image/jpeg', 113895, 1, 0, 1240, 468, N'stage-teaser04', NULL, CAST(0x0000A39D009A3C59 AS DateTime), CAST(0x0000A39D009A3C59 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'17945f85-0b22-48c3-885a-c91279fe3360', 1, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage04_tumblr_mwhd396nl71st5lhmo1_1280.jpg', NULL, NULL, N'stage-teaser04', N'image/jpeg', 113895, 1, 0, 1240, 468, N'stage-teaser04', NULL, CAST(0x0000A39D009A3C57 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'd9e0baea-32eb-4bd2-9982-db85641cc24f', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'51097f76-957d-4aaf-943a-4658def4b7c0', N'140429_Hidrostal_International_MainTeaser.jpg', NULL, NULL, N'Hidrostal_International_MainTeaser_Large', N'image/jpeg', 55297, 1, 0, 940, 286, N'Alt Text', NULL, CAST(0x0000A38B008F683A AS DateTime), CAST(0x0000A38B008F683A AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'd9e0baea-32eb-4bd2-9982-db85641cc24f', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'51097f76-957d-4aaf-943a-4658def4b7c0', N'140429_Hidrostal_International_MainTeaser.jpg', NULL, NULL, N'Hidrostal_International_MainTeaser_Large', N'image/jpeg', 55297, 1, 0, 940, 286, N'Alt Text', NULL, CAST(0x0000A38B008EDE38 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), CAST(0x0000A38B008F6831 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'bd310e21-5feb-4201-8e23-e3b4911037f1', 0, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser07_tumblr_n7ygur3NV91st5lhmo1_1280.jpg', NULL, NULL, N'Teaser07', N'image/jpeg', 21858, 1, 0, 620, 250, N'Teaser07', NULL, CAST(0x0000A39C00C20D3A AS DateTime), CAST(0x0000A39C00C20D3A AS DateTime), CAST(0x0000A39C00C20D38 AS DateTime), CAST(0x0000A39C00C20D38 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'bd310e21-5feb-4201-8e23-e3b4911037f1', 1, N'28b7b418-1bae-4290-bb03-b7dc3cd47514', NULL, N'teaser07_tumblr_n7ygur3NV91st5lhmo1_1280.jpg', NULL, NULL, N'Teaser07', N'image/jpeg', 21858, 1, 0, 620, 250, N'Teaser07', NULL, CAST(0x0000A39C00C20D38 AS DateTime), CAST(0x0000A39C00C20D38 AS DateTime), CAST(0x0000A39C00C20D38 AS DateTime), CAST(0x0000A39C00C20D38 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', 0, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'teaser01', N'image/jpeg', 52770, 1, 0, 620, 250, N'teaser01', NULL, CAST(0x0000A39D0099BB2E AS DateTime), CAST(0x0000A39D0099BB2E AS DateTime), CAST(0x0000A39D0099BB20 AS DateTime), CAST(0x0000A39D0099BB20 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', 1, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'teaser01', N'image/jpeg', 52770, 1, 0, 620, 250, N'teaser01', NULL, CAST(0x0000A39D0099BB20 AS DateTime), CAST(0x0000A39D0099BB20 AS DateTime), CAST(0x0000A39D0099BB20 AS DateTime), CAST(0x0000A39D0099BB20 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', 0, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser03_tumblr_mpp6jgOer51st5lhmo1_1280.jpg', NULL, NULL, N'teaser03', N'image/jpeg', 45124, 1, 0, 620, 250, N'teaser03', NULL, CAST(0x0000A39D0099EB29 AS DateTime), CAST(0x0000A39D0099EB29 AS DateTime), CAST(0x0000A39D0099EB25 AS DateTime), CAST(0x0000A39D0099EB25 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', 1, N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', NULL, N'teaser03_tumblr_mpp6jgOer51st5lhmo1_1280.jpg', NULL, NULL, N'teaser03', N'image/jpeg', 45124, 1, 0, 620, 250, N'teaser03', NULL, CAST(0x0000A39D0099EB25 AS DateTime), CAST(0x0000A39D0099EB25 AS DateTime), CAST(0x0000A39D0099EB25 AS DateTime), CAST(0x0000A39D0099EB25 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', 0, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'stage01', N'image/jpeg', 131884, 1, 0, 1240, 468, N'stage01', NULL, CAST(0x0000A39D009876BF AS DateTime), CAST(0x0000A39D009876BF AS DateTime), CAST(0x0000A39D009876B6 AS DateTime), CAST(0x0000A39D009876B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[content] ([content_id], [content_draft], [content_parent_id], [content_permalink_id], [content_filename], [content_url], [content_synced], [content_name], [content_type], [content_size], [content_image], [content_folder], [content_width], [content_height], [content_alt], [content_description], [content_created], [content_updated], [content_published], [content_last_published], [content_created_by], [content_updated_by]) VALUES (N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', 1, N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', NULL, N'stage01_tumblr_mo2xijE2nr1st5lhmo1_1280.jpg', NULL, NULL, N'stage01', N'image/jpeg', 131884, 1, 0, 1240, 468, N'stage01', NULL, CAST(0x0000A39D009876B6 AS DateTime), CAST(0x0000A39D009876B6 AS DateTime), CAST(0x0000A39D009876B6 AS DateTime), CAST(0x0000A39D009876B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'c8342fb4-d38e-4eaf-bbc1-4ef3bdd7500c', N'ARCHIVE', N'Archive namespace', N'This is the archive namespace for all post types.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'Media namespace', N'This is the media namespace for all images & documents.', CAST(0x0000A37900CAEEE5 AS DateTime), CAST(0x0000A37900CAEEE5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'DEFAULT', N'Default namespace', N'This is the default namespace for all pages and posts.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[namespace] ([namespace_id], [namespace_internal_id], [namespace_name], [namespace_description], [namespace_created], [namespace_updated], [namespace_created_by], [namespace_updated_by]) VALUES (N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'Category namespace', N'This is the namespace for all categories.', CAST(0x0000A37900CAEEE4 AS DateTime), CAST(0x0000A37900CAEEE4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'258b2bda-f282-429e-8e93-a1c919fbabba', NULL, N'[]', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'd1cfbc26-3979-4c3f-bfd0-b419ab571fa6', 1, N'Level2', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'258b2bda-f282-429e-8e93-a1c919fbabba', NULL, N'[]', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'd1cfbc26-3979-4c3f-bfd0-b419ab571fa6', 1, N'Level2', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), CAST(0x0000A39C00FB252B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'70f2b68d-cf8e-4d80-8843-8807ff28103a', 2, N'2. Ebene', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'70f2b68d-cf8e-4d80-8843-8807ff28103a', 2, N'2. Ebene', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), CAST(0x0000A3880125E961 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, N'[]', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'2e168001-d113-4216-acc5-03c61c2d0c21', 1, N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, N'[]', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'2e168001-d113-4216-acc5-03c61c2d0c21', 1, N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), CAST(0x0000A37900CBCF19 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'06ca675f-3118-489d-ac25-c4bd09a0bfde', NULL, N'[]', NULL, N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', 1, N'Willkommen. Das ist die JBS!', N'Startseite', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), CAST(0x0000A3880144F510 AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'06ca675f-3118-489d-ac25-c4bd09a0bfde', NULL, N'[]', NULL, N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', 1, N'Willkommen. Das ist die JBS!', N'Startseite', 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), CAST(0x0000A3880144F510 AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), CAST(0x0000A39D009A5F7F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'747b1318-4f07-48e9-94f2-58cb61640eae', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'3a2fd452-5f49-4d60-b773-60170b6e9a14', 1, N'Level 1 Page', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), CAST(0x0000A39200BC82FC AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'747b1318-4f07-48e9-94f2-58cb61640eae', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'3a2fd452-5f49-4d60-b773-60170b6e9a14', 1, N'Level 1 Page', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), CAST(0x0000A39200BC82FC AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), CAST(0x0000A39D009AA19B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', 3, N'Ganz vorne dabei', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A38801261225 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'906761ea-6c04-4f4b-9365-f2c350ff4372', NULL, N'[]', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', 3, N'Ganz vorne dabei', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A38801261225 AS DateTime), CAST(0x0000A38801261225 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 0, N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', NULL, N'[]', NULL, N'398e5409-bfe3-4db6-ae0d-8db92322b31f', 2, N'Q & A', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), CAST(0x0000A38D00EB053C AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[page] ([page_id], [page_sitetree_id], [page_original_id], [page_draft], [page_template_id], [page_group_id], [page_group_disable_id], [page_parent_id], [page_permalink_id], [page_seqno], [page_title], [page_navigation_title], [page_is_hidden], [page_keywords], [page_description], [page_attachments], [page_controller], [page_view], [page_redirect], [page_created], [page_updated], [page_published], [page_last_published], [page_last_modified], [page_created_by], [page_updated_by]) VALUES (N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', NULL, 1, N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', NULL, N'[]', NULL, N'398e5409-bfe3-4db6-ae0d-8db92322b31f', 2, N'Q & A', NULL, 0, NULL, NULL, N'[]', NULL, NULL, NULL, CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), CAST(0x0000A38D00EB053C AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), CAST(0x0000A3A9010B79C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'C2F87B2B-F585-4696-8A2B-3C9DF882701E', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 1, NULL, CAST(0x0000A37900CAEEE7 AS DateTime), CAST(0x0000A37900CAEEE7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'FaqPage', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'FaqPage', 0, NULL, 0, 0, NULL, CAST(0x0000A38B0108A470 AS DateTime), CAST(0x0000A38D00EAD062 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Level1', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level1', 0, NULL, 0, 0, NULL, CAST(0x0000A38E0112B564 AS DateTime), CAST(0x0000A39200B8B24C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Level2', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level2', 0, NULL, 0, 0, NULL, CAST(0x0000A38E0112CA7C AS DateTime), CAST(0x0000A3A000DCA6A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Stage', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, NULL, 0, NULL, 0, 0, NULL, CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFB2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'TextListRegion-TEST', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'TextListPage', 0, NULL, 0, 0, NULL, CAST(0x0000A3A90109CA94 AS DateTime), CAST(0x0000A3A90112692D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Level0', NULL, N'<table class="template"><tr><td></td></tr></table>', N'[]', N'[]', NULL, 0, N'Level0', 0, NULL, 0, 0, NULL, CAST(0x0000A38801042CB0 AS DateTime), CAST(0x0000A38E012EE1BE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[pagetemplate] ([pagetemplate_id], [pagetemplate_name], [pagetemplate_description], [pagetemplate_preview], [pagetemplate_page_regions], [pagetemplate_properties], [pagetemplate_controller], [pagetemplate_controller_show], [pagetemplate_view], [pagetemplate_view_show], [pagetemplate_redirect], [pagetemplate_redirect_show], [pagetemplate_site_template], [pagetemplate_type], [pagetemplate_created], [pagetemplate_updated], [pagetemplate_created_by], [pagetemplate_updated_by]) VALUES (N'906761ea-6c04-4f4b-9365-f2c350ff4372', N'Standard page', N'Standard page type.', N'<table class="template"><tr><td id="Content"></td></tr></table>', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, CAST(0x0000A37900CAEEC7 AS DateTime), CAST(0x0000A37900CAEEC7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'2e168001-d113-4216-acc5-03c61c2d0c21', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'SITE', N'c2f87b2b-f585-4696-8a2b-3c9df882701e', CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900CBCF1D AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'6f6df54c-72f6-4953-9476-17d042b6b03c', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'largeteaser', CAST(0x0000A38B008E5F89 AS DateTime), CAST(0x0000A38B008E5F89 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'51097f76-957d-4aaf-943a-4658def4b7c0', N'368249b1-7f9c-4974-b9e3-a55d068dd9b6', N'MEDIA', N'140429hidrostalinternationalmainteaser.jpg', CAST(0x0000A38B008EDE38 AS DateTime), CAST(0x0000A38B008F682C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'5970d781-bf0b-4fb6-bea6-590b1d1f50ae', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'title', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A39D009A5F88 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'3a2fd452-5f49-4d60-b773-60170b6e9a14', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'leve-1-page', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'3c3e5513-a8ff-4844-aa1e-6f89675470d9', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'smallpic', CAST(0x0000A38B008E4388 AS DateTime), CAST(0x0000A38B008E4ECE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'70f2b68d-cf8e-4d80-8843-8807ff28103a', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'2-ebene', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'398e5409-bfe3-4db6-ae0d-8db92322b31f', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'aa', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A3A9010B79E7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'4065756c-2225-47e0-b077-a46d09e56916', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'POST', N'neuste-nachrichten', CAST(0x0000A37900F5F1D3 AS DateTime), CAST(0x0000A37900F5F1D4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'c336e12e-05b5-46f3-a80f-ac3cd182e42e', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'ganz-vorne-dabei', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'd1cfbc26-3979-4c3f-bfd0-b419ab571fa6', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'PAGE', N'title/level2', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2533 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[permalink] ([permalink_id], [permalink_namespace_id], [permalink_type], [permalink_name], [permalink_created], [permalink_updated], [permalink_created_by], [permalink_updated_by]) VALUES (N'02a1ac67-4339-4d2d-a53a-e8fdd80e0213', N'ae46c4c4-20f7-4582-888d-dfc148fe9067', N'CATEGORY', N'midteaser', CAST(0x0000A38B008E5652 AS DateTime), CAST(0x0000A38B008E5652 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[post] ([post_id], [post_draft], [post_template_id], [post_permalink_id], [post_title], [post_keywords], [post_description], [post_rss], [post_excerpt], [post_body], [post_attachments], [post_controller], [post_view], [post_archive_controller], [post_created], [post_updated], [post_published], [post_last_published], [post_last_modified], [post_created_by], [post_updated_by]) VALUES (N'6de553fa-b855-439a-b350-1eb460d50a51', 0, N'5017dbe4-5685-4941-921b-ca922edc7a12', N'4065756c-2225-47e0-b077-a46d09e56916', N'Neuste Nachrichten', NULL, NULL, 1, N'Wir freuen uns, euch heute von der ersten geglückten Verschmelzung von zwei gegensätzlichen Dingen berichten zu können.', N'<p>Wir freuen uns, euch heute von der ersten gegl&uuml;ckten Verschmelzung von zwei gegens&auml;tzlichen Dingen berichten zu k&ouml;nnen.</p>
<p>There''s an issue when using another authentication together with the SinglePageController &amp; SinglePostController. The issue is that the they try to check for permissions/access rights and assumes that the logged in user is from the Piranha CMS db. When the id of the current user is not in a Guid format the security check breaks.</p>
<p>Another issue is when being logged in with you forms authentication and then navigating to the manager interface. The same assumption will be made and the security check will crash.</p>
<p>There&acute;s a currently open issue on this here (<a class="issue-link" title="Integrate Piranha CMS with the common membership system?" href="https://github.com/PiranhaCMS/Piranha/issues/168">#168</a>) and some tricks on how to get around it here (<a class="issue-link" title="Security guid parsing error" href="https://github.com/PiranhaCMS/Piranha/issues/177">#177</a>).</p>
<p>Note that the existing authentication mechanism in Piranha CMS will be removed and instead the framework will integrate with the existing authentication of the web application.</p>', N'[]', NULL, NULL, NULL, CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[post] ([post_id], [post_draft], [post_template_id], [post_permalink_id], [post_title], [post_keywords], [post_description], [post_rss], [post_excerpt], [post_body], [post_attachments], [post_controller], [post_view], [post_archive_controller], [post_created], [post_updated], [post_published], [post_last_published], [post_last_modified], [post_created_by], [post_updated_by]) VALUES (N'6de553fa-b855-439a-b350-1eb460d50a51', 1, N'5017dbe4-5685-4941-921b-ca922edc7a12', N'4065756c-2225-47e0-b077-a46d09e56916', N'Neuste Nachrichten', NULL, NULL, 1, N'Wir freuen uns, euch heute von der ersten geglückten Verschmelzung von zwei gegensätzlichen Dingen berichten zu können.', N'<p>Wir freuen uns, euch heute von der ersten gegl&uuml;ckten Verschmelzung von zwei gegens&auml;tzlichen Dingen berichten zu k&ouml;nnen.</p>
<p>There''s an issue when using another authentication together with the SinglePageController &amp; SinglePostController. The issue is that the they try to check for permissions/access rights and assumes that the logged in user is from the Piranha CMS db. When the id of the current user is not in a Guid format the security check breaks.</p>
<p>Another issue is when being logged in with you forms authentication and then navigating to the manager interface. The same assumption will be made and the security check will crash.</p>
<p>There&acute;s a currently open issue on this here (<a class="issue-link" title="Integrate Piranha CMS with the common membership system?" href="https://github.com/PiranhaCMS/Piranha/issues/168">#168</a>) and some tricks on how to get around it here (<a class="issue-link" title="Security guid parsing error" href="https://github.com/PiranhaCMS/Piranha/issues/177">#177</a>).</p>
<p>Note that the existing authentication mechanism in Piranha CMS will be removed and instead the framework will integrate with the existing authentication of the web application.</p>', N'[]', NULL, NULL, NULL, CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), CAST(0x0000A37900F5F1D9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[posttemplate] ([posttemplate_id], [posttemplate_permalink_id], [posttemplate_name], [posttemplate_description], [posttemplate_preview], [posttemplate_properties], [posttemplate_controller], [posttemplate_controller_show], [posttemplate_view], [posttemplate_view_show], [posttemplate_archive_controller], [posttemplate_archive_controller_show], [posttemplate_rss], [posttemplate_type], [posttemplate_created], [posttemplate_updated], [posttemplate_created_by], [posttemplate_updated_by]) VALUES (N'5017dbe4-5685-4941-921b-ca922edc7a12', NULL, N'Standard post', N'Standard post type.', N'<table class="template"><tr><td></td></tr></table>', NULL, NULL, 0, NULL, 0, NULL, 0, 1, NULL, CAST(0x0000A37900CAEEE1 AS DateTime), CAST(0x0000A37900CAEEE1 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'06755b97-5632-4c32-8a8e-1c93d8322fc6', 0, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 0, N'012cf49e-a890-4b2f-8074-3dbdfddab669', NULL, N'{"Title":" Lorem ipsum dolor sit amet","Body":"Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2532 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'06755b97-5632-4c32-8a8e-1c93d8322fc6', 1, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 1, N'012cf49e-a890-4b2f-8074-3dbdfddab669', NULL, N'{"Title":" Lorem ipsum dolor sit amet","Body":"Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2532 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'2b2b7f6c-9af6-4dac-8671-20ce8c3ea3d5', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', NULL, N'{"Header":"At vero eos et accusam","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"00f36eb8-cd24-465c-8c35-ba7e504b5ddc","Name":"Teaser03","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'2b2b7f6c-9af6-4dac-8671-20ce8c3ea3d5', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', NULL, N'{"Header":"At vero eos et accusam","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"00f36eb8-cd24-465c-8c35-ba7e504b5ddc","Name":"Teaser03","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'277bc751-2443-40ac-833f-44a34cd34570', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'99040abf-46f6-4eee-abe9-fa6c3b93d403', NULL, N'{"Header":"At vero eos et accusam","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Duis autem vel eum iriure dolor in hendrerit","In vulputate velit esse molestie consequat","Vel illum dolore eu feugiat nulla","",""],"Image":{"Id":"bd310e21-5feb-4201-8e23-e3b4911037f1","Name":"Teaser07","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'277bc751-2443-40ac-833f-44a34cd34570', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'99040abf-46f6-4eee-abe9-fa6c3b93d403', NULL, N'{"Header":"At vero eos et accusam","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Duis autem vel eum iriure dolor in hendrerit","In vulputate velit esse molestie consequat","Vel illum dolore eu feugiat nulla","",""],"Image":{"Id":"bd310e21-5feb-4201-8e23-e3b4911037f1","Name":"Teaser07","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'944f2d68-0885-4be0-95c6-585f5a3af5c7', 0, N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', 0, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Dies ist die 2.Ebene</p>', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'944f2d68-0885-4be0-95c6-585f5a3af5c7', 1, N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', 1, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Dies ist die 2.Ebene</p>', CAST(0x0000A37A00B2C668 AS DateTime), CAST(0x0000A3880125E963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c2797910-1886-4ad0-8c32-5aa0048699bd', 0, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 0, N'e27692fb-2df0-4a70-835d-a862d85f0c0b', NULL, N'{"Header":" Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"bd310e21-5feb-4201-8e23-e3b4911037f1","Name":"Teaser07","Description":"Teaser07"}}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2531 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c2797910-1886-4ad0-8c32-5aa0048699bd', 1, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 1, N'e27692fb-2df0-4a70-835d-a862d85f0c0b', NULL, N'{"Header":" Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"bd310e21-5feb-4201-8e23-e3b4911037f1","Name":"Teaser07","Description":"Teaser07"}}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2530 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'44f0f0ae-b019-4075-ba55-5b797bbaff57', 0, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 0, N'388cdedf-3326-401b-8631-d72e46d3c939', NULL, N'{"Tabs":[{"Title":"Lorem ipsum","Body":"\u003cp\u003eLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\u003c/p\u003e"},{"Title":"Dolor sit amet","Body":"\u003cp\u003eAt vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\u003c/p\u003e"}]}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2533 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'44f0f0ae-b019-4075-ba55-5b797bbaff57', 1, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 1, N'388cdedf-3326-401b-8631-d72e46d3c939', NULL, N'{"Tabs":[{"Title":"Lorem ipsum","Body":"\u003cp\u003eLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\u003c/p\u003e"},{"Title":"Dolor sit amet","Body":"\u003cp\u003eAt vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\u003c/p\u003e"}]}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2533 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b58a2303-7055-41f1-b205-6867fad03da0', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'5b4be865-d4ed-458b-aba7-f699f27eaace', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"17945f85-0b22-48c3-885a-c91279fe3360","Name":"stage-teaser04","Description":null}}', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A39D009A5F85 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b58a2303-7055-41f1-b205-6867fad03da0', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'5b4be865-d4ed-458b-aba7-f699f27eaace', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"17945f85-0b22-48c3-885a-c91279fe3360","Name":"stage-teaser04","Description":null}}', CAST(0x0000A38801231788 AS DateTime), CAST(0x0000A39D009A5F85 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'5a3435bb-c16d-4c76-81b7-79156197ca1e', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'2466d937-3fe7-440a-9d72-cc91e8e895a6', NULL, N'{"Header":"At vero eos et accusam et justo duo dolores et ea rebum","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"7037410c-2cfc-41a4-a1ae-636ec4dd22b2","Name":"stage-teaser05","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'5a3435bb-c16d-4c76-81b7-79156197ca1e', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'2466d937-3fe7-440a-9d72-cc91e8e895a6', NULL, N'{"Header":"At vero eos et accusam et justo duo dolores et ea rebum","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"7037410c-2cfc-41a4-a1ae-636ec4dd22b2","Name":"stage-teaser05","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'6bdaf70b-7662-4d08-a767-8246f954ed6b', 0, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 0, N'd87d2f5e-cae4-475b-89f7-e502a3071189', NULL, N'{"Title":"Ut wisi enim ad minim veniam","Body":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2531 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'6bdaf70b-7662-4d08-a767-8246f954ed6b', 1, N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', 1, N'd87d2f5e-cae4-475b-89f7-e502a3071189', NULL, N'{"Title":"Ut wisi enim ad minim veniam","Body":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."}', CAST(0x0000A39C00D0C488 AS DateTime), CAST(0x0000A39C00FB2531 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b936f6c0-b276-4ff1-acbd-9f5c66a29363', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":["","","","",""],"Image":{"Id":"00000000-0000-0000-0000-000000000000","Name":null,"Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'b936f6c0-b276-4ff1-acbd-9f5c66a29363', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', NULL, N'{"Header":null,"FooterText":null,"FooterLink":null,"BulletPoints":["","","","",""],"Image":{"Id":"00000000-0000-0000-0000-000000000000","Name":null,"Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c1dc024b-3ce1-4e60-ba50-aab5bd126615', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"de265da8-53e5-4c3e-98e0-7a71c08e55af","Name":"teaser02","Description":null}}', CAST(0x0000A38E012D22A0 AS DateTime), CAST(0x0000A39D009A5F87 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'c1dc024b-3ce1-4e60-ba50-aab5bd126615', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"de265da8-53e5-4c3e-98e0-7a71c08e55af","Name":"teaser02","Description":null}}', CAST(0x0000A38E012D22A0 AS DateTime), CAST(0x0000A39D009A5F86 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'e5f170a4-a490-40ad-9d60-b40ec56c30e4', 0, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 0, N'397356c7-75ec-4dde-9338-b6e8405e12dc', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"381e4348-804a-4300-967a-9a73c04481e9","Name":"Teaser02","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'e5f170a4-a490-40ad-9d60-b40ec56c30e4', 1, N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', 1, N'397356c7-75ec-4dde-9338-b6e8405e12dc', NULL, N'{"Header":"Lorem ipsum dolor sit amet","FooterText":"Lorem","FooterLink":"#","BulletPoints":["Lorem ipsum dolor sit amet","Consetetur sadipscing elitr","Sed diam nonumy eirmod tempor invidunt","",""],"Image":{"Id":"381e4348-804a-4300-967a-9a73c04481e9","Name":"Teaser02","Description":null}}', CAST(0x0000A39200B88D50 AS DateTime), CAST(0x0000A39D009AA1A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'eadf6c9c-157c-4b32-9783-c538d5230cd4', 0, N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', 0, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Wir sind die Innovatoren hier und immer schon da, wenn es was Neues gibt.</p>', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'eadf6c9c-157c-4b32-9783-c538d5230cd4', 1, N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', 1, N'96adac79-5dc5-453d-a0de-a6871d74fd99', NULL, N'<p>Wir sind die Innovatoren hier und immer schon da, wenn es was Neues gibt.</p>', CAST(0x0000A37900F8C208 AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'11a1ece6-6b0c-4cc1-8f8f-ef8d1aa2e2c1', 0, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 0, N'084e254d-9eff-428d-b65d-150620828d05', NULL, N'{"Header":" At vero eos et accusam et justo duo dolores","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0","Name":"teaser03","Description":null}}', CAST(0x0000A38E012EFE68 AS DateTime), CAST(0x0000A39D009A5F88 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'11a1ece6-6b0c-4cc1-8f8f-ef8d1aa2e2c1', 1, N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', 1, N'084e254d-9eff-428d-b65d-150620828d05', NULL, N'{"Header":" At vero eos et accusam et justo duo dolores","FooterText":"Lorem","FooterLink":"#","BulletPoints":["At vero eos et accusam et justo duo dolores et ea rebum.","Stet clita kasd gubergren.","No sea takimata sanctus est Lorem ipsum dolor sit amet.","",""],"Image":{"Id":"76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0","Name":"teaser03","Description":null}}', CAST(0x0000A38E012EFE68 AS DateTime), CAST(0x0000A39D009A5F87 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'd536ede5-6bdc-4f91-b5f2-f806296d37cf', 0, N'ed965a13-a99d-467f-b9b8-faad61779ad9', 0, N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', NULL, N'{"Faqs":[{"Title":"Woher kommt diese Frage und die Antwort?","Body":"Piranha"},{"Title":"5","Body":"Fünfhundert"},{"Title":"6","Body":"6"},{"Title":"wefwef","Body":"wefwef"},{"Title":"Was ist ein Informationsobjekt?","Body":"Veit fragen oder SAP."},{"Title":"Was ist Piranha.","Body":"ein CMS."}]}', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A3A9010B79E5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[region] ([region_id], [region_draft], [region_page_id], [region_page_draft], [region_regiontemplate_id], [region_name], [region_body], [region_created], [region_updated], [region_created_by], [region_updated_by]) VALUES (N'd536ede5-6bdc-4f91-b5f2-f806296d37cf', 1, N'ed965a13-a99d-467f-b9b8-faad61779ad9', 1, N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', NULL, N'{"Faqs":[{"Title":"Woher kommt diese Frage und die Antwort?","Body":"Piranha"},{"Title":"5","Body":"Fünfhundert"},{"Title":"6","Body":"6"},{"Title":"wefwef","Body":"wefwef"},{"Title":"Was ist ein Informationsobjekt?","Body":"Veit fragen oder SAP."},{"Title":"Was ist Piranha.","Body":"ein CMS."}]}', CAST(0x0000A38C01170C54 AS DateTime), CAST(0x0000A3A9010B79E1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'7e1ee6f3-99f6-416a-a680-042482043a61', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Teaser2', 4, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A3880107BFEE AS DateTime), CAST(0x0000A3880107BFEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'93c752e5-c647-45eb-841a-09edc5dfafdb', N'037c1a14-7021-4d6b-b438-959065aee3c1', N't3', 1, N't3', NULL, N'TeaserExtension', CAST(0x0000A38600A6313D AS DateTime), CAST(0x0000A38600A6313D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'084e254d-9eff-428d-b65d-150620828d05', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Teaser2', 3, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A38E012EE1D0 AS DateTime), CAST(0x0000A38E012EE1D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'f8f2df80-b483-4f4f-b4dd-1f63b659968b', N'5a156e99-f961-4b23-92f0-592c89299466', N'Html', 1, N'HTML', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38500C79110 AS DateTime), CAST(0x0000A38600A694DE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'012cf49e-a890-4b2f-8074-3dbdfddab669', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Toggle', 3, N'Toggle', NULL, N'Piranha.Extend.Regions.TextRegion', CAST(0x0000A39C00CB532C AS DateTime), CAST(0x0000A3A000DCA6AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'b6ff3b75-dfa5-4dd5-b884-45ea2e4ed833', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'Teaser1', 2, N'Teaser1', NULL, N'TeaserExtension', CAST(0x0000A38E012CB5A4 AS DateTime), CAST(0x0000A38E012EE1CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'38238874-9494-4eb0-8764-48714337d67e', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Togglebox', 3, N'Togglebox', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFE7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd5e19a48-64e4-4120-890f-5248dd5a192a', N'5a156e99-f961-4b23-92f0-592c89299466', N'Image', 3, N'Image', NULL, N'Piranha.Extend.Regions.AttachmentRegion', CAST(0x0000A38500CA1CA0 AS DateTime), CAST(0x0000A38600A694EB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd2b47bd8-1d0f-4025-84da-56ba97d98716', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'Content', 2, N'Content', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38800C0A544 AS DateTime), CAST(0x0000A38800C0A544 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'19d63331-b086-4bcd-90d9-99590fd98a7d', N'5a156e99-f961-4b23-92f0-592c89299466', N'Teaser', 4, N'Teaser', NULL, N'TeaserExtension', CAST(0x0000A38600A694F3 AS DateTime), CAST(0x0000A38600A694F3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'4c7a447d-c18c-4abc-b228-a4e1a8a1d91d', N'39c49ab9-091c-49d6-b330-80d5046ebb58', N'Carousel', 1, N'Carousel', NULL, N'CarouselRegion', CAST(0x0000A39B00D0DFEC AS DateTime), CAST(0x0000A39B00D0DFEC AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'96adac79-5dc5-453d-a0de-a6871d74fd99', N'906761ea-6c04-4f4b-9365-f2c350ff4372', N'Content', 1, N'Content', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A37900CAEEE3 AS DateTime), CAST(0x0000A37900CAEEE3 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'bb88bd22-5cd8-442d-b5cd-a85a735bff0c', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'SimpleText', 2, N'SimpleText', NULL, N'Piranha.Extend.Regions.TextRegion', CAST(0x0000A3A90112692E AS DateTime), CAST(0x0000A3A90112692E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'e27692fb-2df0-4a70-835d-a862d85f0c0b', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Teaser', 1, N'Teaser', NULL, N'TeaserExtension', CAST(0x0000A39C00C90108 AS DateTime), CAST(0x0000A3A000DCA6AA AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'156e42b3-f44a-4147-baae-b2c8fab44635', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Stage-Teaser', 1, N'Stage-Teaser', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFD8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'397356c7-75ec-4dde-9338-b6e8405e12dc', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser1', 2, N'Teaser1', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'1126a009-ad65-4998-909f-b98466d029a2', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'TestRegion2', 1, N'TestRegion2', NULL, N'FaqRegion', CAST(0x0000A386009FE9C4 AS DateTime), CAST(0x0000A386009FE9C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'9ceed5d5-6ce0-4f5d-9603-baa4f32fab4c', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'Faq', 1, N'Faq', NULL, N'FaqRegion', CAST(0x0000A38C0080D2E8 AS DateTime), CAST(0x0000A38D00EAD06D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'385ff931-ea81-4c8d-85d7-be982df3ae29', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'test', 1, N'Test', NULL, N'FaqRegion', CAST(0x0000A38501307685 AS DateTime), CAST(0x0000A38501307685 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'2466d937-3fe7-440a-9d72-cc91e8e895a6', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'StageTeaser', 1, N'StageTeaser', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B256 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd66bbf84-b513-4403-88cf-ccb59f92cfb4', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser4', 5, N'Teaser4', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'0a17e9f0-c9ab-417a-b4f9-d0c460c593da', N'5a156e99-f961-4b23-92f0-592c89299466', N'Text', 2, N'Text', NULL, N'Piranha.Extend.Regions.TextRegion', CAST(0x0000A38500C79110 AS DateTime), CAST(0x0000A38600A694E5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'9908fa95-1a73-4d09-8fea-d3bd992bd495', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'r3', 1, N'TestRegion3', NULL, N'FaqRegion', CAST(0x0000A38600A2F88C AS DateTime), CAST(0x0000A38600A2F88C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'388cdedf-3326-401b-8631-d72e46d3c939', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Tabs', 4, N'Tabs', NULL, N'TabsRegion', CAST(0x0000A39C00C90108 AS DateTime), CAST(0x0000A3A000DCA6AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'e3eea34b-1590-4210-8c98-d731d5809c8d', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'Teaser', 2, N'Teaser', NULL, N'Piranha.Extend.Regions.HtmlRegion', CAST(0x0000A38600BA51A8 AS DateTime), CAST(0x0000A3880107BFDF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'07e6c9e0-a861-4eef-8b5d-e3c8f963c131', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'faq', 1, N'faq', NULL, N'FaqRegion', CAST(0x0000A38600C87918 AS DateTime), CAST(0x0000A38800C0A543 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'd87d2f5e-cae4-475b-89f7-e502a3071189', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'Text', 2, N'Text', NULL, N'Piranha.Extend.Regions.TextRegion', CAST(0x0000A39C00C90108 AS DateTime), CAST(0x0000A3A000DCA6AA AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'2db70bae-b8a2-44d4-96a9-e9581000fb69', N'a67dbaed-0474-4245-9775-857032fb8faf', N'Tabs', 1, N'Reiter', NULL, N'TabsRegion', CAST(0x0000A39500F60042 AS DateTime), CAST(0x0000A39500F60042 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'46d2f8d1-2f2c-4e2f-a878-ee9dd9784caf', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser2', 3, N'Teaser2', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'0605a429-949a-49d6-b879-f1f95fb1cd81', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'TextListRegion', 1, N'TextListRegion', NULL, N'TextListRegion', CAST(0x0000A3A90109CA94 AS DateTime), CAST(0x0000A3A90112692E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'5b4be865-d4ed-458b-aba7-f699f27eaace', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'StageTeaser', 1, N'StageTeaser', NULL, N'TeaserExtension', CAST(0x0000A38801042CB0 AS DateTime), CAST(0x0000A38E012EE1CA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[regiontemplate] ([regiontemplate_id], [regiontemplate_template_id], [regiontemplate_internal_id], [regiontemplate_seqno], [regiontemplate_name], [regiontemplate_description], [regiontemplate_type], [regiontemplate_created], [regiontemplate_updated], [regiontemplate_created_by], [regiontemplate_updated_by]) VALUES (N'99040abf-46f6-4eee-abe9-fa6c3b93d403', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'Teaser3', 4, N'Teaser3', NULL, N'TeaserExtension', CAST(0x0000A39200B87388 AS DateTime), CAST(0x0000A39200B8B257 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[relation] ([relation_id], [relation_draft], [relation_type], [relation_data_id], [relation_related_id]) VALUES (N'ea2270a0-557e-4a62-8035-d0ae66796ce1', 0, N'CONTENTCATEGORY', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1')
GO
INSERT [dbo].[sitetree] ([sitetree_id], [sitetree_namespace_id], [sitetree_internal_id], [sitetree_name], [sitetree_description], [sitetree_meta_title], [sitetree_meta_description], [sitetree_hostnames], [sitetree_created], [sitetree_updated], [sitetree_created_by], [sitetree_updated_by]) VALUES (N'c2f87b2b-f585-4696-8a2b-3c9df882701e', N'8ff4a4b4-9b6c-4176-aaa2-db031d75ac03', N'DEFAULT_SITE', N'Default site', N'This is the default site tree.', N'JM.Foundation', N'Die Basissolution für alle Fälle', NULL, CAST(0x0000A37900CAEEE5 AS DateTime), CAST(0x0000A37900CBCF3E AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'08d17dbf-cd1d-40a9-b558-0866210ac4ec', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_GROUP', N'Access to add, update and delete user groups.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'da291f10-5bb6-44a5-ae20-1c9932c870e9', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_PAGE_PUBLISH', N'Access to publish, depublish and delete pages.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'f65bd7dd-6dfe-45b7-87e3-20a11e1f8d55', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_COMMENT', N'Access to administrate comments.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'222119de-a510-427f-92ff-3d357bdf0c2c', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CONTENT_PUBLISH', N'Access to publish, depublish and delete images & documents.', 1, CAST(0x0000A37900CAEEBA AS DateTime), CAST(0x0000A37900CAEEBA AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'f71ca1b9-1276-4c3e-a090-5fba6c4980ce', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_SITETREE', N'Access to administrate site trees.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'4fbdedb7-10ec-4a10-8f82-7d4c5cf61f2c', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN', N'Access to login to the admin panel.', 1, CAST(0x0000A37900CAEEB5 AS DateTime), CAST(0x0000A37900CAEEB5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'0f367b04-ef7b-4007-88bd-7d78cbdea64a', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_ACCESS', N'Access to add, update and delete access rules.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'c8b44826-d3e6-4add-b241-8ce95429a17e', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_POST', N'Access to add and update posts.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'8a4ca0f3-261b-4689-8c1f-98065b65f9ee', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_USER', N'Access to add, update and delete users.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'1bb90c7d-f3dd-43fe-aff5-985368d316e6', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_POST_PUBLISH', N'Access to publish, depublish and delete posts.', 1, CAST(0x0000A37900CAEEB9 AS DateTime), CAST(0x0000A37900CAEEB9 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'e08ae820-d438-4a38-b6e1-ac3aca3cf933', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CONTENT', N'Access to add and update images & documents.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'36fbc1ad-4e17-4767-9fdc-af92802e5ebb', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_PAGE', N'Access to add and update pages.', 1, CAST(0x0000A37900CAEEB7 AS DateTime), CAST(0x0000A37900CAEEB7 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'00074fd5-6c81-4181-8a09-ba6ef94f8364', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_PAGE_TEMPLATE', N'Access to add, update and delete page types.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'0c19578a-d6c0-45f8-9ffd-bcffa5d84772', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_PARAM', N'Access to add, update and delete system parameters.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'ff296d65-d24d-446a-8f02-d93a7ab57086', N'7c536b66-d292-4369-8f37-948b32229b83', N'ADMIN_POST_TEMPLATE', N'Access to add, update and delete post types.', 1, CAST(0x0000A37900CAEEB6 AS DateTime), CAST(0x0000A37900CAEEB6 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysaccess] ([sysaccess_id], [sysaccess_group_id], [sysaccess_function], [sysaccess_description], [sysaccess_locked], [sysaccess_created], [sysaccess_updated], [sysaccess_created_by], [sysaccess_updated_by]) VALUES (N'79ed0e9e-188c-4c5b-81ba-db15bb9f8ad5', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'ADMIN_CATEGORY', N'Access to add, update and delete categories.', 1, CAST(0x0000A37900CAEEB8 AS DateTime), CAST(0x0000A37900CAEEB8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'798bc71a-98e2-4e2a-8ddb-21537f6004b7', N'8940b41a-e3a9-44f3-b564-bfd281416141', N'Entwickler', NULL, CAST(0x0000A37A00B4532E AS DateTime), CAST(0x0000A37A00B4532E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'7c536b66-d292-4369-8f37-948b32229b83', NULL, N'Systemadministrator', N'System administrator group with full permissions.', CAST(0x0000A37900CAEEB4 AS DateTime), CAST(0x0000A37900CAEEB4 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysgroup] ([sysgroup_id], [sysgroup_parent_id], [sysgroup_name], [sysgroup_description], [sysgroup_created], [sysgroup_updated], [sysgroup_created_by], [sysgroup_updated_by]) VALUES (N'8940b41a-e3a9-44f3-b564-bfd281416141', N'7c536b66-d292-4369-8f37-948b32229b83', N'Administrator', N'Web site administrator group.', CAST(0x0000A37900CAEEB5 AS DateTime), CAST(0x0000A37900CAEEB5 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a222d44d-d96a-4777-b2a7-004c54e632b2', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'UPDATE', CAST(0x0000A3880125E0CD AS DateTime), CAST(0x0000A3880125E0CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83502e11-441d-478c-9441-00b616f3654e', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'INSERT', CAST(0x0000A37900F87D97 AS DateTime), CAST(0x0000A37900F87D97 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e20568e5-93ea-45c6-bcd1-015a5546f575', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39501185836 AS DateTime), CAST(0x0000A39501185836 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0bb79cb-d1c0-407f-9b10-017ca5200186', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D48 AS DateTime), CAST(0x0000A38B009A6D48 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2de8a075-0980-4720-a14c-019856af4dbd', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01067DE3 AS DateTime), CAST(0x0000A38D01067DE3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f039f18-534f-4523-b693-01ee33e4bdbb', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00E47326 AS DateTime), CAST(0x0000A39C00E47326 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a693880d-99f4-4ad7-ac81-026cb5aba176', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0672 AS DateTime), CAST(0x0000A39200BF0672 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'681737c4-9a68-4088-9558-02e948a7a17c', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0098208A AS DateTime), CAST(0x0000A38D0098208A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd31c53d5-5ea2-4df1-afef-02eaa6e17b34', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC601A AS DateTime), CAST(0x0000A39200BC601A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1250e0ff-f36b-4d09-bd9a-02f9b3b914aa', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01065E8A AS DateTime), CAST(0x0000A38D01065E8A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2ea95f72-b03d-4259-a29d-032a5eda37d4', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'INSERT', CAST(0x0000A39500FA6680 AS DateTime), CAST(0x0000A39500FA6680 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f219f07-03bb-4153-b185-036a2455dcb1', N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C173D0 AS DateTime), CAST(0x0000A39C00C173D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0d325e28-4b8b-41c8-a4fa-050a76dcd3dc', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39D009A4020 AS DateTime), CAST(0x0000A39D009A4020 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e824e86b-a5c6-4dc0-bd07-050c830312d6', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C2C68F AS DateTime), CAST(0x0000A39C00C2C68F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'38688567-68f1-49ff-a5a3-056b29f02336', N'381e4348-804a-4300-967a-9a73c04481e9', N'CONTENT', N'INSERT', CAST(0x0000A39C00C100D5 AS DateTime), CAST(0x0000A39C00C100D5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'21768495-3eb1-48e4-b7ab-057d9276a965', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00B8ECCC AS DateTime), CAST(0x0000A39B00B8ECCC AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9d766823-6970-459b-86ae-05fc05bc6e51', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0670 AS DateTime), CAST(0x0000A39200BF0670 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9ce2d2fe-4ede-4dd9-a6b2-061895f54f1f', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'DELETE', CAST(0x0000A39D00970568 AS DateTime), CAST(0x0000A39D00970568 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'481390db-1659-4188-8a18-063db4c2e280', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DEE208 AS DateTime), CAST(0x0000A39900DEE208 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a3e142cc-dee7-4d8c-af4c-06ce7e4a611a', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38801255CEF AS DateTime), CAST(0x0000A38801255CEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0f6ae47-1b19-4a10-9988-06f3c5b790ee', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA5C AS DateTime), CAST(0x0000A38B0094CA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b7a8b005-1a0f-4d22-8611-0787fabef2c9', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38D00EAD06A AS DateTime), CAST(0x0000A38D00EAD06A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e8c74ec-97a3-4e14-ba73-07bf40de98d1', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00984CA4 AS DateTime), CAST(0x0000A38D00984CA4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ad4712ad-52af-4918-a496-0887ed04e5a3', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39C00C90140 AS DateTime), CAST(0x0000A39C00C90140 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4508560b-cb53-4121-abbf-093b1e8e2c54', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DE554B AS DateTime), CAST(0x0000A39900DE554B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3b130c97-4c78-4648-9a1b-094999248580', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38801255CEE AS DateTime), CAST(0x0000A38801255CEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'373b4f73-4904-4106-804a-0976f3c3affb', N'aea05fa9-e3f1-4f24-9bad-27e09794827c', N'CONTENT', N'UPDATE', CAST(0x0000A39C00ADEC7B AS DateTime), CAST(0x0000A39C00ADEC7B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eecd4077-fba6-4c20-9d22-09deb3cfd313', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A3950116A649 AS DateTime), CAST(0x0000A3950116A649 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9fc80145-6f75-433d-8f9e-09e34e2e7d7c', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D8A960 AS DateTime), CAST(0x0000A38D00D8A960 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'89f4c74b-3adc-41bc-bc95-0a28ddd9934e', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C987F0 AS DateTime), CAST(0x0000A39B00C987F0 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e1a313c6-f877-4c37-a480-0a64a264ce20', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00BFB0F7 AS DateTime), CAST(0x0000A39B00BFB0F7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1168fe40-2372-4d7c-81d5-0abced85e77d', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0663 AS DateTime), CAST(0x0000A39200BF0663 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'15c2945d-22d8-423f-8126-0ad6d68163c1', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'INSERT', CAST(0x0000A39D00956EE8 AS DateTime), CAST(0x0000A39D00956EE8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1b89f112-f9e6-43d3-83e6-0b55a50ea53d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00BD3C6B AS DateTime), CAST(0x0000A39B00BD3C6B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f17ceab6-6d7b-4bc3-a4ae-0b684757551e', N'5869354a-9f32-4285-b7c3-261289a8aeea', N'CONTENT', N'INSERT', CAST(0x0000A39C00AF5979 AS DateTime), CAST(0x0000A39C00AF5979 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'582c9b7a-1cab-42d0-b54c-0b6a26ec06db', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00BD3C68 AS DateTime), CAST(0x0000A39B00BD3C68 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'06533fd0-3fd1-436b-a010-0b7e824120be', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BFAC4F AS DateTime), CAST(0x0000A39C00BFAC4F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a7bb6957-cd09-4068-933a-0b83b0312989', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'DELETE', CAST(0x0000A39D009710C3 AS DateTime), CAST(0x0000A39D009710C3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'736ed2ff-647f-4525-8c71-0b9b45f30090', N'3e9e83bd-0b7f-49ea-833e-9562ac4b1a8d', N'PAGE', N'DELETE', CAST(0x0000A38C01072CDC AS DateTime), CAST(0x0000A38C01072CDC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ac662cad-d104-4090-9078-0bc384a04fa7', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010EF94E AS DateTime), CAST(0x0000A388010EF94E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f01923d8-8ddb-4420-a4a7-0c0e623ddcaf', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF1D49 AS DateTime), CAST(0x0000A39200BF1D49 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'30f437a6-06ce-4a1d-a026-0c105757e982', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BC2B4B AS DateTime), CAST(0x0000A39200BC2B4B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9f082525-09b9-4621-89bd-0e010249e6aa', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B87 AS DateTime), CAST(0x0000A38B009B8B87 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ecf2d98a-f449-4628-9f06-0ee0be352e84', N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', N'CONTENT', N'UPDATE', CAST(0x0000A39D009A1CDA AS DateTime), CAST(0x0000A39D009A1CDA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5fcde782-3beb-4723-a7c4-0f5268932423', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00E439DE AS DateTime), CAST(0x0000A39C00E439DE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'db5cb352-3790-49a1-a1bd-0f9f28e452c1', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A3950117B542 AS DateTime), CAST(0x0000A3950117B543 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55b8d208-4a36-42a1-b9b0-10288e2b770c', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'DELETE', CAST(0x0000A39D0096FAE7 AS DateTime), CAST(0x0000A39D0096FAE7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7ea7dbe3-d37f-45fc-9529-103f00a85613', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B00948A9F AS DateTime), CAST(0x0000A38B00948A9F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'22d3bdd6-c8a5-49ab-9430-10536a142d3c', N'037c1a14-7021-4d6b-b438-959065aee3c1', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A6719F AS DateTime), CAST(0x0000A38600A6719F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fe0a7876-80c9-4b8c-93d6-1099718db689', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D008E5AA3 AS DateTime), CAST(0x0000A38D008E5AA3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'954c1c2c-84dd-412f-ae00-10e41b509ecf', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39D009AA1A0 AS DateTime), CAST(0x0000A39D009AA1A0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'60ad9a66-0c2a-41fc-8f05-1102b88d3dd6', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CC0EE AS DateTime), CAST(0x0000A38E011CC0EE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f0fe276b-1666-4c95-9931-1122162e829f', N'381e4348-804a-4300-967a-9a73c04481e9', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C100D6 AS DateTime), CAST(0x0000A39C00C100D6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b6490f6c-a9b0-4609-aa11-11bf182d23ec', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'DEPUBLISH', CAST(0x0000A3AA00C1350A AS DateTime), CAST(0x0000A3AA00C1350A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8beff2c1-7555-4641-89f8-121557769826', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A3850130767F AS DateTime), CAST(0x0000A3850130767F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'adbcc4c9-142a-4ebe-82de-123a0cbdddf5', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF83A AS DateTime), CAST(0x0000A39200BEF83A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ca997eb-a0fc-4305-8990-1397b4687492', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388011D9044 AS DateTime), CAST(0x0000A388011D9044 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'855118cf-419d-4c93-a325-142ccb028d81', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'UPDATE', CAST(0x0000A39B0121DFAC AS DateTime), CAST(0x0000A39B0121DFAC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd0cd1b53-6764-4abf-a7d6-148dad75f1bc', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472E AS DateTime), CAST(0x0000A38B009A472E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3225251e-b87b-4975-8f17-14ac7b950a21', N'5be762ce-7944-4ae8-90f4-41a9b5a27546', N'PAGE', N'DELETE', CAST(0x0000A38C01158373 AS DateTime), CAST(0x0000A38C01158373 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55039a0c-8eeb-46d5-8e0e-1595457af4fa', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D0107FA13 AS DateTime), CAST(0x0000A38D0107FA13 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'49dc2201-f152-4f93-a10b-165975cb989f', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D01092BA7 AS DateTime), CAST(0x0000A38D01092BA7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f9798979-8fc4-4359-b7e5-165a7f5d4e97', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E81266 AS DateTime), CAST(0x0000A38C00E81266 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'89f8cbd8-5549-434c-a657-16b8aff015b6', N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A39D009734B8 AS DateTime), CAST(0x0000A39D009734B8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'67e2b20b-594c-4e97-befa-17cefcac5dfd', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3A901128422 AS DateTime), CAST(0x0000A3A901128422 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'46413133-ca69-422c-9eb9-17f30168f027', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'PUBLISH', CAST(0x0000A38D0104EB5E AS DateTime), CAST(0x0000A38D0104EB5E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f7ac1fee-cf53-4e5f-aa06-180723aab274', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'INSERT', CAST(0x0000A38B00948AA4 AS DateTime), CAST(0x0000A38B00948AA4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f40693f-14c5-403e-8ce2-185032741e0b', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D436 AS DateTime), CAST(0x0000A39D0096D436 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd98331f4-293a-4f1c-a114-197b7a57b2d2', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39A00A98003 AS DateTime), CAST(0x0000A39A00A98003 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4bb955f3-f1ad-404f-b46e-1a48b616223a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C889A4 AS DateTime), CAST(0x0000A39B00C889A4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e56e4e2c-3006-46f4-ba04-1a5993e7f701', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E0413C AS DateTime), CAST(0x0000A39900E0413C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fcf51f2a-d05d-4db3-a7f9-1b1fce9d7380', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125C679 AS DateTime), CAST(0x0000A3880125C679 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5f28f38c-168c-4fa0-bff9-1bd9df322c01', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E011FB4B6 AS DateTime), CAST(0x0000A38E011FB4B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5d71a74-dbfd-4716-93be-1be5a8e215e3', N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'MEDIAFOLDER', N'DELETE', CAST(0x0000A39D009722F9 AS DateTime), CAST(0x0000A39D009722F9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9103c043-5656-426a-9a98-1d1a79c92bbb', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38F0111B6EE AS DateTime), CAST(0x0000A38F0111B6EE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bffcbe63-bf5d-4e9d-95dc-1d28d338349c', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C969B8 AS DateTime), CAST(0x0000A39B00C969B8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a1de2c26-153a-46f4-80c0-1d2d71754ed6', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E76B64 AS DateTime), CAST(0x0000A38D00E76B64 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f51582a0-0b1c-41b1-be89-1d7718a4b7ac', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BF4A58 AS DateTime), CAST(0x0000A39200BF4A58 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fe2ff268-df42-4ed2-a6e7-1e03e428eab9', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'PUBLISH', CAST(0x0000A39500FA6681 AS DateTime), CAST(0x0000A39500FA6681 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f334c8f0-1add-46f0-8492-1e66cfa62a7b', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'PUBLISH', CAST(0x0000A3A901128922 AS DateTime), CAST(0x0000A3A901128922 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b2f3bd0d-6146-43b3-8dcb-1e7fd1ac82ca', N'f85851a4-32b3-4b95-8340-1f039a708f83', N'PAGE', N'DELETE', CAST(0x0000A38E0113B7FB AS DateTime), CAST(0x0000A38E0113B7FB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9b4d9d72-9f8b-4419-be6d-1e8a110e2928', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38500C7919A AS DateTime), CAST(0x0000A38500C7919A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ea2b5e0c-31b5-4705-b6ed-1e8f725c9dff', N'269dfd25-6de3-454e-8056-b14b922497c9', N'PAGE', N'DELETE', CAST(0x0000A38C01029916 AS DateTime), CAST(0x0000A38C01029917 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eaf5687d-e61d-4e84-a82d-1eb50b92cd1b', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39500F60038 AS DateTime), CAST(0x0000A39500F60038 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b7766578-4d76-4dd0-b10c-1f3f70eee806', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E0360F AS DateTime), CAST(0x0000A39900E0360F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd1cbd782-510d-4bf2-876c-1f64f9f42e0d', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C216E4 AS DateTime), CAST(0x0000A39C00C216E4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'dc390f63-d86d-4afa-bd94-1f9634e01715', N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A39D009743C0 AS DateTime), CAST(0x0000A39D009743C0 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cf6c6087-a320-45b8-94ed-1fc7be334525', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DF20AB AS DateTime), CAST(0x0000A39900DF20AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4394e261-1e90-49fe-b92d-1ff1a90a7db8', N'5869354a-9f32-4285-b7c3-261289a8aeea', N'CONTENT', N'UPDATE', CAST(0x0000A39C00AF5983 AS DateTime), CAST(0x0000A39C00AF5983 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bedaa6a6-55e9-4eb4-960b-20302139c345', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BF4A59 AS DateTime), CAST(0x0000A39200BF4A59 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'91419012-78ac-4d09-9bff-208ac531ac77', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38E01154436 AS DateTime), CAST(0x0000A38E01154436 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ad7f5f6-51ea-49d8-95f9-20e470b7ab1b', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1D3E AS DateTime), CAST(0x0000A39200BF1D3E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c796d72-fdf9-40fe-8444-21fe3ebdb7a7', N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B008E17C0 AS DateTime), CAST(0x0000A38B008E17C0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'92f4dc08-93d2-433c-9b73-222feb8c778e', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38800C0A541 AS DateTime), CAST(0x0000A38800C0A541 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'662376cc-4d5b-4b32-8001-224618bed813', N'f9792f8d-1cee-4db6-b01c-21b4e2b5f25f', N'PAGE', N'INSERT', CAST(0x0000A38C01082492 AS DateTime), CAST(0x0000A38C01082492 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a6fb3f2-d106-4a90-afeb-227f0f3e053d', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880126122A AS DateTime), CAST(0x0000A3880126122A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'48eafd0e-363c-4033-a508-22ab6a27e4bd', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'UPDATE', CAST(0x0000A37900CBA5AB AS DateTime), CAST(0x0000A37900CBA5AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a4800a51-3c3f-4131-a610-23c549beaf04', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010740AF AS DateTime), CAST(0x0000A38D010740AF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6d42c9e0-f764-4c2e-93cc-23d8a19fcbac', N'39c49ab9-091c-49d6-b330-80d5046ebb58', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A39B00D0DFE9 AS DateTime), CAST(0x0000A39B00D0DFE9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6f2d67b0-fa3c-4bce-99ae-24429407b50a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38F01124625 AS DateTime), CAST(0x0000A38F01124625 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'efabcc1f-18a9-4d9f-a987-24763f1ccfc8', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'INSERT', CAST(0x0000A38C01114420 AS DateTime), CAST(0x0000A38C01114420 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0c3ad20a-76b3-4e5d-bbe2-24ac4ddd5de6', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F3D AS DateTime), CAST(0x0000A38B00C28F3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e6924835-c9a3-47c6-9299-250e0a5d7639', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B81 AS DateTime), CAST(0x0000A38B009B8B81 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d4f6dd6-a087-4a61-973d-2611919fae86', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010D52A9 AS DateTime), CAST(0x0000A388010D52A9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4e14aa1a-caab-4152-a733-2616876ebdfd', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A39500C53E3D AS DateTime), CAST(0x0000A39500C53E3D AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'725b48ee-e3bc-4320-a924-263a0fcafd7a', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F684C6 AS DateTime), CAST(0x0000A38C00F684C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e24cfff4-0930-4d36-b056-267aaeb85b51', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C83428 AS DateTime), CAST(0x0000A39B00C83428 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa2f699a-510a-4964-9c5e-2684a9dc3af8', N'8282d7aa-1c4a-4d51-bfc7-06b633a62dad', N'PAGE', N'INSERT', CAST(0x0000A38C010E0D11 AS DateTime), CAST(0x0000A38C010E0D11 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'93109c2b-0dcb-49ce-ab28-26a8564d3568', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'DELETE', CAST(0x0000A38D0106C6AD AS DateTime), CAST(0x0000A38D0106C6AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd7846654-9b95-4639-971d-26b054065574', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00BBB4AB AS DateTime), CAST(0x0000A39C00BBB4AB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9f954f40-a448-47d2-a97b-2704023d5e53', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C24992 AS DateTime), CAST(0x0000A39C00C24992 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'51729ac7-89a6-4df2-a70c-272dc3c80311', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E77F2B AS DateTime), CAST(0x0000A38D00E77F2B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'108c276a-abb8-4621-8a99-275018f28b1b', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E01234F9A AS DateTime), CAST(0x0000A38E01234F9A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'854460c9-5164-42ed-98ac-28bf5f21a691', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0FF9 AS DateTime), CAST(0x0000A39200BF0FF9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4e02efee-fa48-43e7-ba21-28d3081fd14f', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012EE1C4 AS DateTime), CAST(0x0000A38E012EE1C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ee615d8c-62b9-4190-b8ee-29721c417a51', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3880107BFC7 AS DateTime), CAST(0x0000A3880107BFC7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'37aab9ad-5e48-443a-9133-2a8938edc232', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'PUBLISH', CAST(0x0000A37900CBA5AD AS DateTime), CAST(0x0000A37900CBA5AD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'73765194-c087-4095-a1f3-2a9d1bced8c4', N'6017f844-b0c2-4fa8-897a-8d5cfaff94ef', N'PAGE', N'DELETE', CAST(0x0000A38E0113F3AE AS DateTime), CAST(0x0000A38E0113F3AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ecba2299-95d2-4c3d-ac7a-2b53aace89e9', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'UPDATE', CAST(0x0000A39C009D9CC1 AS DateTime), CAST(0x0000A39C009D9CC1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1046ca05-d5ae-414d-92d5-2b96cea5d990', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'PUBLISH', CAST(0x0000A38800C0C7C6 AS DateTime), CAST(0x0000A38800C0C7C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'93ffdc11-aefc-4dae-b55a-2bbd4f534263', N'f85851a4-32b3-4b95-8340-1f039a708f83', N'PAGE', N'INSERT', CAST(0x0000A38E0113AE00 AS DateTime), CAST(0x0000A38E0113AE00 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2f44975e-5ec2-4720-a3ab-2bc8451ab41e', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472D AS DateTime), CAST(0x0000A38B009A472D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'01c229ec-eec6-4ebc-94f4-2c071b0603ef', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'PUBLISH', CAST(0x0000A37900F87D98 AS DateTime), CAST(0x0000A37900F87D98 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a11f1d1-bcb7-4d1a-8c55-2c99a2f84b7b', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'DEPUBLISH', CAST(0x0000A37900FDA2EF AS DateTime), CAST(0x0000A37900FDA2EF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b3cfcc90-2cf5-4e84-85ee-2d7086f0abbe', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D0108D169 AS DateTime), CAST(0x0000A38D0108D169 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2c86bd46-02d5-4bf0-981d-2dffcd5b3a89', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C8519D AS DateTime), CAST(0x0000A39B00C8519D AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e1f4477a-4fe6-40a2-8775-2e0663a2b18d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A395011883BD AS DateTime), CAST(0x0000A395011883BD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'84e8c207-2936-40e1-baf2-2e2d6e9c71d6', N'6de553fa-b855-439a-b350-1eb460d50a51', N'POST', N'INSERT', CAST(0x0000A37900F5F1DD AS DateTime), CAST(0x0000A37900F5F1DD AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'73df39cb-b131-4ad0-8e1f-2e3f065de04e', N'a2525b3e-c16d-4cb0-8232-8deaa2fb7af1', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E5F8B AS DateTime), CAST(0x0000A38B008E5F8B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7debbe78-a59e-4533-aa84-30b2be533c64', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB5198 AS DateTime), CAST(0x0000A38D00EB5198 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'20fff514-cf90-4e5d-93fb-33c53b5566f1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D00FEA57E AS DateTime), CAST(0x0000A38D00FEA57E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'df707524-5a0c-43ae-bdd4-33c760a83130', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D01067DE4 AS DateTime), CAST(0x0000A38D01067DE4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'acccf652-da53-4ad7-8f25-33d24d09d46d', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F72D41 AS DateTime), CAST(0x0000A38C00F72D41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0164ea8d-7800-4bd6-9db0-34003afcb99e', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'INSERT', CAST(0x0000A38B00948A99 AS DateTime), CAST(0x0000A38B00948A99 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'01529407-86cf-4536-a7c2-3647f7858717', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'DELETE', CAST(0x0000A39200BEFB32 AS DateTime), CAST(0x0000A39200BEFB32 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f6223a88-60b0-4d3b-89d0-3735a71a8ac5', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC662F AS DateTime), CAST(0x0000A39200BC662F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8b72932d-b9e2-4dc4-8c7e-37bf2bcffdd9', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'DEPUBLISH', CAST(0x0000A38F01126BEE AS DateTime), CAST(0x0000A38F01126BEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'50c4c6ff-f5bb-478f-917f-37fb6d64b08e', N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', N'CONTENT', N'INSERT', CAST(0x0000A39D009A1CD5 AS DateTime), CAST(0x0000A39D009A1CD5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8eb8c144-8a0f-45bc-a197-37ff53bb4f92', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'DELETE', CAST(0x0000A39D0096FF84 AS DateTime), CAST(0x0000A39D0096FF84 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c239670c-5d69-497f-a8e4-384c7810e546', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39A00FDBBD6 AS DateTime), CAST(0x0000A39A00FDBBD6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'84da37d4-71c6-486e-b603-38cd719f4138', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38E012EFF49 AS DateTime), CAST(0x0000A38E012EFF49 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'734e2c24-1b94-47a5-8906-38f15f6fde06', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A3880125E0CD AS DateTime), CAST(0x0000A3880125E0CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4af239d5-a1c1-42ce-b202-39089985b7c5', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'UPDATE', CAST(0x0000A39D00956EE7 AS DateTime), CAST(0x0000A39D00956EE7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3acd1f2a-566a-4118-90ce-393694330a66', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA0 AS DateTime), CAST(0x0000A38D00926EA0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1a2630c2-114a-4799-81c8-393751ea8bab', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DF209E AS DateTime), CAST(0x0000A39900DF209E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6cf45b12-cbe2-4cb9-a4e5-39a06d674d75', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'INSERT', CAST(0x0000A39D00956EDE AS DateTime), CAST(0x0000A39D00956EDE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd23334df-3f4b-4d9a-b0c7-3a3652c3f9e1', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388012302C2 AS DateTime), CAST(0x0000A388012302C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d9935fb-976c-40f0-af79-3b87f4bfb25a', N'af5bf5e4-efa3-4c82-97a8-1f8f3a93d325', N'PAGE', N'INSERT', CAST(0x0000A38E01131E96 AS DateTime), CAST(0x0000A38E01131E96 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d91c029-1eb5-4ee8-b287-3be0e6ffda81', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0104E9AC AS DateTime), CAST(0x0000A38D0104E9AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd2f0bcdb-a07e-4c45-b763-3bf2ceadbd37', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39A00FDBBD4 AS DateTime), CAST(0x0000A39A00FDBBD4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8804b019-c30c-44f4-a013-3c203f74b244', N'037c1a14-7021-4d6b-b438-959065aee3c1', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600A6312F AS DateTime), CAST(0x0000A38600A6312F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8267cabe-2e90-43c5-9d2f-3d62ed4a1ee6', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A37900F8C23F AS DateTime), CAST(0x0000A37900F8C23F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0d0f033a-40f8-4e1e-b8cd-3da451bb24c8', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'UPDATE', CAST(0x0000A388012594CC AS DateTime), CAST(0x0000A388012594CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aae3b850-1a6c-4d84-9524-3dd7f5362372', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125F880 AS DateTime), CAST(0x0000A3880125F880 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b0b369f9-715a-411f-9489-3dfbfdb3aaaf', N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E4441 AS DateTime), CAST(0x0000A38B008E4441 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e564a742-a250-4932-a9e6-3e332c9e0af8', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39501168963 AS DateTime), CAST(0x0000A39501168963 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'abe85a1d-0e83-4c69-866d-3e76c0e1e0e4', N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BB0951 AS DateTime), CAST(0x0000A39C00BB0951 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c63d54dd-ae07-4252-a9b5-3e878b698c6f', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D0108D168 AS DateTime), CAST(0x0000A38D0108D168 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'827545ad-5f04-4c74-8a47-3f3d91db07f5', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00AF618D AS DateTime), CAST(0x0000A39C00AF618D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4ea22c4d-8f17-457e-8589-3f60bddc1e95', N'05de453d-814d-4064-be59-1e5480a0e7d7', N'PAGE', N'DELETE', CAST(0x0000A38C01057C42 AS DateTime), CAST(0x0000A38C01057C42 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7b3bf635-bb3e-4096-858a-3ff4ca5828c1', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'DELETE', CAST(0x0000A3AA00C1351D AS DateTime), CAST(0x0000A3AA00C1351D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'493ab20e-75cf-451b-bbdd-3ff7d4c1eaee', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'PUBLISH', CAST(0x0000A3AA00ABE114 AS DateTime), CAST(0x0000A3AA00ABE114 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bc494862-2f69-468a-8bc8-416fcb10536f', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C27852 AS DateTime), CAST(0x0000A39C00C27852 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c178bec1-929f-4b82-9f69-418a0c4831a8', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38E011FC18C AS DateTime), CAST(0x0000A38E011FC18C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eb42a8dc-a1eb-4456-b9c8-41ab5783d9b8', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125C67C AS DateTime), CAST(0x0000A3880125C67C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'df627671-8d8c-4fac-a8c3-436be34813e7', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'INSERT', CAST(0x0000A39C00C2784C AS DateTime), CAST(0x0000A39C00C2784C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'23d1c8b6-af9a-4106-86e2-43810c38fb5b', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'INSERT', CAST(0x0000A38C00E5249B AS DateTime), CAST(0x0000A38C00E5249B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4a2591f9-0908-426a-ab2a-441c7fd5db44', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00FCE77A AS DateTime), CAST(0x0000A38C00FCE77A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6e2bd593-fcc2-407b-bc16-442dd67dae95', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39D009A5F82 AS DateTime), CAST(0x0000A39D009A5F82 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c2893883-8fe3-454a-a7bd-4447af2cd3ba', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3AA00ABE113 AS DateTime), CAST(0x0000A3AA00ABE113 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4dbfb3dc-6e58-4b36-b529-444cad0f29f5', N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', N'CONTENT', N'INSERT', CAST(0x0000A39D0099EB29 AS DateTime), CAST(0x0000A39D0099EB29 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'78ee3c4e-49eb-4ce2-a0a6-44b09100e6f9', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900E021BB AS DateTime), CAST(0x0000A39900E021BB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'30f508a4-1085-4fa6-a0b8-453fdee6fdc0', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B88 AS DateTime), CAST(0x0000A38B009B8B88 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47155bf9-cb69-4028-a3cb-45aece7793b3', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CCFBF AS DateTime), CAST(0x0000A38E011CCFBF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7e1bf129-93a3-40cd-928d-46fea00deae3', N'269dfd25-6de3-454e-8056-b14b922497c9', N'PAGE', N'INSERT', CAST(0x0000A38C0100CA11 AS DateTime), CAST(0x0000A38C0100CA11 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c119c615-7d9a-425f-9ee1-478172ba4658', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D01284869 AS DateTime), CAST(0x0000A38D01284869 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'67bc0256-cee8-41cb-9651-47a7438da040', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00F1FE0D AS DateTime), CAST(0x0000A39C00F1FE0D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aabc67e2-a90e-4a42-8498-47b1dd7c2dff', N'a058c673-39bb-459c-9f28-d93545cec7be', N'SYSUSER', N'INSERT', CAST(0x0000A38500B29BE6 AS DateTime), CAST(0x0000A38500B29BE6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'13f172ae-54b7-4116-9d41-47b2b5682a3f', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'UPDATE', CAST(0x0000A38800C0052D AS DateTime), CAST(0x0000A38800C0052D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'075dd0c2-adb1-4c24-bbb2-47d08da1052a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A3950114344F AS DateTime), CAST(0x0000A3950114344F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c83fd952-ce0f-436c-8a21-47dd5d0f8652', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DA4991 AS DateTime), CAST(0x0000A38D00DA4991 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8d565cdc-56b5-4e5e-8d11-4868b0e741bb', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'INSERT', CAST(0x0000A38E0114052A AS DateTime), CAST(0x0000A38E0114052A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'de0b9a64-9425-4029-8200-48cf42071846', N'bd310e21-5feb-4201-8e23-e3b4911037f1', N'CONTENT', N'INSERT', CAST(0x0000A39C00C20D3B AS DateTime), CAST(0x0000A39C00C20D3B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'89e4cd13-bb0a-4e1f-9428-4a400d9e9d21', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00E37CE7 AS DateTime), CAST(0x0000A39C00E37CE7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'74b78f79-f456-4c06-aacd-4aae174154ee', N'17945f85-0b22-48c3-885a-c91279fe3360', N'CONTENT', N'INSERT', CAST(0x0000A39D009A3C57 AS DateTime), CAST(0x0000A39D009A3C57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'003b92b5-01cb-4648-860d-4b1737b16e64', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF0674 AS DateTime), CAST(0x0000A39200BF0674 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'894701d6-89ac-4a15-86f9-4bc457415477', N'aea05fa9-e3f1-4f24-9bad-27e09794827c', N'CONTENT', N'INSERT', CAST(0x0000A39C00ADEC72 AS DateTime), CAST(0x0000A39C00ADEC72 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5aeda62f-002f-4cab-af87-4bdb7f789e1f', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'PUBLISH', CAST(0x0000A37900F890C5 AS DateTime), CAST(0x0000A37900F890C5 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f7aff0a3-4054-4d56-810a-4bff09e6c753', N'bd310e21-5feb-4201-8e23-e3b4911037f1', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C20D40 AS DateTime), CAST(0x0000A39C00C20D40 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'139e6954-f4bd-4d57-ba73-4c2b83f0e62b', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E0413B AS DateTime), CAST(0x0000A39900E0413B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd4419b6f-c01e-4865-bcdd-4c449687f50e', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'DELETE', CAST(0x0000A39200BEFB34 AS DateTime), CAST(0x0000A39200BEFB34 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'db7210c3-fd17-4f1b-8cd7-4ce41e66bac0', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC52C4 AS DateTime), CAST(0x0000A39200BC52C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'640afb1e-825a-445e-8e9f-4ce9aabd946d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C987EF AS DateTime), CAST(0x0000A39B00C987EF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'57f526d5-1b3a-46ea-b0c5-4d4ecf2f0691', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A37A00B2DEA3 AS DateTime), CAST(0x0000A37A00B2DEA3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'58bc5987-0323-41ae-b16a-50aa67899a37', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'INSERT', CAST(0x0000A39C00ACA5A3 AS DateTime), CAST(0x0000A39C00ACA5A3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'87758d2a-1c3a-48fc-9b85-50ef940a80f7', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3A90110990D AS DateTime), CAST(0x0000A3A90110990D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3f2a791e-e01e-4a6e-9011-50f6036a88b3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38E012D2335 AS DateTime), CAST(0x0000A38E012D2335 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'09a3feaf-fb3e-486e-a22e-511faac25abe', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB0623 AS DateTime), CAST(0x0000A38D00EB0623 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f415e745-123e-4644-a46e-51ca17ba4711', N'9f295665-9c7e-4d8f-ae06-fa0d8988ddc8', N'PAGE', N'INSERT', CAST(0x0000A39A00A9FB6C AS DateTime), CAST(0x0000A39A00A9FB6C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3a0d9676-2e37-46d7-8838-5217b80f4e40', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00AEE8AF AS DateTime), CAST(0x0000A39C00AEE8AF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4878e881-e4b7-4a87-a13c-52aa50a9a95a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E7EA5C AS DateTime), CAST(0x0000A38D00E7EA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e99672b7-d22b-4540-b40a-534495e9ef96', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3880108E4C7 AS DateTime), CAST(0x0000A3880108E4C7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5f38060-0620-4e39-884b-535cf52efa82', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'DELETE', CAST(0x0000A38C0114F1F3 AS DateTime), CAST(0x0000A38C0114F1F3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a9f415aa-cadd-42d3-8c33-53cc3cecfe81', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'INSERT', CAST(0x0000A39C00C27847 AS DateTime), CAST(0x0000A39C00C27847 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5223abd-5a81-430d-944a-555aa5794d37', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B00948AAC AS DateTime), CAST(0x0000A38B00948AAC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bc6fa756-0af9-46a4-91f7-55e835c205da', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E0360E AS DateTime), CAST(0x0000A39900E0360E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0bc582a2-6d13-4770-9eee-5651359dbc7b', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B0091D1C8 AS DateTime), CAST(0x0000A38B0091D1C8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'70a00f11-dd70-4b47-a8ce-565d29774d76', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA5C AS DateTime), CAST(0x0000A38B0094CA5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ceaed1da-1f15-45b7-b0b2-5763767abc2f', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BD0870 AS DateTime), CAST(0x0000A39200BD0870 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cb7231a-3f45-4906-a1f0-582373ba94a7', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B0091D1CC AS DateTime), CAST(0x0000A38B0091D1CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ef3ff66f-cdc7-47c9-bdb5-588ace04ab26', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A3950114344C AS DateTime), CAST(0x0000A3950114344C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9753d8b4-72fd-4aca-8919-591cb8ee027f', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39500FC6CF3 AS DateTime), CAST(0x0000A39500FC6CF3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5078b67e-614f-4cd5-8ecf-59685d85b3e0', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00BB0DEE AS DateTime), CAST(0x0000A39C00BB0DEE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4c59f65e-3343-4b09-9784-59adf78c9dc8', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BF672F AS DateTime), CAST(0x0000A39200BF672F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'21ebbe5d-0619-4c2a-aa9a-59fc07e0e723', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00A4827C AS DateTime), CAST(0x0000A39C00A4827C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2948f31b-3424-48c4-ac9d-5a1d718a0ceb', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A3880103F190 AS DateTime), CAST(0x0000A3880103F190 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3207aed1-f306-4db1-9d28-5a84652e4c35', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'DEPUBLISH', CAST(0x0000A38D0106BF6C AS DateTime), CAST(0x0000A38D0106BF6C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ce18d6e-8b94-41fe-8c24-5a9d0badd72e', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A3950117B545 AS DateTime), CAST(0x0000A3950117B545 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'32ac8295-42ac-471d-84dd-5b1dcdb39178', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A3880125E962 AS DateTime), CAST(0x0000A3880125E962 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9cc85263-588c-4994-9d3e-5ba52f1be24b', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA5 AS DateTime), CAST(0x0000A38D00926EA5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'80fbce56-0c2b-4472-a8bf-5c88c01b22a1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880145061A AS DateTime), CAST(0x0000A3880145061A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa934c7d-d716-485f-8f5f-5d3cb3c82efd', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00F7C0A7 AS DateTime), CAST(0x0000A39C00F7C0A7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cad64da7-281e-4e98-b94d-5d902a671f2f', N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A39D009734B9 AS DateTime), CAST(0x0000A39D009734B9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55bc0ecb-c0d5-4010-a652-5e9a4195b833', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'DELETE', CAST(0x0000A39D0096F35F AS DateTime), CAST(0x0000A39D0096F35F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ad4c26d4-6e1c-4917-a4fa-5f2b38411750', N'17945f85-0b22-48c3-885a-c91279fe3360', N'CONTENT', N'UPDATE', CAST(0x0000A39D009A3C5F AS DateTime), CAST(0x0000A39D009A3C5F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1dda522a-0d17-4f0e-bae4-5f4c0c682aba', N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', N'CONTENT', N'INSERT', CAST(0x0000A39C00C173C7 AS DateTime), CAST(0x0000A39C00C173C7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'85e92ee4-4f65-44cc-99de-5f8fa5cd15fb', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39A00FDC96B AS DateTime), CAST(0x0000A39A00FDC96B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a84405f1-398b-4bf9-bb56-6015c8355b9a', N'8282d7aa-1c4a-4d51-bfc7-06b633a62dad', N'PAGE', N'DELETE', CAST(0x0000A38C010FF911 AS DateTime), CAST(0x0000A38C010FF911 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5003180d-3afd-49fa-8e9f-60241f84c280', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'INSERT', CAST(0x0000A39C00BFAC47 AS DateTime), CAST(0x0000A39C00BFAC47 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'564a5e48-6d70-453c-b286-60d8c284e1b0', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'INSERT', CAST(0x0000A37900FDB726 AS DateTime), CAST(0x0000A37900FDB726 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa7342e8-9d1f-4d00-b4f0-60e03b13ab7c', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A472B AS DateTime), CAST(0x0000A38B009A472B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f40616d5-c25a-4bb3-a3dd-61b02bbdb250', N'02da6c49-eaee-48fa-97c2-d5c1220fe2a5', N'PAGE', N'INSERT', CAST(0x0000A38C00FE6783 AS DateTime), CAST(0x0000A38C00FE6783 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0f9ba3fd-b232-44e6-8845-61dbdd203922', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00992B8F AS DateTime), CAST(0x0000A39A00992B8F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bea14096-586c-47f2-88dc-62b440b3ff93', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'DELETE', CAST(0x0000A38C010D6D86 AS DateTime), CAST(0x0000A38C010D6D86 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'48f208c2-56a9-472b-93fd-62b8cd60f017', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333D5 AS DateTime), CAST(0x0000A38B00A333D5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd7e47ca5-8f1b-4459-a834-62e0a862b90b', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C969B8 AS DateTime), CAST(0x0000A39B00C969B8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cbf312b2-a0b5-4784-8313-63131b03cd3b', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'INSERT', CAST(0x0000A38C010C8C57 AS DateTime), CAST(0x0000A38C010C8C57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'12666e70-8af6-4d9c-984c-633a6c752ff9', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A3880125E962 AS DateTime), CAST(0x0000A3880125E962 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'be0c2e69-03a9-42fc-8f81-64621e205dda', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388010DD3D9 AS DateTime), CAST(0x0000A388010DD3D9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'badebb83-365c-4e0a-9315-646414f9e213', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A00962FB9 AS DateTime), CAST(0x0000A39A00962FB9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'086186ff-2b49-4ab2-ad8f-648e946dd184', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00F662D4 AS DateTime), CAST(0x0000A38C00F662D4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f302df63-dc3a-4169-8a12-651e08ec2d98', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00E7B2F6 AS DateTime), CAST(0x0000A38D00E7B2F6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'56d72d0a-a158-4679-b3d8-66217c1a568b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A3A900F0B406 AS DateTime), CAST(0x0000A3A900F0B406 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bf1f0c29-0f79-4f78-8144-6667fa785fb8', N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', N'CONTENT', N'INSERT', CAST(0x0000A39C00BB094E AS DateTime), CAST(0x0000A39C00BB094E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'16757e2b-40b0-4f67-92cb-670ca45209ad', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E0115696C AS DateTime), CAST(0x0000A38E0115696C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b538852b-ebbb-41e5-aa2e-672914274f97', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600A2F88B AS DateTime), CAST(0x0000A38600A2F88B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5c57a868-1ebc-4a96-8559-67a1a9c072e7', N'bc239e16-b35e-4c2d-80ff-ec77e6804cad', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A67608 AS DateTime), CAST(0x0000A38600A67608 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2835a315-c223-4181-a4f7-67b24aea5f87', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'DEPUBLISH', CAST(0x0000A39500FC07E4 AS DateTime), CAST(0x0000A39500FC07E4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7b8c3e6f-f577-4b5f-8f70-681d557a69de', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00AE9D7E AS DateTime), CAST(0x0000A39B00AE9D7E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ccae22e2-8c6b-428f-a045-6830723994eb', N'f0218392-1d83-4c42-bf99-a0dc1b70a9ee', N'PAGE', N'INSERT', CAST(0x0000A38C0116620D AS DateTime), CAST(0x0000A38C0116620D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b049b5ac-8fb5-40df-ad92-684362721e1c', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D227 AS DateTime), CAST(0x0000A39D0096D227 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'248be5f9-51d1-4c1c-b018-688add7f6952', N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', N'CONTENT', N'INSERT', CAST(0x0000A39C00C173CB AS DateTime), CAST(0x0000A39C00C173CB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'dceb6821-15c2-40a0-9f02-68a407f93515', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'UPDATE', CAST(0x0000A38C01116DF4 AS DateTime), CAST(0x0000A38C01116DF4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'29d973b7-1d61-4373-8f05-68b572330d06', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A37A00B2C718 AS DateTime), CAST(0x0000A37A00B2C718 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55d5e3cc-2f34-4c8d-aaf1-68d4a298a38a', N'08e8a582-7825-43b2-a12d-2522889f04be', N'SYSPARAM', N'UPDATE', CAST(0x0000A39D0096A073 AS DateTime), CAST(0x0000A39D0096A073 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'13f0df57-33fa-4001-ae16-68d67c2472cb', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38500CA1CBB AS DateTime), CAST(0x0000A38500CA1CBB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cfee864-f991-4c7c-acc8-68fc36a482d8', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'UPDATE', CAST(0x0000A37900F890C5 AS DateTime), CAST(0x0000A37900F890C5 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'faa8834a-0388-4c2a-afb5-697af9adea94', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F41 AS DateTime), CAST(0x0000A38B00C28F41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'61f6c80f-ffc8-4e99-8a0f-69f7d703d0d6', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3A000DCA6A7 AS DateTime), CAST(0x0000A3A000DCA6A7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e0e917e2-ec5f-4ed2-b94f-6a4178bcadb4', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'DELETE', CAST(0x0000A39200BFD5B7 AS DateTime), CAST(0x0000A39200BFD5B7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'295361c9-24b2-436b-b15e-6a4513d4f8b6', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1006 AS DateTime), CAST(0x0000A39200BF1006 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'50d19e88-9c57-4a85-979b-6b482fd164f6', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC663E AS DateTime), CAST(0x0000A39200BC663E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d9befa0-2a79-4b14-8dc3-6bb4c70400c6', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BFAC5A AS DateTime), CAST(0x0000A39C00BFAC5A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a85be2d-cd0b-4e67-947e-6c2b2af103a5', N'765ec467-7ab1-45c5-8e68-a6f90437ec74', N'PAGE', N'DELETE', CAST(0x0000A38C01068495 AS DateTime), CAST(0x0000A38C01068495 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e7663ac-3ae8-4e70-81ce-6d0faf3539fa', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3A9011210A4 AS DateTime), CAST(0x0000A3A9011210A4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd62a6984-8c0b-4884-9029-6d557142b4a0', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB762C AS DateTime), CAST(0x0000A38D00EB762D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6fabe773-8bb4-40da-9bae-6d7212ad6887', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00FB252E AS DateTime), CAST(0x0000A39C00FB252E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a093f790-2a07-4e6c-9211-6e14f27d57e4', N'7c801a0c-fd9b-4792-a556-c0e84712530c', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600BA51F8 AS DateTime), CAST(0x0000A38600BA51F8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd6da387e-b931-4a74-9884-6ea85d1e11aa', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009898AA AS DateTime), CAST(0x0000A38B009898AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4fcb894d-93b2-402e-acc7-6ee78f779fa0', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'INSERT', CAST(0x0000A39200BF0FF3 AS DateTime), CAST(0x0000A39200BF0FF3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'59b005ce-a3be-41ad-9625-6f00fead9cdd', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38C0080D2F5 AS DateTime), CAST(0x0000A38C0080D2F5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd98e8135-21ed-40f1-babf-6f4b0d5abbed', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'PUBLISH', CAST(0x0000A38800C0052F AS DateTime), CAST(0x0000A38800C0052F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b286791c-e9ec-4f6e-a582-6ffc4d30c27c', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38F01124626 AS DateTime), CAST(0x0000A38F01124626 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8dc3fcf5-7a45-4896-8a5e-708fbb345458', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA6 AS DateTime), CAST(0x0000A38D00926EA6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9a7413bb-cf2d-4524-a18d-7117a5a007fb', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DE5553 AS DateTime), CAST(0x0000A39900DE5553 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'14815ff3-1737-423e-b934-7118edbeb9a3', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C866B7 AS DateTime), CAST(0x0000A39B00C866B7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fa0dd78b-e0d8-489d-9aeb-711b928865e4', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388010925F2 AS DateTime), CAST(0x0000A388010925F2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'21bd6194-536e-45b9-808a-7128e9ea1390', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39C00CB5360 AS DateTime), CAST(0x0000A39C00CB5360 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e093b793-9c7d-4a39-b959-71ab76f27be2', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'INSERT', CAST(0x0000A39200BC6013 AS DateTime), CAST(0x0000A39200BC6013 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'315a1141-f0f3-4270-8395-71e52fe5249d', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38F0111D370 AS DateTime), CAST(0x0000A38F0111D370 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6ecf9a51-b874-40e0-adb5-725fe4fc6816', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A3950116A649 AS DateTime), CAST(0x0000A3950116A649 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ab0aa1ba-712b-4f50-8f2f-7273b4b99f00', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D996F4 AS DateTime), CAST(0x0000A38D00D996F4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f087b8fd-3901-41c6-a99e-7370a3e675e3', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C2784B AS DateTime), CAST(0x0000A39C00C2784B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5a8cb48e-0412-4d36-95d3-7371ab7fe97d', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00EFBF97 AS DateTime), CAST(0x0000A39C00EFBF97 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ee321b6c-a5f4-4bd9-a5f0-73bc2be28f61', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BD086F AS DateTime), CAST(0x0000A39200BD086F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c86fbe94-5236-4be7-bbc3-743daae0792e', N'798bc71a-98e2-4e2a-8ddb-21537f6004b7', N'SYSGROUP', N'INSERT', CAST(0x0000A37A00B4532F AS DateTime), CAST(0x0000A37A00B4532F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8a47e38-76b4-44f5-b832-748db57ccd98', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB762D AS DateTime), CAST(0x0000A38D00EB762D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'17e26ac3-f97e-4164-aac8-74aa9ba99d59', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5B623 AS DateTime), CAST(0x0000A38C00E5B623 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2f3fb51e-b847-42ec-9506-74bae6eedd7e', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'INSERT', CAST(0x0000A3A9010FA964 AS DateTime), CAST(0x0000A3A9010FA964 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'acd43699-243f-4485-9916-74c32c605ebe', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0099E6FD AS DateTime), CAST(0x0000A38D0099E6FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cff9f5ed-acf6-4f52-8941-755afee37598', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3A90111FA0E AS DateTime), CAST(0x0000A3A90111FA0E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7b64ab59-8ddd-4098-a5af-76accd1f7bda', N'af5bf5e4-efa3-4c82-97a8-1f8f3a93d325', N'PAGE', N'DELETE', CAST(0x0000A38E0113A0C3 AS DateTime), CAST(0x0000A38E0113A0C3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e9bd1f80-f152-4a3a-ba94-76b94ab0406c', N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', N'CONTENT', N'UPDATE', CAST(0x0000A39D009A1CE5 AS DateTime), CAST(0x0000A39D009A1CE5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2ed553cd-93a3-49a8-8160-77321f7457d7', N'664d9603-5d0a-4fa4-9e08-18036400036c', N'PAGE', N'DELETE', CAST(0x0000A37900FDA2F1 AS DateTime), CAST(0x0000A37900FDA2F1 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a2e8069f-f227-4e7f-ba76-77f0aae39146', N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', N'CONTENT', N'UPDATE', CAST(0x0000A39D009876C9 AS DateTime), CAST(0x0000A39D009876C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ce98145f-e413-4322-bf6c-77f786cb6b5b', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A38801261229 AS DateTime), CAST(0x0000A38801261229 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'037e10cb-8580-4a7b-8e3d-78278bcebe7b', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39501174E61 AS DateTime), CAST(0x0000A39501174E61 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'91a56e90-4763-4b20-b098-78e134663623', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38E012D2327 AS DateTime), CAST(0x0000A38E012D2327 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'70c08b7b-492b-425d-af0b-79c437b01e16', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'UPDATE', CAST(0x0000A388011D98D2 AS DateTime), CAST(0x0000A388011D98D2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b52b17df-4c6c-441e-82b1-79e3828539dd', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'UPDATE', CAST(0x0000A39C009D9CCA AS DateTime), CAST(0x0000A39C009D9CCA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'80e39ecd-bc31-4c73-8c88-7a564620c411', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'DELETE', CAST(0x0000A3880101F8B5 AS DateTime), CAST(0x0000A3880101F8B5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0c22b084-186c-43d6-bc58-7a9dbee5dcf1', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF5CC AS DateTime), CAST(0x0000A39200BEF5CC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'621019a1-20af-4cfb-af4a-7b0d061983d6', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E0115696C AS DateTime), CAST(0x0000A38E0115696C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e7225492-c958-4a4d-adcd-7b35c221adbc', N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A39D009743B5 AS DateTime), CAST(0x0000A39D009743B5 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'87fb277a-d8ba-4213-bccf-7be3da97d9dc', N'de265da8-53e5-4c3e-98e0-7a71c08e55af', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099D368 AS DateTime), CAST(0x0000A39D0099D368 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ce63444e-cbba-4505-89e7-7c0ea5bffe76', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'UPDATE', CAST(0x0000A39D00956EEE AS DateTime), CAST(0x0000A39D00956EEE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'16bc9daa-6770-4148-b089-7c26d44ae05d', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'INSERT', CAST(0x0000A38B009898AB AS DateTime), CAST(0x0000A38B009898AB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a929ce29-6826-4443-bd1c-7c5619a8dc8e', N'bd310e21-5feb-4201-8e23-e3b4911037f1', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C20D3A AS DateTime), CAST(0x0000A39C00C20D3A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b03f763f-d5b3-4d5c-99a3-7e424238cf37', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39200B8742D AS DateTime), CAST(0x0000A39200B8742E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ac6a296c-d9f6-475d-a799-7e4fffdce1bd', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B0091D1B9 AS DateTime), CAST(0x0000A38B0091D1B9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b9d7c8f4-b3dd-4662-8215-7e6d35771dda', N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', N'CONTENT', N'INSERT', CAST(0x0000A39D0099EB29 AS DateTime), CAST(0x0000A39D0099EB29 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c26729c-04f0-4685-b7af-7eae39695d00', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B00AD48AF AS DateTime), CAST(0x0000A39B00AD48AF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c7014bc-610a-4316-bd00-7eb076efbbe1', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38801085761 AS DateTime), CAST(0x0000A38801085761 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ab97e66a-cf67-4d5c-87a1-7ebf717ed8b1', N'9f295665-9c7e-4d8f-ae06-fa0d8988ddc8', N'PAGE', N'DEPUBLISH', CAST(0x0000A3AA00C158B2 AS DateTime), CAST(0x0000A3AA00C158B2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a744b4a6-512b-4783-a1af-7ed7f9fdc7e8', N'7037410c-2cfc-41a4-a1ae-636ec4dd22b2', N'CONTENT', N'INSERT', CAST(0x0000A39D009A1CDC AS DateTime), CAST(0x0000A39D009A1CDC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'516b2d08-6622-4f83-837c-7f0c03eeda0e', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D010FB86B AS DateTime), CAST(0x0000A38D010FB86B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0379a7f6-e2d3-4c42-8f8c-7fa794d0209a', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3A9010E731E AS DateTime), CAST(0x0000A3A9010E731E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'861dbfe2-136d-4188-87ff-800d3288b7de', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38D00926EA8 AS DateTime), CAST(0x0000A38D00926EA8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7607b9f2-fe30-4e70-91a5-807e5dacd0bf', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF1D4C AS DateTime), CAST(0x0000A39200BF1D4C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ce49b7a4-961a-4e3b-8f5d-809af465c6b3', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38600C87958 AS DateTime), CAST(0x0000A38600C87958 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8257547-3a66-4157-af85-80de108fff53', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DED49E AS DateTime), CAST(0x0000A39900DED49E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3e4ab6c2-18b1-44b3-a39e-81b3522526e0', N'381e4348-804a-4300-967a-9a73c04481e9', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C100DD AS DateTime), CAST(0x0000A39C00C100DD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8a48ee61-919d-487f-a5cb-828355360ea4', N'5869354a-9f32-4285-b7c3-261289a8aeea', N'CONTENT', N'INSERT', CAST(0x0000A39C00AF597E AS DateTime), CAST(0x0000A39C00AF597E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fcbacbb8-ab26-4520-8138-836ce3123f80', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00ACAC71 AS DateTime), CAST(0x0000A39C00ACAC71 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'87efad1f-7367-47ba-b7f8-8479baff128f', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3A90112692E AS DateTime), CAST(0x0000A3A90112692E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c88ef11d-11d8-4abf-b6c4-8507f783bccf', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A388010C940B AS DateTime), CAST(0x0000A388010C940B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'86cf4f52-67a0-48cc-b205-859afeab129a', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E011CC919 AS DateTime), CAST(0x0000A38E011CC919 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c7b82b5f-1cb8-4ce1-a3bf-859b853609c6', N'7849b6d6-dc43-43f6-8b5a-5770ab89fbcf', N'PAGE', N'DEPUBLISH', CAST(0x0000A38D0106C6AD AS DateTime), CAST(0x0000A38D0106C6AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e6621d6c-1ad5-4c1f-b8bb-861f4d0fde40', N'965fba5d-f763-4b06-b05a-585831954b8a', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BAEE0C AS DateTime), CAST(0x0000A39C00BAEE0C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a5445956-db4b-4cd6-bc64-87118f67f5c7', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00B8ECCF AS DateTime), CAST(0x0000A39B00B8ECCF AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f5a31beb-3086-4b92-ad99-87ab8c5fd18a', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'UPDATE', CAST(0x0000A39200BF100F AS DateTime), CAST(0x0000A39200BF100F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'161ce0fa-a522-4b51-9b63-8835f1d41f9e', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333CF AS DateTime), CAST(0x0000A38B00A333CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ddb32045-59e2-468c-aea9-88d41280e7df', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DA2C08 AS DateTime), CAST(0x0000A39900DA2C08 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1f432535-d312-4527-bf48-8921b8f4078a', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A4723 AS DateTime), CAST(0x0000A38B009A4723 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8e4de094-db09-4afe-a1d2-89481061a3a5', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39A00FA2D58 AS DateTime), CAST(0x0000A39A00FA2D58 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2d30bc04-6534-44e9-a221-8975c00efd7a', N'05de453d-814d-4064-be59-1e5480a0e7d7', N'PAGE', N'INSERT', CAST(0x0000A38C0102C137 AS DateTime), CAST(0x0000A38C0102C137 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8414635d-956e-4cd0-9dff-89b07543b8e0', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00F7A3E5 AS DateTime), CAST(0x0000A39C00F7A3E5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ff390440-851e-4991-a45f-8a025522d287', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39A00FA2D55 AS DateTime), CAST(0x0000A39A00FA2D55 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7030dbb3-e17d-4153-ab94-8a20e67c7d3c', N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', N'CONTENT', N'INSERT', CAST(0x0000A39C00BB094B AS DateTime), CAST(0x0000A39C00BB094B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fbeaedba-89e6-4fe9-8b12-8abf958d71a2', N'f9792f8d-1cee-4db6-b01c-21b4e2b5f25f', N'PAGE', N'DELETE', CAST(0x0000A38C010D70ED AS DateTime), CAST(0x0000A38C010D70ED AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4c47c529-87bc-403b-9f6d-8af070e4dc77', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F38 AS DateTime), CAST(0x0000A38B00C28F38 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'594d99e4-6943-49ce-ac14-8b0c89c7a157', N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'PAGE', N'UPDATE', CAST(0x0000A37900CBCF1B AS DateTime), CAST(0x0000A37900CBCF1B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'21d696ae-d4a9-4255-902b-8b481f8b665f', N'5869354a-9f32-4285-b7c3-261289a8aeea', N'CONTENT', N'UPDATE', CAST(0x0000A39C00AF597D AS DateTime), CAST(0x0000A39C00AF597D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2cab1c5a-4bc3-4cc8-a8ec-8b575d8cc714', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'DEPUBLISH', CAST(0x0000A38F0112509F AS DateTime), CAST(0x0000A38F0112509F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ed48a8b-ce51-43b2-bcae-8b8ee5bada4b', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C2AD40 AS DateTime), CAST(0x0000A39C00C2AD40 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'92de4815-d9da-47db-b0cd-8d0edbaca5d2', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0107FA13 AS DateTime), CAST(0x0000A38D0107FA13 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd9c63b75-cf3a-4110-9e07-8d13381931c3', N'28b7b418-1bae-4290-bb03-b7dc3cd47514', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A38B008E179B AS DateTime), CAST(0x0000A38B008E179B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cd949c81-fb9b-4f0f-871c-8d50c7ba38e7', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C011FAA14 AS DateTime), CAST(0x0000A38C011FAA14 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'34dbd1c2-f1be-464b-bac5-8d70ed914494', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DEF36C AS DateTime), CAST(0x0000A39900DEF36C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4de14da6-5ba2-4575-a9db-8d75fba899a5', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'DELETE', CAST(0x0000A39D00970B23 AS DateTime), CAST(0x0000A39D00970B23 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9f9dbcf4-2019-49d6-b7f4-8dab3d398556', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'UPDATE', CAST(0x0000A38800C0C7C2 AS DateTime), CAST(0x0000A38800C0C7C3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ab446ea1-f58c-4e88-afbc-8e60ce605538', N'23d20863-94fb-43e8-8138-1332e5784a3f', N'PAGE', N'DELETE', CAST(0x0000A38C010750CF AS DateTime), CAST(0x0000A38C010750CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1bfc7d94-ace8-4e65-8c57-90390fc99b2c', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39200B8B24C AS DateTime), CAST(0x0000A39200B8B24C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c3e0dece-a9a9-4b9c-a099-909868480d2f', N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099BB41 AS DateTime), CAST(0x0000A39D0099BB41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b4b532a6-2db3-4daf-b322-909fb34fd52c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A3880144F5B5 AS DateTime), CAST(0x0000A3880144F5B5 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f8e872a0-2e25-40ef-a4cc-9116f452d99c', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A38E011FC18C AS DateTime), CAST(0x0000A38E011FC18C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8540731a-22ea-49e4-8a7e-918e52a5ff45', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D0128486E AS DateTime), CAST(0x0000A38D0128486E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4aa9088b-c51b-4a80-9375-92b031937dbe', N'02da6c49-eaee-48fa-97c2-d5c1220fe2a5', N'PAGE', N'DELETE', CAST(0x0000A38C00FF17C6 AS DateTime), CAST(0x0000A38C00FF17C6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7daad78a-921d-4f78-86b7-941c1cc819a3', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00BFB0F4 AS DateTime), CAST(0x0000A39B00BFB0F4 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ddf81080-0f56-4af8-a84c-9435e4d019f5', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A386009FE9C4 AS DateTime), CAST(0x0000A386009FE9C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0ea25248-74d3-4220-9336-947872134a05', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39501174E60 AS DateTime), CAST(0x0000A39501174E60 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5f0b59cb-0184-41e9-98e8-94ba0589497f', N'a67dbaed-0474-4245-9775-857032fb8faf', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A39501167432 AS DateTime), CAST(0x0000A39501167432 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8e845fe4-bab0-4923-9b62-9518a7aae8fe', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA4D AS DateTime), CAST(0x0000A38B0094CA4D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'929e46d1-655e-4c40-8264-95417cc804f3', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A37900FDB727 AS DateTime), CAST(0x0000A37900FDB727 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ccc10d79-654f-4930-892d-9564ec9971be', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'UPDATE', CAST(0x0000A38B0094CA56 AS DateTime), CAST(0x0000A38B0094CA56 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'01390b6e-34e0-412c-98dc-958e79d9c26a', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C00A46443 AS DateTime), CAST(0x0000A39C00A46443 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'53b9a583-50bf-40c1-a278-9671eeae3439', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DED49E AS DateTime), CAST(0x0000A39900DED49E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'113869a1-0730-4c27-8cce-9750e067a42c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880144F5BC AS DateTime), CAST(0x0000A3880144F5BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1694962d-cb03-419e-98b6-9774d8552854', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39D009AA19F AS DateTime), CAST(0x0000A39D009AA19F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5b172bd0-c723-4966-83bd-97c1fdd4e4a6', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'DELETE', CAST(0x0000A38B009888B6 AS DateTime), CAST(0x0000A38B009888B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8e16cb3e-5418-4205-b7f5-97f63b8fc85e', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'DELETE', CAST(0x0000A39D0097281E AS DateTime), CAST(0x0000A39D0097281E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b130bc16-9089-4a88-a169-97ff4e65652a', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'INSERT', CAST(0x0000A3880108739F AS DateTime), CAST(0x0000A3880108739F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'62afa117-b8d8-48db-afc3-994b4ae2e423', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E0120A2FD AS DateTime), CAST(0x0000A38E0120A2FD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'769d4511-bfa3-496c-a1e7-99606a90846f', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D00EB0625 AS DateTime), CAST(0x0000A38D00EB0625 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7f323789-f2f7-407e-8462-99e902848228', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6649 AS DateTime), CAST(0x0000A39200BC6649 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7df150f9-58fe-41cb-8ef8-99eebf55692b', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A39501167B96 AS DateTime), CAST(0x0000A39501167B96 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c8fe66a1-8f24-4c5e-ac4e-9b1723d4002f', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38E011FB4B6 AS DateTime), CAST(0x0000A38E011FB4B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'65968cf9-3c46-4a4c-aeba-9d307e6d1203', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D01028D5C AS DateTime), CAST(0x0000A38D01028D5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3f0bc3ef-23c7-4baa-8b18-9d6e7f7d6bfc', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'DELETE', CAST(0x0000A38D0106BF6E AS DateTime), CAST(0x0000A38D0106BF6E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'89a2624e-1c2e-420a-865f-9dd75baa6572', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A3A00093F725 AS DateTime), CAST(0x0000A3A00093F725 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bb436c94-0255-498b-83e1-9e4ccdbe3fcb', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200B8A330 AS DateTime), CAST(0x0000A39200B8A330 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0a672a49-ce8e-40ae-aa0e-9e7a65155092', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'INSERT', CAST(0x0000A39200BC52C0 AS DateTime), CAST(0x0000A39200BC52C0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b122d5b0-f055-450d-9e8c-9ee9daf1e278', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C011A007B AS DateTime), CAST(0x0000A38C011A007B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'74f0f4cf-c079-4123-a108-9f5ffec9e506', N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A39D009743B9 AS DateTime), CAST(0x0000A39D009743B9 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4757fbf5-90f5-48ed-9def-9f6cadf98536', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38E012EFF41 AS DateTime), CAST(0x0000A38E012EFF41 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1a09d2a1-63fb-41ff-9eb6-a04ea237c61b', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6646 AS DateTime), CAST(0x0000A39200BC6646 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4181069d-903a-44dd-8bed-a07bb8e4e9fb', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'PUBLISH', CAST(0x0000A3880125A7B8 AS DateTime), CAST(0x0000A3880125A7B8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fec62314-b1c5-4adb-a57a-a17ad323c80a', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'UPDATE', CAST(0x0000A38F0111B6E9 AS DateTime), CAST(0x0000A38F0111B6E9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'046a98a8-edbd-423b-8521-a1be98f1fbc6', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'INSERT', CAST(0x0000A37A00B2C716 AS DateTime), CAST(0x0000A37A00B2C716 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0496d18-cbaa-444e-bb27-a210ee95cb87', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D3F AS DateTime), CAST(0x0000A38B009A6D3F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'06fac21e-d7bf-4604-aca0-a280af799617', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'UPDATE', CAST(0x0000A39B0121DFA3 AS DateTime), CAST(0x0000A39B0121DFA3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bee36e9f-7a87-4ca3-962a-a2e0f4ed7012', N'9f295665-9c7e-4d8f-ae06-fa0d8988ddc8', N'PAGE', N'UPDATE', CAST(0x0000A39A00AA0E57 AS DateTime), CAST(0x0000A39A00AA0E57 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'778bcda6-8e30-4502-ad65-a33af4f284fa', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'PUBLISH', CAST(0x0000A388012594C9 AS DateTime), CAST(0x0000A388012594C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'78d62ca1-2cb7-46e0-b863-a36bad9d691e', N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099BB2E AS DateTime), CAST(0x0000A39D0099BB2E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'34dc2353-c0bf-4985-91b1-a40797802251', N'765ec467-7ab1-45c5-8e68-a6f90437ec74', N'PAGE', N'INSERT', CAST(0x0000A38C01059B9F AS DateTime), CAST(0x0000A38C01059B9F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'31a1b718-c913-47ad-8b32-a43b5052fd02', N'32ea5f1c-f7d6-48a9-8e85-494d48a2fe56', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38B0108A4EB AS DateTime), CAST(0x0000A38B0108A4EB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7c4a368a-99f0-4edd-9ef7-a50b4a913012', N'381e4348-804a-4300-967a-9a73c04481e9', N'CONTENT', N'INSERT', CAST(0x0000A39C00C100D8 AS DateTime), CAST(0x0000A39C00C100D8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5fc7070a-c50f-4320-8c2a-a560cfe2b9cb', N'aea05fa9-e3f1-4f24-9bad-27e09794827c', N'CONTENT', N'INSERT', CAST(0x0000A39C00ADEC6C AS DateTime), CAST(0x0000A39C00ADEC6C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2a9066f9-c712-4cbd-a1d8-a632fb2a2e05', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38801450619 AS DateTime), CAST(0x0000A38801450619 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4b6f1340-6b94-4a18-a206-a79b16bef8f3', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A38B0091D1C2 AS DateTime), CAST(0x0000A38B0091D1C2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e1b5725f-02ed-4c54-aee5-a7c230208529', N'9f295665-9c7e-4d8f-ae06-fa0d8988ddc8', N'PAGE', N'PUBLISH', CAST(0x0000A39A00AA0E58 AS DateTime), CAST(0x0000A39A00AA0E58 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd35fa8d2-12ba-4046-a6ee-a7de7c2dd0ab', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A3880125D170 AS DateTime), CAST(0x0000A3880125D170 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c1214a8c-ac09-4a01-bfd4-a8677700785f', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333C9 AS DateTime), CAST(0x0000A38B00A333C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'69d0359e-1f80-46ff-a0b7-a86b7e1b291b', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'PUBLISH', CAST(0x0000A39C00D15DD8 AS DateTime), CAST(0x0000A39C00D15DD8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'67d5fdbe-7bdf-47db-a8b3-a8818bb63c05', N'17945f85-0b22-48c3-885a-c91279fe3360', N'CONTENT', N'INSERT', CAST(0x0000A39D009A3C5A AS DateTime), CAST(0x0000A39D009A3C5A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'5d665447-979f-44ef-b5ef-a9446d5a83e6', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C27E63 AS DateTime), CAST(0x0000A39C00C27E63 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e506341-2491-455e-959a-a956ed7592e3', N'66bf836d-ae2f-4b0c-b52f-c2d9635cb55a', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A3A90109CB26 AS DateTime), CAST(0x0000A3A90109CB26 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'10d3ad14-4266-4f22-9692-a9b13f463999', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A388012554D8 AS DateTime), CAST(0x0000A388012554D8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6290f884-316d-4686-aa17-a9fd9d56a7d2', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010740AD AS DateTime), CAST(0x0000A38D010740AD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f368a4b2-5fda-491e-8a0c-aa6391546511', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900E021B8 AS DateTime), CAST(0x0000A39900E021B8 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55890a14-9e8c-4dc2-997e-ac0dcd55fe56', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0098BB31 AS DateTime), CAST(0x0000A38D0098BB31 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e154afe8-dd4c-43f5-84d6-ac251f3bd8b7', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'INSERT', CAST(0x0000A388010CC8C7 AS DateTime), CAST(0x0000A388010CC8C7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6a59af16-1bad-4a36-b210-ac57a79ac340', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'DELETE', CAST(0x0000A39D0096FF80 AS DateTime), CAST(0x0000A39D0096FF80 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'66e0002c-5d02-477e-aa31-ac7dcc5e1fa8', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F683D AS DateTime), CAST(0x0000A38B008F683D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f68ef67-698a-4ddc-991f-ad9eaa755065', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DA2C19 AS DateTime), CAST(0x0000A39900DA2C19 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bba13012-e5eb-4ea1-9f71-adec305b03e2', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D58C AS DateTime), CAST(0x0000A39D0096D58C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bdf90265-5308-4aac-9bad-ae1bd610506d', N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A39D009734B3 AS DateTime), CAST(0x0000A39D009734B3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'77bb8563-fcdd-4c16-93db-aedeb3dc185c', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'INSERT', CAST(0x0000A39200BF1D4A AS DateTime), CAST(0x0000A39200BF1D4A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47f04ac7-4a35-4243-b0b1-aee79bc8c910', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A0098779A AS DateTime), CAST(0x0000A39A0098779A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'95e4fbce-aa57-45cc-a15a-aefa8bb49eb7', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D00FEA578 AS DateTime), CAST(0x0000A38D00FEA578 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2d0c9604-dcb3-4798-95d3-af6b5b7cf032', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'INSERT', CAST(0x0000A39C009D9CBB AS DateTime), CAST(0x0000A39C009D9CBB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b8bb6d04-fff7-41de-98d8-afd064029b54', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010682A8 AS DateTime), CAST(0x0000A38D010682A8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f98427f8-f0b1-4473-8e23-b0233794ab01', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A38D010FB86E AS DateTime), CAST(0x0000A38D010FB86E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f9946fc9-acb1-433d-bc44-b03f3fd269fb', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'DELETE', CAST(0x0000A39D0097055F AS DateTime), CAST(0x0000A39D0097055F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'727d0fb0-7cfb-485d-88b0-b09dfebd0e0d', N'00f36eb8-cd24-465c-8c35-ba7e504b5ddc', N'CONTENT', N'UPDATE', CAST(0x0000A39C00C173C9 AS DateTime), CAST(0x0000A39C00C173C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3c65fcbb-2785-4c6e-9c0d-b0f528e2a46a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00985D27 AS DateTime), CAST(0x0000A38D00985D27 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'76768707-0cfa-4221-ac3f-b14b9d269326', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3AA00ABA236 AS DateTime), CAST(0x0000A3AA00ABA237 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'756c3c8c-81d6-428c-992f-b18a8b9651d2', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C775D6 AS DateTime), CAST(0x0000A39B00C775D6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cc101f79-3fc2-41b8-b1e1-b1a6946164e0', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0101CAC2 AS DateTime), CAST(0x0000A38D0101CAC2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'447a22d8-60ee-41b6-a661-b1e1fe174fd3', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'UPDATE', CAST(0x0000A39C00ACA5AF AS DateTime), CAST(0x0000A39C00ACA5AF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3b911863-61af-4d84-b554-b259884866fa', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A3880125D171 AS DateTime), CAST(0x0000A3880125D171 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'78cf7437-5304-4644-b544-b4160f7256cb', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'DELETE', CAST(0x0000A38C00FE8183 AS DateTime), CAST(0x0000A38C00FE8183 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aa012382-8d90-4570-a633-b4b761933374', N'72bc5f8f-0f94-4405-9630-cc757dac177d', N'PAGE', N'DELETE', CAST(0x0000A38F01126BEF AS DateTime), CAST(0x0000A38F01126BEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7631ca92-093f-4211-8556-b6be6ea7e48a', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125D7DB AS DateTime), CAST(0x0000A3880125D7DB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8202c395-8624-4d65-8767-b8212f574e2b', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39200BC835B AS DateTime), CAST(0x0000A39200BC835B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e665e5df-8b62-4b0a-95fe-b8d66baf72c7', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C97E20 AS DateTime), CAST(0x0000A39B00C97E20 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7d2a20e8-c604-402e-94b0-b92770bd35dd', N'7fac9f3d-1e32-40e1-b475-1a8697a32bf3', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A386009FD0D9 AS DateTime), CAST(0x0000A386009FD0D9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83634263-b007-4cde-874b-b932cbd4c326', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'INSERT', CAST(0x0000A39C009D9CC4 AS DateTime), CAST(0x0000A39C009D9CC4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'96272b9f-a49f-4400-8b29-b9cc0239c2ad', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B00A2A002 AS DateTime), CAST(0x0000A39B00A2A002 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'29f7067d-7238-4a6b-b7fb-ba05f4ffe7f5', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'PUBLISH', CAST(0x0000A39C00D0C4AC AS DateTime), CAST(0x0000A39C00D0C4AC AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'da73493b-91a0-4ba2-ac50-ba0715ba7a4b', N'94823a5c-1e29-4bdb-84e4-9b5f636cddb5', N'PAGE', N'PUBLISH', CAST(0x0000A37900CBCF1C AS DateTime), CAST(0x0000A37900CBCF1C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'52b9dd94-a136-466a-a489-ba4409da7767', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'INSERT', CAST(0x0000A37900F8C23E AS DateTime), CAST(0x0000A37900F8C23E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3994877f-2f1b-437b-bdde-babd3e9d289f', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00D15DD7 AS DateTime), CAST(0x0000A39C00D15DD7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c9504c30-54bb-4fdc-8312-bae1da19eac0', N'6de553fa-b855-439a-b350-1eb460d50a51', N'POST', N'PUBLISH', CAST(0x0000A37900F5F1DE AS DateTime), CAST(0x0000A37900F5F1DE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0fe06703-91f7-4718-973e-bb9deb883323', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E01234546 AS DateTime), CAST(0x0000A38E01234546 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0db83497-d984-42f8-a846-bccb0a73671d', N'7bd04ca9-c8db-4841-b2f6-856888b6a733', N'PAGE', N'UPDATE', CAST(0x0000A38C0114CEF3 AS DateTime), CAST(0x0000A38C0114CEF3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e4c3f256-647e-4516-961c-bcee5e2b9bac', N'4870673b-684c-4b9d-8f03-af85039e6f87', N'MEDIAFOLDER', N'DELETE', CAST(0x0000A39D00972820 AS DateTime), CAST(0x0000A39D00972820 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'098ed071-be16-44bc-ac92-bd8617e3ea89', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF83C AS DateTime), CAST(0x0000A39200BEF83C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'efc9ad0a-402a-462b-8f41-be449aa9b62a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'DELETE', CAST(0x0000A39C00CBD382 AS DateTime), CAST(0x0000A39C00CBD382 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83848f68-625a-4808-8de2-beb1791c6c78', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A393011A231F AS DateTime), CAST(0x0000A393011A231F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b8daefe1-e7c4-4a2f-9699-bf1ed213f1c0', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'UPDATE', CAST(0x0000A39C00F78E7C AS DateTime), CAST(0x0000A39C00F78E7C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3d233a0a-da91-4c63-9114-bf5b76a51a37', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00BD694F AS DateTime), CAST(0x0000A39B00BD694F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ea4f09ad-c1a4-47f7-8f91-bff3247294c9', N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', N'CONTENT', N'INSERT', CAST(0x0000A39D0099BB25 AS DateTime), CAST(0x0000A39D0099BB25 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1cabca7d-5f6a-4928-989f-bffcca44378c', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'INSERT', CAST(0x0000A39C00ACA5B1 AS DateTime), CAST(0x0000A39C00ACA5B1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7502700e-cfa0-4565-8e53-c01c78d96a97', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC6015 AS DateTime), CAST(0x0000A39200BC6015 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'101792d6-1124-45af-856d-c079947be8ae', N'17945f85-0b22-48c3-885a-c91279fe3360', N'CONTENT', N'UPDATE', CAST(0x0000A39D009A3C59 AS DateTime), CAST(0x0000A39D009A3C59 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'59afdf80-4e2d-438a-b378-c10deaa56812', N'bd310e21-5feb-4201-8e23-e3b4911037f1', N'CONTENT', N'INSERT', CAST(0x0000A39C00C20D39 AS DateTime), CAST(0x0000A39C00C20D39 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'985b5446-938d-496a-9ce2-c191bfb4690e', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3A90112891D AS DateTime), CAST(0x0000A3A90112891D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8bda1175-f2cf-4b7c-906d-c284bafdffcc', N'34b80a56-34cc-4cc8-8f77-e2f4d1f56b99', N'CONTENT', N'DELETE', CAST(0x0000A39D009710BC AS DateTime), CAST(0x0000A39D009710BC AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f581edb8-fb17-4168-a543-c33f3ebabbf4', N'966a684d-cf68-4b4d-b809-5ac7755a53be', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D22C AS DateTime), CAST(0x0000A39D0096D22C AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47c039fb-c2f6-4f60-bc06-c37af964b5cc', N'fa7b4f1e-51e9-4135-9813-fec2e1ef8f0c', N'CONTENT', N'DELETE', CAST(0x0000A39D0096FAF3 AS DateTime), CAST(0x0000A39D0096FAF3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9d96063c-5b80-4927-8876-c38a917bdc8d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00987795 AS DateTime), CAST(0x0000A39A00987795 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'99d35957-020c-41ab-8816-c3995ce52a3c', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0104EB5C AS DateTime), CAST(0x0000A38D0104EB5C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'17480fa7-6d44-4acb-b018-c3c24a425846', N'37dccf84-07fc-4250-a193-361ae6547447', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D589 AS DateTime), CAST(0x0000A39D0096D589 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'28f85533-b87a-4aef-bc1b-c442bee66c8f', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B01226516 AS DateTime), CAST(0x0000A39B01226516 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3cd8c206-8723-4000-a260-c5887e7c664b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38C0118A31D AS DateTime), CAST(0x0000A38C0118A31D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'15a8aaaa-2c92-48a4-8fe5-c6e03b63d4de', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'INSERT', CAST(0x0000A39200B88D76 AS DateTime), CAST(0x0000A39200B88D76 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'08866729-cac8-4043-bdf9-c80f675d902e', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DA5833 AS DateTime), CAST(0x0000A38D00DA5833 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8584d37e-6bfb-4271-adf0-c827965c7ff6', N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', N'CONTENT', N'INSERT', CAST(0x0000A39D009876BF AS DateTime), CAST(0x0000A39D009876BF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'9bbcc695-2107-423b-94e2-c8531322a13f', N'965fba5d-f763-4b06-b05a-585831954b8a', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BAEDFD AS DateTime), CAST(0x0000A39C00BAEDFD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1d2db80c-c92c-4739-8052-c875a786f67a', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D0099902D AS DateTime), CAST(0x0000A38D0099902D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e8b668a1-2097-4eac-8345-c89b341b147a', N'850e81b5-1bce-45b9-bcc7-01555d4d6974', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38800BFF123 AS DateTime), CAST(0x0000A38800BFF123 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3c75b070-e754-4a91-a49b-c96c9a170fa9', N'da7b4935-4e58-4970-a8a0-4e945e212166', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A38600A2E2C4 AS DateTime), CAST(0x0000A38600A2E2C4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4d507e88-f6f5-4563-8a3b-c9a0e4ce6e8d', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A38D0105B37B AS DateTime), CAST(0x0000A38D0105B37B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b17507cd-454b-47bc-aac1-cb8b6be4dbb4', N'90af1b6b-a139-44e0-ab2a-5f910f61bc00', N'PAGE', N'INSERT', CAST(0x0000A3880106FC78 AS DateTime), CAST(0x0000A3880106FC78 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'eb9728cd-1754-4184-a8b9-cc015bcc202c', N'b5bc4109-a0b9-4a38-acad-d0b19d331858', N'CONTENT', N'DELETE', CAST(0x0000A39D0096D432 AS DateTime), CAST(0x0000A39D0096D432 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'440c2fa5-acd2-4518-8487-cc3534840021', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39200BFB951 AS DateTime), CAST(0x0000A39200BFB951 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0446a7fe-adba-4ba0-a2e6-cc5aa8d58c17', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A38E01154435 AS DateTime), CAST(0x0000A38E01154435 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'11379519-7b5b-41dc-9f44-ccf733dbca62', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'UPDATE', CAST(0x0000A39200BC52BE AS DateTime), CAST(0x0000A39200BC52BE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f0be85da-04a7-4f19-b440-cd29dc5f204e', N'90af1b6b-a139-44e0-ab2a-5f910f61bc00', N'PAGE', N'DELETE', CAST(0x0000A38D0106BC1F AS DateTime), CAST(0x0000A38D0106BC1F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cb68d801-6c51-43ea-b6f5-cd3763dced49', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B00A02364 AS DateTime), CAST(0x0000A39B00A02364 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'72d5dd5a-1e2e-49d8-83fe-cf13b7ccc207', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BC835D AS DateTime), CAST(0x0000A39200BC835D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ba2bdba-7758-40c6-8782-cf1d371b9482', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C889A3 AS DateTime), CAST(0x0000A39B00C889A3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'241282c4-f9ec-4584-ad17-cf3b928bfeff', N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099EB2E AS DateTime), CAST(0x0000A39D0099EB2E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bd834510-5ad1-4481-97a1-cfff749277ff', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39A00992B90 AS DateTime), CAST(0x0000A39A00992B90 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'60f18191-264e-4019-b1ec-d00a8a929e77', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'DELETE', CAST(0x0000A38F011250A1 AS DateTime), CAST(0x0000A38F011250A1 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'29cdc8cb-b88b-441d-a264-d00dcc3b9211', N'a058c673-39bb-459c-9f28-d93545cec7be', N'SYSUSER', N'UPDATE', CAST(0x0000A3880102DA0F AS DateTime), CAST(0x0000A3880102DA0F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ff4d93b4-da12-481a-8b66-d016a9685071', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'DELETE', CAST(0x0000A39D0096F352 AS DateTime), CAST(0x0000A39D0096F352 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'87c68dc9-dd68-4aca-a7c1-d1a2666d49b7', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38801231899 AS DateTime), CAST(0x0000A38801231899 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'71c76d55-8663-44c6-9933-d1b85197e220', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39200BF6730 AS DateTime), CAST(0x0000A39200BF6730 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd55bb0fc-2891-4b1d-99b6-d1dbb23af0d4', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38801232D6E AS DateTime), CAST(0x0000A38801232D6E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'de86e81c-bfec-4f17-a3c3-d1e12caebcda', N'258b2bda-f282-429e-8e93-a1c919fbabba', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38E0112CAEF AS DateTime), CAST(0x0000A38E0112CAEF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1b372cf1-049a-42d4-816b-d2010f6ea5a7', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39C00BBB4AC AS DateTime), CAST(0x0000A39C00BBB4AC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'83a66085-d245-4f35-8dc5-d256891df9a6', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DE9872 AS DateTime), CAST(0x0000A39900DE9872 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c4eb7ddc-09cd-4dec-89a1-d26ba9de0e18', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D3D AS DateTime), CAST(0x0000A38B009A6D3D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'982d6b86-877c-4f5a-af2a-d2a2455662a2', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C866B6 AS DateTime), CAST(0x0000A39B00C866B6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1c36cfa2-4050-450e-a3e5-d2bc3368da06', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B00A06F80 AS DateTime), CAST(0x0000A39B00A06F80 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ad899c5b-b3c4-4efd-b32e-d2d8b2d3d9c9', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'INSERT', CAST(0x0000A38B008F683B AS DateTime), CAST(0x0000A38B008F683B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'59e946d6-e37f-461c-bccc-d39c88065be1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39B00AD48B2 AS DateTime), CAST(0x0000A39B00AD48B2 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6547bf3c-db1a-4fa8-9220-d4f0c8bfe051', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'PUBLISH', CAST(0x0000A3A9010FA966 AS DateTime), CAST(0x0000A3A9010FA966 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6904fba0-9116-4fb7-8ecb-d50e61954aa7', N'de265da8-53e5-4c3e-98e0-7a71c08e55af', N'CONTENT', N'INSERT', CAST(0x0000A39D0099D306 AS DateTime), CAST(0x0000A39D0099D306 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'69aba640-97ed-439a-b310-d58e7b4ef836', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39D009A5F84 AS DateTime), CAST(0x0000A39D009A5F84 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1252ae61-83dc-4286-a07c-d5c1f6b21927', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'INSERT', CAST(0x0000A38C01170C9B AS DateTime), CAST(0x0000A38C01170C9B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ad99d39-7744-4ebe-9f76-d5cfc53c07dc', N'94ad17c0-032c-4c87-a2e0-28849c2df0d7', N'MEDIAFOLDER', N'INSERT', CAST(0x0000A39D009743BA AS DateTime), CAST(0x0000A39D009743BA AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7695f740-eed4-4345-aa6e-d5f4fe6b9c06', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'DELETE', CAST(0x0000A39200BEF5C9 AS DateTime), CAST(0x0000A39200BEF5C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'35a4c174-d754-4327-ae60-d609156e3861', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009A6D35 AS DateTime), CAST(0x0000A38B009A6D35 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f49dbb6f-6297-41b9-9364-d6600996195b', N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', N'CONTENT', N'INSERT', CAST(0x0000A39D009876BB AS DateTime), CAST(0x0000A39D009876BB AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'592ee563-8302-4b6f-9b81-d75ddc3f2d2f', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E601D0 AS DateTime), CAST(0x0000A38C00E601D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'aa062d74-1a78-402a-9ace-d81e48f6904e', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38801042D22 AS DateTime), CAST(0x0000A38801042D22 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'750f3f97-43f0-4c7c-bc86-d93c2c884055', N'9f295665-9c7e-4d8f-ae06-fa0d8988ddc8', N'PAGE', N'DELETE', CAST(0x0000A3AA00C158B3 AS DateTime), CAST(0x0000A3AA00C158B3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'52418945-e67d-4b65-9a28-d9a8ded69d2e', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00BD694F AS DateTime), CAST(0x0000A39B00BD694F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a9d21244-e754-4b21-aa63-da810bb2485d', N'ab6aa2b9-256b-41b1-97e2-9caec9a27910', N'CONTENT', N'INSERT', CAST(0x0000A39200BC6017 AS DateTime), CAST(0x0000A39200BC6017 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'df949eee-d517-4395-beed-dac8dcbbce40', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39C009DA688 AS DateTime), CAST(0x0000A39C009DA688 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a1ba4456-d5aa-4ac1-9a6c-daf5db157c76', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B00B20045 AS DateTime), CAST(0x0000A39B00B20045 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'db2af825-5a77-46d1-9a4d-dc1d2f5402b6', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C83429 AS DateTime), CAST(0x0000A39B00C83429 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd020d503-4487-48d0-ba5f-dc2f113372ba', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C8519E AS DateTime), CAST(0x0000A39B00C8519E AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'352223e9-6530-4417-98a4-dc452ff61be3', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009B8B8A AS DateTime), CAST(0x0000A38B009B8B8A AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'90d30ba5-4eb2-4b5a-a68c-dc7393c4f291', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'INSERT', CAST(0x0000A39C00D0C4AB AS DateTime), CAST(0x0000A39C00D0C4AB AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c4b62a3b-0f5b-4228-9548-dc9e90b516a2', N'6017f844-b0c2-4fa8-897a-8d5cfaff94ef', N'PAGE', N'INSERT', CAST(0x0000A38E0113C8CF AS DateTime), CAST(0x0000A38E0113C8CF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'afdf2cd8-b758-4785-9bb2-dd0b77564b7b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A3A9010B79CD AS DateTime), CAST(0x0000A3A9010B79CD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0c125bb6-f212-46af-8251-dd707857316a', N'ff036b8c-8e9e-4646-8a0a-8ed084f93d94', N'MEDIAFOLDER', N'UPDATE', CAST(0x0000A39D009734B7 AS DateTime), CAST(0x0000A39D009734B7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'75e9c6a7-76c4-43a2-b1af-dd7ac3d7670d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00AE9D7D AS DateTime), CAST(0x0000A39B00AE9D7D AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'868cc364-1d8e-4f7e-8b6c-dd7b94967390', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D01092BA8 AS DateTime), CAST(0x0000A38D01092BA8 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f8b3242-6683-496f-bd3f-de414d7dcbc1', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39A00FDC96A AS DateTime), CAST(0x0000A39A00FDC96A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'808ad37f-b611-44d6-844e-ded7ff71a88f', N'5be762ce-7944-4ae8-90f4-41a9b5a27546', N'PAGE', N'INSERT', CAST(0x0000A38C011552D7 AS DateTime), CAST(0x0000A38C011552D7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7377f67b-e383-4f7a-8bec-df6cafbb489b', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'INSERT', CAST(0x0000A38B009898A0 AS DateTime), CAST(0x0000A38B009898A0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ec0d009-9a9a-4da5-ba28-dfacf6af1633', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'PUBLISH', CAST(0x0000A38E0120A2FE AS DateTime), CAST(0x0000A38E0120A2FE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c182b877-6036-4476-8668-dfae74c35fd0', N'ce9654a6-bee4-4315-aaa2-ffad1af12ea8', N'CONTENT', N'UPDATE', CAST(0x0000A39D009876BF AS DateTime), CAST(0x0000A39D009876BF AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c90f7318-d579-47ab-ab1d-e048ba03f7a3', N'de265da8-53e5-4c3e-98e0-7a71c08e55af', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099D301 AS DateTime), CAST(0x0000A39D0099D301 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f44336a6-7fa6-4903-abd7-e04a12af577f', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012D4313 AS DateTime), CAST(0x0000A38E012D4313 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c5b5ce8-85e0-47c2-b609-e0c993cc01b2', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A38D010914AA AS DateTime), CAST(0x0000A38D010914AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b5f035ec-2150-497b-b73f-e0ccf5502765', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00D983F6 AS DateTime), CAST(0x0000A38D00D983F6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8faaf072-b7ac-4c52-84d5-e10c08047482', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00A333CE AS DateTime), CAST(0x0000A38B00A333CE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'72876827-50ac-4423-b41e-e10cc068ebbd', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A39B00A2A005 AS DateTime), CAST(0x0000A39B00A2A005 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'38353a12-5137-4bb6-9347-e11009cd6029', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39B00C775D3 AS DateTime), CAST(0x0000A39B00C775D3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7e527038-80de-4ba1-9bcb-e128dc616665', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A395011883BE AS DateTime), CAST(0x0000A395011883BE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6b20211e-0ea5-4898-b806-e1eb98badc4a', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39900DEF36B AS DateTime), CAST(0x0000A39900DEF36B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'fed1392b-faac-4ca2-9f29-e25edc4cce0e', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'PUBLISH', CAST(0x0000A3A9010B79E0 AS DateTime), CAST(0x0000A3A9010B79E0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8dea48df-e56d-44d0-9516-e2f1311063cd', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DE987A AS DateTime), CAST(0x0000A39900DE987A AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'24f1c219-630f-44bb-a449-e2f366e5ccb2', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'PUBLISH', CAST(0x0000A39C00E37CE1 AS DateTime), CAST(0x0000A39C00E37CE2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'557ad05e-031a-47d6-a616-e48a2251738f', N'747b1318-4f07-48e9-94f2-58cb61640eae', N'PAGETEMPLATE', N'INSERT', CAST(0x0000A38E0112B65D AS DateTime), CAST(0x0000A38E0112B65D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'73604955-ed61-456d-bdda-e4954a514c45', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'DEPUBLISH', CAST(0x0000A39C00CBD37F AS DateTime), CAST(0x0000A39C00CBD37F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2639a415-1f42-4fc3-afd6-e4a1bdf62ef5', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B009898AE AS DateTime), CAST(0x0000A38B009898AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'184d2fa0-06f9-42a4-a74d-e5423c920fd0', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'UPDATE', CAST(0x0000A3880125D7DA AS DateTime), CAST(0x0000A3880125D7DA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'49c86614-1882-4c35-a30c-e547c41bdcda', N'2d4ba93c-cdae-40de-9fad-e816b52e88b6', N'CONTENT', N'INSERT', CAST(0x0000A39D0099BB33 AS DateTime), CAST(0x0000A39D0099BB33 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8c61795c-3ebf-4134-8c2b-e55e8ffa2eea', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'PUBLISH', CAST(0x0000A388011D98E9 AS DateTime), CAST(0x0000A388011D98E9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd8919005-97ba-457a-b057-e59c7cbce671', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F6839 AS DateTime), CAST(0x0000A38B008F6839 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c2f013e6-938a-4c12-aaa2-e5e66d4f6182', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'INSERT', CAST(0x0000A38B008EDF35 AS DateTime), CAST(0x0000A38B008EDF35 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'105fd3ff-7f00-450c-9041-e61973153088', N'1248b2e6-451c-4b1a-ae0d-44718231ff35', N'CATEGORY', N'INSERT', CAST(0x0000A38B008E5654 AS DateTime), CAST(0x0000A38B008E5654 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ff8b4052-48e1-4de7-b43b-e63907fc2e4d', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A3880103ECE4 AS DateTime), CAST(0x0000A3880103ECE4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3869240a-26d0-4b26-82d2-e6ea84134a58', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A3A900F0B3F7 AS DateTime), CAST(0x0000A3A900F0B3F7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd5d4bc27-6c90-4fec-b473-e708bf87a785', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A37A00B2DEA3 AS DateTime), CAST(0x0000A37A00B2DEA3 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'2983d535-5d59-4af3-a7c1-e71527c3b46f', N'965fba5d-f763-4b06-b05a-585831954b8a', N'CONTENT', N'INSERT', CAST(0x0000A39C00BAEE08 AS DateTime), CAST(0x0000A39C00BAEE08 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'458c9395-a452-4925-b77e-e78f7a1cb28c', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39C00C2B597 AS DateTime), CAST(0x0000A39C00C2B597 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'463152ce-f696-4431-9102-e79e575d5013', N'0a63c1bd-c6e7-4f7d-a68e-7fe6b19a5047', N'CATEGORY', N'UPDATE', CAST(0x0000A38B008E4ED2 AS DateTime), CAST(0x0000A38B008E4ED2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'3ea4043f-f4c5-4768-ad80-e86174260453', N'792d011f-fbef-4159-ae85-1e29065b73cb', N'PAGE', N'UPDATE', CAST(0x0000A3AA00AA84C9 AS DateTime), CAST(0x0000A3AA00AA84C9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4f5a3afd-d27a-4670-8c43-e8df942e5985', N'5a0d6307-f041-41a1-b63a-563e712f3b8c', N'SYSPARAM', N'UPDATE', CAST(0x0000A37900FD82EA AS DateTime), CAST(0x0000A37900FD82EA AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c8f51a18-658e-40b4-848d-e90f7d7bfbe3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'INSERT', CAST(0x0000A38801231885 AS DateTime), CAST(0x0000A38801231885 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e284a679-4d66-47f1-bd96-e9549a76b2d3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39200BFB94F AS DateTime), CAST(0x0000A39200BFB94F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'12830633-c1cd-4aa3-b271-e9c275e6093f', N'd019864e-3e69-4eaa-b6df-69894bd32c2f', N'PAGE', N'DEPUBLISH', CAST(0x0000A39200BFD5B6 AS DateTime), CAST(0x0000A39200BFD5B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'94a2140b-48b6-4632-9a38-e9c62c259f14', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008EDF3E AS DateTime), CAST(0x0000A38B008EDF3E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1db8de3e-3c56-4b4f-9927-ea1f1bd2bb48', N'8dc59bd9-345f-4a67-a5b5-a11b9af84a33', N'CONTENT', N'UPDATE', CAST(0x0000A39C00BB094D AS DateTime), CAST(0x0000A39C00BB094D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7d58f9b9-dc3e-496c-ba0a-eaf1fe6af317', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5FA33 AS DateTime), CAST(0x0000A38C00E5FA33 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'98d7a00f-1052-4324-9114-eb3821e10f78', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'PUBLISH', CAST(0x0000A39C00FB252F AS DateTime), CAST(0x0000A39C00FB252F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'55ba221d-2adf-42f7-aab5-eb64f5c09051', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39501185839 AS DateTime), CAST(0x0000A39501185839 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'7aff3b6e-b72f-4ea5-8fdd-ece5ab4d3dd3', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39B0122A83F AS DateTime), CAST(0x0000A39B0122A83F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c7a2ee6-c308-4f7d-ba8e-ecfb72c5411c', N'd9e0baea-32eb-4bd2-9982-db85641cc24f', N'CONTENT', N'UPDATE', CAST(0x0000A38B008F6837 AS DateTime), CAST(0x0000A38B008F6837 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f123a175-fee8-4107-9370-ed8e0fc49581', N'd90a7559-7779-4edf-8c7d-c720fa710365', N'PAGE', N'DELETE', CAST(0x0000A39500FC07E7 AS DateTime), CAST(0x0000A39500FC07E7 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f7ba7c77-c5e7-4c34-9ab5-edc4031342e6', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'UPDATE', CAST(0x0000A39A00962FB6 AS DateTime), CAST(0x0000A39A00962FB6 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f10e9bea-0f99-4092-86b6-edce74199ee5', N'76fcd0d5-2c6a-4edb-b62b-fe2a9742b3d0', N'CONTENT', N'UPDATE', CAST(0x0000A39D0099EB29 AS DateTime), CAST(0x0000A39D0099EB29 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e392155e-82f7-4ddd-b9d4-ee1199b107c7', N'b94eed28-b5bb-4502-a89f-2ef1a4c4cd29', N'CONTENT', N'INSERT', CAST(0x0000A39200BC52B6 AS DateTime), CAST(0x0000A39200BC52B6 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8abbdf9a-443d-4216-95f0-ee6cc2c378d8', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'UPDATE', CAST(0x0000A39D009A8343 AS DateTime), CAST(0x0000A39D009A8343 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e4b849d0-0c2e-404d-8cfc-eed0dff377f7', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'INSERT', CAST(0x0000A39B0121DF95 AS DateTime), CAST(0x0000A39B0121DF95 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4cc4fe3e-ba9b-4746-9ed6-eeee762ff3e5', N'3e9e83bd-0b7f-49ea-833e-9562ac4b1a8d', N'PAGE', N'INSERT', CAST(0x0000A38C010712E7 AS DateTime), CAST(0x0000A38C010712E7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c03297e3-03ac-495e-bd8f-eef41e6c041b', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00EB5198 AS DateTime), CAST(0x0000A38D00EB5198 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1b444fd3-7d19-41ac-a006-ef2b4031cb21', N'ef383588-cbfd-4036-aa17-5176272d8ac2', N'PAGE', N'UPDATE', CAST(0x0000A38C010D05BC AS DateTime), CAST(0x0000A38C010D05BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'16175d66-b9da-4cb1-b6db-ef3e420dfe55', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39C00C2C690 AS DateTime), CAST(0x0000A39C00C2C690 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4581fc2d-5c56-4e64-865e-efc8fc63fd67', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39D0099EEDA AS DateTime), CAST(0x0000A39D0099EEDA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'40b301db-cbc4-487e-a9e1-efd3c0ecafc6', N'ed965a13-a99d-467f-b9b8-faad61779ad9', N'PAGE', N'UPDATE', CAST(0x0000A38D00DD3510 AS DateTime), CAST(0x0000A38D00DD3510 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b25e0463-a19c-419a-8fb2-eff03880ddf2', N'acb941c9-1f17-42a3-8853-161891686f49', N'PAGE', N'UPDATE', CAST(0x0000A388010C360B AS DateTime), CAST(0x0000A388010C360B AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a13174cc-6e3d-4a4a-ae06-f0bddd0a815e', N'd083cdcd-e6f1-4581-8c8f-357ef408bc12', N'CONTENT', N'DELETE', CAST(0x0000A38B009888AE AS DateTime), CAST(0x0000A38B009888AE AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0b516aff-dc43-4860-8185-f0f1d2f9ec40', N'f6f01c7f-77bb-45fe-b74d-c8721c5c7648', N'PAGE', N'PUBLISH', CAST(0x0000A3880125F881 AS DateTime), CAST(0x0000A3880125F881 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'001b60f7-797f-4ee3-b30b-f1aca96c048c', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010682A7 AS DateTime), CAST(0x0000A38D010682A7 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a0ff9b25-bc8f-4855-a711-f254db4488a9', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A38D010914AA AS DateTime), CAST(0x0000A38D010914AA AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b888bb7e-cde2-48e5-b792-f2b6371bcae3', N'd6bef08a-d8d7-4bf9-b19c-a58cf1b9d3ee', N'PAGE', N'PUBLISH', CAST(0x0000A39C00C2AD40 AS DateTime), CAST(0x0000A39C00C2AD40 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c1b4f8a2-7a1d-4470-98a6-f2b7f08cab4e', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'PUBLISH', CAST(0x0000A393011A2320 AS DateTime), CAST(0x0000A393011A2320 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'd22f07fc-a80a-4e23-aade-f3d14ca36189', N'3eb74150-eac4-4819-b5f3-b29a95764943', N'CONTENT', N'UPDATE', CAST(0x0000A38B00C28F3F AS DateTime), CAST(0x0000A38B00C28F3F AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'c086786f-e440-4a3d-8e2c-f44d70cf5699', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39900DEE208 AS DateTime), CAST(0x0000A39900DEE208 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'910b7749-cc60-4ebe-91e5-f4e54dcb01ea', N'aea05fa9-e3f1-4f24-9bad-27e09794827c', N'CONTENT', N'UPDATE', CAST(0x0000A39C00ADEC71 AS DateTime), CAST(0x0000A39C00ADEC71 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6775b983-0d1d-4f1a-8016-f53507429879', N'f0218392-1d83-4c42-bf99-a0dc1b70a9ee', N'PAGE', N'DELETE', CAST(0x0000A38C0116F9D3 AS DateTime), CAST(0x0000A38C0116F9D3 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'e74da9d0-3556-4ef7-8074-f652b43abadd', N'1194edb8-0a8b-47a9-8df4-8c2d30e37275', N'CONTENT', N'UPDATE', CAST(0x0000A39C00ACA5B9 AS DateTime), CAST(0x0000A39C00ACA5B9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'1a8f1f56-b9bc-4a94-be10-f69c4926ff48', N'f5442c77-af8f-44c8-881c-d435e0b553c6', N'CONTENT', N'DELETE', CAST(0x0000A39D00970B2F AS DateTime), CAST(0x0000A39D00970B2F AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'f26e6bef-1b7b-4b4a-b188-f6b506ccf7f3', N'2680b97a-2bec-413a-aa71-43e6dac0e269', N'CONTENT', N'INSERT', CAST(0x0000A39C00BFAC51 AS DateTime), CAST(0x0000A39C00BFAC51 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'ace84db8-ac5c-4814-b27f-f6de0eee12e0', N'15f4969f-3a1e-4eda-a996-662bda5bd7a4', N'PAGE', N'PUBLISH', CAST(0x0000A39C00E47327 AS DateTime), CAST(0x0000A39C00E47327 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'4fe1ac42-0981-46ac-96d0-f70ec1dd3d28', N'de265da8-53e5-4c3e-98e0-7a71c08e55af', N'CONTENT', N'INSERT', CAST(0x0000A39D0099D301 AS DateTime), CAST(0x0000A39D0099D301 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'044ef7dd-36fb-49d3-9134-f7f9949978ef', N'74d9ec6a-f696-48c2-9d67-14c0954e3ec2', N'CONTENT', N'INSERT', CAST(0x0000A39B0121DFA4 AS DateTime), CAST(0x0000A39B0121DFA4 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'a3fbe88a-16de-4650-bbc0-f817150f3bf0', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'DEPUBLISH', CAST(0x0000A3880101F88D AS DateTime), CAST(0x0000A3880101F88D AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'8d18ba69-ff40-4933-8710-f833b472c178', N'06ca675f-3118-489d-ac25-c4bd09a0bfde', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38E012CB5A8 AS DateTime), CAST(0x0000A38E012CB5A9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0f8de69f-3852-446f-a3be-f8372b5d2311', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A393011A16BC AS DateTime), CAST(0x0000A393011A16BD AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'94e7344b-edbe-40ba-ad9e-f9614cb11627', N'0b7eb43b-a37d-40e8-a0c0-69c08f3f3ef3', N'PAGE', N'UPDATE', CAST(0x0000A38C00E5DE05 AS DateTime), CAST(0x0000A38C00E5DE05 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'b824bfa5-d4ed-436f-b7aa-f9e0a219e59d', N'9a96684c-18fa-4d63-9aad-e44a6a3a4a14', N'PAGE', N'PUBLISH', CAST(0x0000A39B00C97E21 AS DateTime), CAST(0x0000A39B00C97E21 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'6c8b731d-ee00-4be0-961b-faadf68b8b01', N'965fba5d-f763-4b06-b05a-585831954b8a', N'CONTENT', N'INSERT', CAST(0x0000A39C00BAEDF9 AS DateTime), CAST(0x0000A39C00BAEDF9 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'27977128-d64e-4046-856e-fb64dfea418b', N'39c49ab9-091c-49d6-b330-80d5046ebb58', N'PAGETEMPLATE', N'DELETE', CAST(0x0000A39B00D3CBFE AS DateTime), CAST(0x0000A39B00D3CBFE AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'cdcb07de-c2c2-49e8-a744-fb90c053c3c7', N'20b20f74-dcc1-42c9-9f74-72ea2ba304de', N'PAGE', N'UPDATE', CAST(0x0000A3880125A7BC AS DateTime), CAST(0x0000A3880125A7BC AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'0e162a4c-279f-450a-b16b-fbcb691a07c5', N'a9b22f47-aa50-41ef-a59d-4b6688577973', N'PAGE', N'INSERT', CAST(0x0000A38800BFFF2E AS DateTime), CAST(0x0000A38800BFFF2E AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'47e54c09-6ce3-4b5e-950b-fc63260988ac', N'2c78b6ec-30d1-4e62-a2e2-9d453a02d9db', N'PAGE', N'UPDATE', CAST(0x0000A39D0098EB59 AS DateTime), CAST(0x0000A39D0098EB59 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'bb1523bb-551b-48be-95f1-fd69932e1d51', N'7373e982-b97d-4002-93c2-63104e626b39', N'PAGE', N'INSERT', CAST(0x0000A38E0113E7E2 AS DateTime), CAST(0x0000A38E0113E7E2 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'111045f5-69e6-4249-9042-fe7df792ba66', N'5a156e99-f961-4b23-92f0-592c89299466', N'PAGETEMPLATE', N'UPDATE', CAST(0x0000A38600A694D0 AS DateTime), CAST(0x0000A38600A694D0 AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[syslog] ([syslog_id], [syslog_parent_id], [syslog_parent_type], [syslog_action], [syslog_created], [syslog_updated], [syslog_created_by], [syslog_updated_by]) VALUES (N'541fc59b-b8b3-49f4-a787-ff90948b96ff', N'23d20863-94fb-43e8-8138-1332e5784a3f', N'PAGE', N'INSERT', CAST(0x0000A38C01073E0C AS DateTime), CAST(0x0000A38C01073E0C AS DateTime), N'a058c673-39bb-459c-9f28-d93545cec7be', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'08e8a582-7825-43b2-a12d-2522889f04be', N'IMAGE_MAX_WIDTH', N'2048', N'Maximum width for uploaded images.', 1, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A39D0096A071 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'4c694949-dee0-465e-ab08-253927bdcbd8', N'SITE_PRIVATE_KEY', N'CE03A696D4C24918', N'The private key used for public key encryption.', 1, CAST(0x0000A37900CAEEC1 AS DateTime), CAST(0x0000A37900CAEEC1 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'c08b1891-aba2-4e0d-ad61-2abdfba81a59', N'CACHE_PUBLIC_EXPIRES', N'0', N'How many minutes browsers are allowed to cache public content.', 1, CAST(0x0000A37900CAEEBE AS DateTime), CAST(0x0000A37900CAEEBE AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'5a0d6307-f041-41a1-b63a-563e712f3b8c', N'HIERARCHICAL_PERMALINKS', N'1', N'Weather or not permalink generation should be hierarchical.', 1, CAST(0x0000A37900CAEE64 AS DateTime), CAST(0x0000A37900FD82E8 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'48bdf688-ba95-46b4-91c7-6a8430f387ff', N'CACHE_PUBLIC_MAXAGE', N'0', N'How many minutes cached content is valid in the browser.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'cf06bf4c-c426-4047-8e5e-6e0082aaf1bf', N'SITE_LAST_MODIFIED', N'Sep 18 2014 11:43AM', N'Global last modification date.', 1, CAST(0x0000A37900CAEEBE AS DateTime), CAST(0x0000A37900CAEEBE AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'095502dd-d655-4001-86f9-97d18222a548', N'SITEMAP_EXPANDED_LEVELS', N'0', N'The number of pre-expanded levels in the manager panel for the page list.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'a64a8479-8125-47ba-9980-b30b36e744d3', N'RSS_USE_EXCERPT', N'1', N'Weather to use an excerpt in the feeds or export the full content.', 1, CAST(0x0000A37900CAEEC0 AS DateTime), CAST(0x0000A37900CAEEC0 AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'40230360-71ce-441e-a8df-d50cfa79acc2', N'RSS_NUM_POSTS', N'10', N'The maximum number posts to be exported in a feed. For an infinite amount of posts, use the value 0.', 1, CAST(0x0000A37900CAEEBF AS DateTime), CAST(0x0000A37900CAEEBF AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysparam] ([sysparam_id], [sysparam_name], [sysparam_value], [sysparam_description], [sysparam_locked], [sysparam_created], [sysparam_updated], [sysparam_created_by], [sysparam_updated_by]) VALUES (N'9a14664f-806d-4a4f-9a72-e8368fb358d5', N'SITE_VERSION', N'32', N'The currently installed version of Piranha.', 1, CAST(0x0000A37900CAEEBB AS DateTime), CAST(0x0000A37900CAEEBB AS DateTime), N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'ca19d4e7-92f0-42f6-926a-68413bbdafbc')
GO
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'ca19d4e7-92f0-42f6-926a-68413bbdafbc', N'fe868d4f-797c-4e60-b876-64e6fc2424aa', N'sys', NULL, NULL, NULL, NULL, N'7c536b66-d292-4369-8f37-948b32229b83', NULL, NULL, NULL, 0, NULL, CAST(0x0000A37900CAEEB3 AS DateTime), CAST(0x0000A37900CAEEB3 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'0da356f4-4774-4ea1-adb3-92071edbf905', NULL, N'svanelten', N'Y3mDGLMjneul5AqD46g3G/mI3j5wO3JhfkpIMWh4JKE=', NULL, NULL, N'sve@gravitydesign.de', N'7c536b66-d292-4369-8f37-948b32229b83', NULL, CAST(0x0000A3A00093BA41 AS DateTime), CAST(0x0000A39C00C73D79 AS DateTime), 0, NULL, CAST(0x0000A37900CAF36D AS DateTime), CAST(0x0000A3A00093BA42 AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'0da356f4-4774-4ea1-adb3-92071edbf905')
GO
INSERT [dbo].[sysuser] ([sysuser_id], [sysuser_apikey], [sysuser_login], [sysuser_password], [sysuser_firstname], [sysuser_surname], [sysuser_email], [sysuser_group_id], [sysuser_culture], [sysuser_last_login], [sysuser_prev_login], [sysuser_locked], [sysuser_locked_until], [sysuser_created], [sysuser_updated], [sysuser_created_by], [sysuser_updated_by]) VALUES (N'a058c673-39bb-459c-9f28-d93545cec7be', NULL, N'joinmedia', N'lDlVcaIuOE//2t1okvjvu2t+1xPLfQ1TGyDxkd9pJiQ=', N'Johnny', N'Media', N'dz@joinmedia.de', N'7c536b66-d292-4369-8f37-948b32229b83', NULL, CAST(0x0000A3AA00C2CA3A AS DateTime), CAST(0x0000A3AA00B4AFEC AS DateTime), 0, NULL, CAST(0x0000A38500B29BE2 AS DateTime), CAST(0x0000A3AA00C2CA3B AS DateTime), N'0da356f4-4774-4ea1-adb3-92071edbf905', N'a058c673-39bb-459c-9f28-d93545cec7be')
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__comment__comment__04E4BC85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_parent_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__comment__comment__05D8E0BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_status]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__comment__comment__06CD04F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_reported_count]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__content__content__73BA3083]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((1)) FOR [content_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__content__content__74AE54BC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_size]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__content__content__75A278F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_image]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__content__content__76969D2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_folder]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__extension__exten__00200768]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[extension] ADD  DEFAULT ((1)) FOR [extension_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__page__page_draft__52593CB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__page__page_seqno__534D60F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_seqno]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__page__page_is_hi__5441852A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[page] ADD  DEFAULT ((0)) FOR [page_is_hidden]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3A81B327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_controller_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3B75D760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_view_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3C69FB99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_redirect_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__pagetempl__paget__3D5E1FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_site_template]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__post__post_draft__6C190EBB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__post__post_rss__6D0D32F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_rss]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__4222D4EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_controller_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__4316F928]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_view_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__440B1D61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_archive_controller_show]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__posttempl__postt__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((1)) FOR [posttemplate_rss]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__property__proper__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[property] ADD  DEFAULT ((1)) FOR [property_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__region__region_d__5FB337D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__region__region_p__60A75C0F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_page_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__regiontem__regio__5AEE82B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[regiontemplate] ADD  DEFAULT ((1)) FOR [regiontemplate_seqno]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__relation__relati__4F7CD00D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[relation] ADD  DEFAULT ((1)) FOR [relation_draft]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__sysaccess__sysac__21B6055D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysaccess] ADD  DEFAULT ((0)) FOR [sysaccess_locked]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__sysparam__syspar__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysparam] ADD  DEFAULT ((0)) FOR [sysparam_locked]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__sysuser__sysuser__1B0907CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[sysuser] ADD  DEFAULT ((0)) FOR [sysuser_locked]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_created_by] FOREIGN KEY([category_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_permalink_id] FOREIGN KEY([category_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_permalink_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_updated_by] FOREIGN KEY([category_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_category_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[category]'))
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_created_by] FOREIGN KEY([comment_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_updated_by] FOREIGN KEY([comment_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_comment_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[comment]'))
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_created_by] FOREIGN KEY([content_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_permalink_id] FOREIGN KEY([content_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_permalink_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_updated_by] FOREIGN KEY([content_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_content_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[content]'))
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_created_by] FOREIGN KEY([extension_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_updated_by] FOREIGN KEY([extension_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_extension_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[extension]'))
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_created_by] FOREIGN KEY([namespace_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_updated_by] FOREIGN KEY([namespace_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_namespace_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[namespace]'))
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_created_by] FOREIGN KEY([page_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_permalink_id] FOREIGN KEY([page_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_permalink_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_template_id] FOREIGN KEY([page_template_id])
REFERENCES [dbo].[pagetemplate] ([pagetemplate_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_template_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_updated_by] FOREIGN KEY([page_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_page_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[page]'))
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_created_by] FOREIGN KEY([pagetemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_updated_by] FOREIGN KEY([pagetemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_pagetemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[pagetemplate]'))
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_permalink_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[permalink]'))
ALTER TABLE [dbo].[permalink]  WITH CHECK ADD  CONSTRAINT [fk_permalink_namespace_id] FOREIGN KEY([permalink_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_permalink_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[permalink]'))
ALTER TABLE [dbo].[permalink] CHECK CONSTRAINT [fk_permalink_namespace_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_created_by] FOREIGN KEY([post_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_permalink_id] FOREIGN KEY([post_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_permalink_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_template_id] FOREIGN KEY([post_template_id])
REFERENCES [dbo].[posttemplate] ([posttemplate_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_template_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_template_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_updated_by] FOREIGN KEY([post_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_post_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[post]'))
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_created_by] FOREIGN KEY([posttemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_permalink_id] FOREIGN KEY([posttemplate_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_permalink_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_permalink_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_updated_by] FOREIGN KEY([posttemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_posttemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[posttemplate]'))
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_created_by] FOREIGN KEY([property_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_updated_by] FOREIGN KEY([property_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_property_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[property]'))
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_created_by] FOREIGN KEY([region_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_page_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_page_id] FOREIGN KEY([region_page_id], [region_page_draft])
REFERENCES [dbo].[page] ([page_id], [page_draft])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_page_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_page_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_regiontemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_regiontemplate] FOREIGN KEY([region_regiontemplate_id])
REFERENCES [dbo].[regiontemplate] ([regiontemplate_id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_regiontemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_regiontemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_updated_by] FOREIGN KEY([region_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_region_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[region]'))
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_created_by] FOREIGN KEY([regiontemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_updated_by] FOREIGN KEY([regiontemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_regiontemplate_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[regiontemplate]'))
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_created_by] FOREIGN KEY([sitetree_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_namespace_id] FOREIGN KEY([sitetree_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_namespace_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_namespace_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_updated_by] FOREIGN KEY([sitetree_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sitetree_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sitetree]'))
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_created_by] FOREIGN KEY([sysaccess_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_updated_by] FOREIGN KEY([sysaccess_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysaccess_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysaccess]'))
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_created_by] FOREIGN KEY([sysgroup_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_updated_by] FOREIGN KEY([sysgroup_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysgroup_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysgroup]'))
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_created_by] FOREIGN KEY([syslog_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_updated_by] FOREIGN KEY([syslog_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_syslog_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[syslog]'))
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_created_by] FOREIGN KEY([sysparam_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_updated_by] FOREIGN KEY([sysparam_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_sysparam_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[sysparam]'))
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_updated_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_created_by] FOREIGN KEY([upload_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_created_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_created_by]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_updated_by] FOREIGN KEY([upload_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_upload_updated_by]') AND parent_object_id = OBJECT_ID(N'[dbo].[upload]'))
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_updated_by]
GO
