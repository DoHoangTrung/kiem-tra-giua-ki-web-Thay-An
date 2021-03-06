USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 5/3/2021 5:30:18 PM ******/
CREATE DATABASE [ShopOnline]

USE [ShopOnline]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[nameLogin] [varchar](200) NOT NULL,
	[passWord] [varchar](100) NULL,
	[typeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nameLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[address] [varchar](200) NULL,
	[phone] [char](10) NULL,
	[email] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idOrderStatus] [int] NULL,
	[paidDate] [datetime] NULL,
	[idCustomer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentInfo]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentInfo](
	[idPayment] [int] NULL,
	[idProduct] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter table Product add textInfo nvarchar(1000)
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[supplier] [varchar](200) NULL,
	[productTypeId] [int] NULL,
	[img0] [varchar](100) NULL,
	[img1] [varchar](100) NULL,
	[img2] [varchar](100) NULL,
	textInfo nvarchar(1000) null,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 5/3/2021 5:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([nameLogin], [passWord], [typeId]) VALUES (N'admin ', N'123456', 1)
INSERT [dbo].[Account] ([nameLogin], [passWord], [typeId]) VALUES (N'user', N'123456', 2)
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[AccountType] ([id], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [quantity], [price], [supplier], [productTypeId], [img0], [img1], [img2]) VALUES (1, N'aoDo', 1, CAST(300000 AS Decimal(18, 0)), NULL, 1, N'do0.jpg', N'do1.jpg', N'do2.jpg')
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [supplier], [productTypeId], [img0], [img1], [img2]) VALUES (2, N'aoTrang', 1, CAST(400000 AS Decimal(18, 0)), NULL, 1, N'trang0.jpg', N'trang1.jpg', N'trang2.jpg')
INSERT [dbo].[Product] ([id], [name], [quantity], [price], [supplier], [productTypeId], [img0], [img1], [img2]) VALUES (3, N'quanDen', 1, CAST(500000 AS Decimal(18, 0)), NULL, 2, N'quanDen0.jpg', N'quanDen1.jpg', N'quanDen2.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([id], [name]) VALUES (1, N'ao')
INSERT [dbo].[ProductType] ([id], [name]) VALUES (2, N'quan')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [price]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[AccountType] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([idOrderStatus])
REFERENCES [dbo].[OrderStatus] ([id])
GO
ALTER TABLE [dbo].[PaymentInfo]  WITH CHECK ADD FOREIGN KEY([idPayment])
REFERENCES [dbo].[Payment] ([id])
GO
ALTER TABLE [dbo].[PaymentInfo]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([productTypeId])
REFERENCES [dbo].[ProductType] ([id])
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO

-- proc check Login
create proc Login
	@userName varchar(200),
	@passWord varchar(100)
as
begin
	select count(*) 
	from Account
	where nameLogin = @userName and passWord = @passWord
end

