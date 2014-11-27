﻿SEMANTIC LOGGING APPLICATION BLOCK (SLAB) PRE-RELEASE
http://slab.codeplex.com

This is a pre-release version. It is meant for developers to try out new features or bug fixes ahead of an official release. 
We strongly urge you to only use official builds for production. The latest official release is available at http://msdn.microsoft.com/entlib and via NuGet.

Summary: The Semantic Logging Application Block provides a set of destinations (sinks) to persist application events published using a subclass of the EventSource class from the System.Diagnostics.Tracing namespace. Sinks include Windows Azure table storage, SQL Server databases, and rolling files with several formats and you can extend the block by creating your own custom formatters and sinks. For the those sinks that can store structured data, the block preserves the full structure of the event payload in order to facilitate analyzing or processing the logged data.

An out-of-proc Windows Service is available as a separate NuGet package (EnterpriseLibrary.SemanticLogging.Service).

The SQL Server setup scripts for using with the SQL Server sink is available inside this package at: $(SolutionDir)\packages\EnterpriseLibrary.SemanticLogging.Database.1.0.1304.0\scripts\

Microsoft patterns & practices
http://microsoft.com/practices
