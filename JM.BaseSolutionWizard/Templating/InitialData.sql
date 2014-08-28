/****** Object:  Table [dbo].[category]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[comment]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[content]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[extension]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[namespace]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[page]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[pagetemplate]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[permalink]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[post]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[posttemplate]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[property]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[region]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[regiontemplate]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[relation]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[sitetree]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[sysaccess]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[sysgroup]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[syslog]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[sysparam]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[sysuser]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[upload]    Script Date: 27.08.2014 17:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_parent_draft]
GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_status]
GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT ((0)) FOR [comment_reported_count]
GO
ALTER TABLE [dbo].[content] ADD  DEFAULT ((1)) FOR [content_draft]
GO
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_size]
GO
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_image]
GO
ALTER TABLE [dbo].[content] ADD  DEFAULT ((0)) FOR [content_folder]
GO
ALTER TABLE [dbo].[extension] ADD  DEFAULT ((1)) FOR [extension_draft]
GO
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_draft]
GO
ALTER TABLE [dbo].[page] ADD  DEFAULT ((1)) FOR [page_seqno]
GO
ALTER TABLE [dbo].[page] ADD  DEFAULT ((0)) FOR [page_is_hidden]
GO
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_controller_show]
GO
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_view_show]
GO
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_redirect_show]
GO
ALTER TABLE [dbo].[pagetemplate] ADD  DEFAULT ((0)) FOR [pagetemplate_site_template]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_draft]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((1)) FOR [post_rss]
GO
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_controller_show]
GO
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_view_show]
GO
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((0)) FOR [posttemplate_archive_controller_show]
GO
ALTER TABLE [dbo].[posttemplate] ADD  DEFAULT ((1)) FOR [posttemplate_rss]
GO
ALTER TABLE [dbo].[property] ADD  DEFAULT ((1)) FOR [property_draft]
GO
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_draft]
GO
ALTER TABLE [dbo].[region] ADD  DEFAULT ((1)) FOR [region_page_draft]
GO
ALTER TABLE [dbo].[regiontemplate] ADD  DEFAULT ((1)) FOR [regiontemplate_seqno]
GO
ALTER TABLE [dbo].[relation] ADD  DEFAULT ((1)) FOR [relation_draft]
GO
ALTER TABLE [dbo].[sysaccess] ADD  DEFAULT ((0)) FOR [sysaccess_locked]
GO
ALTER TABLE [dbo].[sysparam] ADD  DEFAULT ((0)) FOR [sysparam_locked]
GO
ALTER TABLE [dbo].[sysuser] ADD  DEFAULT ((0)) FOR [sysuser_locked]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_created_by] FOREIGN KEY([category_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_created_by]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_permalink_id] FOREIGN KEY([category_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_permalink_id]
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [fk_category_updated_by] FOREIGN KEY([category_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [fk_category_updated_by]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_created_by] FOREIGN KEY([comment_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_created_by]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [fk_comment_updated_by] FOREIGN KEY([comment_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [fk_comment_updated_by]
GO
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_created_by] FOREIGN KEY([content_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_created_by]
GO
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_permalink_id] FOREIGN KEY([content_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_permalink_id]
GO
ALTER TABLE [dbo].[content]  WITH CHECK ADD  CONSTRAINT [fk_content_updated_by] FOREIGN KEY([content_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[content] CHECK CONSTRAINT [fk_content_updated_by]
GO
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_created_by] FOREIGN KEY([extension_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_created_by]
GO
ALTER TABLE [dbo].[extension]  WITH CHECK ADD  CONSTRAINT [fk_extension_updated_by] FOREIGN KEY([extension_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[extension] CHECK CONSTRAINT [fk_extension_updated_by]
GO
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_created_by] FOREIGN KEY([namespace_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_created_by]
GO
ALTER TABLE [dbo].[namespace]  WITH CHECK ADD  CONSTRAINT [fk_namespace_updated_by] FOREIGN KEY([namespace_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[namespace] CHECK CONSTRAINT [fk_namespace_updated_by]
GO
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_created_by] FOREIGN KEY([page_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_created_by]
GO
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_permalink_id] FOREIGN KEY([page_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_permalink_id]
GO
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_template_id] FOREIGN KEY([page_template_id])
REFERENCES [dbo].[pagetemplate] ([pagetemplate_id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_template_id]
GO
ALTER TABLE [dbo].[page]  WITH CHECK ADD  CONSTRAINT [fk_page_updated_by] FOREIGN KEY([page_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[page] CHECK CONSTRAINT [fk_page_updated_by]
GO
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_created_by] FOREIGN KEY([pagetemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_created_by]
GO
ALTER TABLE [dbo].[pagetemplate]  WITH CHECK ADD  CONSTRAINT [fk_pagetemplate_updated_by] FOREIGN KEY([pagetemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[pagetemplate] CHECK CONSTRAINT [fk_pagetemplate_updated_by]
GO
ALTER TABLE [dbo].[permalink]  WITH CHECK ADD  CONSTRAINT [fk_permalink_namespace_id] FOREIGN KEY([permalink_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
ALTER TABLE [dbo].[permalink] CHECK CONSTRAINT [fk_permalink_namespace_id]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_created_by] FOREIGN KEY([post_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_created_by]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_permalink_id] FOREIGN KEY([post_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_permalink_id]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_template_id] FOREIGN KEY([post_template_id])
REFERENCES [dbo].[posttemplate] ([posttemplate_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_template_id]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [fk_post_updated_by] FOREIGN KEY([post_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [fk_post_updated_by]
GO
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_created_by] FOREIGN KEY([posttemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_created_by]
GO
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_permalink_id] FOREIGN KEY([posttemplate_permalink_id])
REFERENCES [dbo].[permalink] ([permalink_id])
GO
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_permalink_id]
GO
ALTER TABLE [dbo].[posttemplate]  WITH CHECK ADD  CONSTRAINT [fk_posttemplate_updated_by] FOREIGN KEY([posttemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[posttemplate] CHECK CONSTRAINT [fk_posttemplate_updated_by]
GO
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_created_by] FOREIGN KEY([property_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_created_by]
GO
ALTER TABLE [dbo].[property]  WITH CHECK ADD  CONSTRAINT [fk_property_updated_by] FOREIGN KEY([property_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[property] CHECK CONSTRAINT [fk_property_updated_by]
GO
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_created_by] FOREIGN KEY([region_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_created_by]
GO
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_page_id] FOREIGN KEY([region_page_id], [region_page_draft])
REFERENCES [dbo].[page] ([page_id], [page_draft])
GO
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_page_id]
GO
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_regiontemplate] FOREIGN KEY([region_regiontemplate_id])
REFERENCES [dbo].[regiontemplate] ([regiontemplate_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_regiontemplate]
GO
ALTER TABLE [dbo].[region]  WITH CHECK ADD  CONSTRAINT [fk_region_updated_by] FOREIGN KEY([region_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [fk_region_updated_by]
GO
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_created_by] FOREIGN KEY([regiontemplate_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_created_by]
GO
ALTER TABLE [dbo].[regiontemplate]  WITH CHECK ADD  CONSTRAINT [fk_regiontemplate_updated_by] FOREIGN KEY([regiontemplate_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[regiontemplate] CHECK CONSTRAINT [fk_regiontemplate_updated_by]
GO
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_created_by] FOREIGN KEY([sitetree_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_created_by]
GO
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_namespace_id] FOREIGN KEY([sitetree_namespace_id])
REFERENCES [dbo].[namespace] ([namespace_id])
GO
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_namespace_id]
GO
ALTER TABLE [dbo].[sitetree]  WITH CHECK ADD  CONSTRAINT [fk_sitetree_updated_by] FOREIGN KEY([sitetree_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sitetree] CHECK CONSTRAINT [fk_sitetree_updated_by]
GO
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_created_by] FOREIGN KEY([sysaccess_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_created_by]
GO
ALTER TABLE [dbo].[sysaccess]  WITH CHECK ADD  CONSTRAINT [fk_sysaccess_updated_by] FOREIGN KEY([sysaccess_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysaccess] CHECK CONSTRAINT [fk_sysaccess_updated_by]
GO
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_created_by] FOREIGN KEY([sysgroup_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_created_by]
GO
ALTER TABLE [dbo].[sysgroup]  WITH CHECK ADD  CONSTRAINT [fk_sysgroup_updated_by] FOREIGN KEY([sysgroup_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysgroup] CHECK CONSTRAINT [fk_sysgroup_updated_by]
GO
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_created_by] FOREIGN KEY([syslog_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_created_by]
GO
ALTER TABLE [dbo].[syslog]  WITH CHECK ADD  CONSTRAINT [fk_syslog_updated_by] FOREIGN KEY([syslog_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[syslog] CHECK CONSTRAINT [fk_syslog_updated_by]
GO
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_created_by] FOREIGN KEY([sysparam_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_created_by]
GO
ALTER TABLE [dbo].[sysparam]  WITH CHECK ADD  CONSTRAINT [fk_sysparam_updated_by] FOREIGN KEY([sysparam_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[sysparam] CHECK CONSTRAINT [fk_sysparam_updated_by]
GO
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_created_by] FOREIGN KEY([upload_created_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_created_by]
GO
ALTER TABLE [dbo].[upload]  WITH CHECK ADD  CONSTRAINT [fk_upload_updated_by] FOREIGN KEY([upload_updated_by])
REFERENCES [dbo].[sysuser] ([sysuser_id])
GO
ALTER TABLE [dbo].[upload] CHECK CONSTRAINT [fk_upload_updated_by]
GO
