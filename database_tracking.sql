
/****** Object:  Table [dbo].[payment_gateway_transactions]    Script Date: 15/05/2023 5:50:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_gateway_transactions](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[request_id] [nvarchar](50) NOT NULL,
	[payment_reference_id] [nvarchar](50) NOT NULL,
	[merchant_ext_id] [nvarchar](20) NULL,
	[store_ext_id] [nvarchar](20) NULL,
	[payment_amount] [bigint] NOT NULL,
	[currency] [nvarchar](10) NULL,
	[return_url] [nvarchar](1000) NULL,
	[platform_type] [nvarchar](10) NULL,
	[expire_time] [bigint] NULL,
	[additional_info] [nvarchar](500) NULL,
	[promo_ids] [nvarchar](50) NULL,
	[rsp_redirect_url] [nvarchar](1000) NULL,
	[rsp_error_code] [int] NULL,
	[rsp_msg] [nvarchar](500) NULL,
	[created_date] [datetime] NOT NULL,
	[rsp_date] [datetime] NULL,
	[update_date] [datetime] NULL,
	[update_status] [int] NULL,
	[order_cancel_status] [int] NULL,
	[order_refund_status] [int] NULL,
	[cancel_at] [date] NULL,
	[refund_at] [date] NULL,
	[final_status] [int] NULL,
	[callback_msg] [nvarchar](500) NULL,
	[callback_status] [int] NULL,
	[partner_id] [int] NULL,
 CONSTRAINT [PK_payment_gateway_transactions] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_ADMIN_USERS]    Script Date: 15/05/2023 5:50:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ADMIN_USERS](
	[admin_user_id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[admin_user_name] [nvarchar](20) NOT NULL,
	[admin_user_password] [nvarchar](255) NOT NULL,
	[admin_user_email] [nvarchar](255) NOT NULL,
	[admin_user_fullname] [nvarchar](255) NOT NULL,
	[admin_user_status] [char](1) NOT NULL,
	[bcrypt_password] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_MERCHANTS]    Script Date: 15/05/2023 5:50:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_MERCHANTS](
	[merchant_id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[merchant_username] [nvarchar](20) NOT NULL,
	[merchant_password] [nvarchar](255) NOT NULL,
	[merchant_code] [nvarchar](20) NULL,
	[merchant_type] [char](1) NOT NULL,
	[merchant_name] [nvarchar](255) NOT NULL,
	[merchant_address1] [nvarchar](1000) NULL,
	[merchant_address2] [nvarchar](255) NULL,
	[merchant_address3] [nvarchar](255) NULL,
	[merchant_balance] [bigint] NOT NULL,
	[postal_code] [varchar](10) NOT NULL,
	[DEFAULT_RECEIPT_COMPANY_NAME] [nvarchar](255) NULL,
	[DEFAULT_RECEIPT_OUTLET_LOCATION] [nvarchar](255) NULL,
	[DEFAULT_RECEIPT_COMPANY_SLOGAN] [nvarchar](255) NULL,
	[CONTACT_TITLE] [nvarchar](255) NULL,
	[CONTACT_NAME] [nvarchar](255) NULL,
	[CONTACT_NUMBER] [varchar](255) NULL,
	[CONTACT_EXTENSION_NUMBER] [varchar](10) NULL,
	[CONTACT_FAX] [varchar](255) NULL,
	[BILLING_ADDRESS1] [nvarchar](255) NULL,
	[BILLING_ADDRESS2] [nvarchar](255) NULL,
	[BILLING_ADDRESS3] [nvarchar](255) NULL,
	[BILLING_POSTAL] [nvarchar](255) NULL,
	[register_person] [int] NOT NULL,
	[register_datetime] [datetime] NOT NULL,
	[update_person] [int] NOT NULL,
	[update_datetime] [datetime] NOT NULL,
	[merchant_status] [char](1) NULL,
	[remark] [varchar](255) NULL,
	[owner_by] [char](1) NOT NULL,
	[owner_id] [int] NULL,
	[saleman_id] [int] NULL,
	[REGISTER_BY] [char](1) NOT NULL,
	[UPDATE_BY] [char](1) NOT NULL,
	[payment_type] [int] NULL,
	[alert_amount] [int] NULL,
	[EMAIL] [varchar](255) NULL,
	[PASSWORD_REPORT] [varchar](255) NULL,
	[ACTIVATE] [int] NULL,
	[ip_list] [nvarchar](200) NULL,
	[is_check_ip] [int] NULL,
	[public_key] [varchar](1000) NULL,
	[public_key1] [varchar](1000) NULL,
	[authen_key] [varchar](50) NULL,
	[tax_code] [varchar](1000) NULL,
	[merchant_debt] [bigint] NULL,
	[bcrypt_password] [varchar](500) NULL,
	[callback_trans_url] [nvarchar](500) NULL,
 CONSTRAINT [PK__TBL_MERCHANTS__46E78A0C] PRIMARY KEY CLUSTERED 
(
	[merchant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracking_code_data]    Script Date: 15/05/2023 5:50:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracking_code_data](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[tracking_code] [nvarchar](50) NULL,
	[tracking_code_long_desc] [nvarchar](500) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_tracking_code_data] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracking_logs]    Script Date: 15/05/2023 5:50:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracking_logs](
	[row_id] [int] IDENTITY(1,1) NOT NULL,
	[order_code] [nvarchar](50) NULL,
	[order_reference_code] [nvarchar](50) NULL,
	[change_date] [datetime] NULL,
	[log_location] [nvarchar](500) NULL,
	[state_id] [int] NULL,
	[remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tracking_logs] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[payment_gateway_transactions] ON 
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (21, N'90010_221013101156.12388', N'90010_221013101156.12388', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1667473182912, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=Aunl0865a00b5f62f955&order_id=90011_221013101156.12388&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAmY2xpZW50X2lkPTEyMDAwMzY4JnJlZmVyZW5jZV9pZD05MDAxMV8yMjEwMTMxMDExNTYuMTIzODgmcmVzdWx0X2NvZGU9MjAxJnNpZ25hdHVyZT1sSGNXUlJUZnVwLVhPSDQ0TEZ6LVZOR0dES2ZIWDZZbExUX216eTl4UGJJJTNE&source=web', 0, N'success', CAST(N'2022-11-03T10:39:42.913' AS DateTime), CAST(N'2022-11-03T10:39:43.257' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (23, N'90011_221013101156.12387', N'90011_221013101156.12387', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1667474483786, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=KIRFab2275b658b6a59d&order_id=90011_221013101156.12387&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAmY2xpZW50X2lkPTEyMDAwMzY4JnJlZmVyZW5jZV9pZD05MDAxMV8yMjEwMTMxMDExNTYuMTIzODcmcmVzdWx0X2NvZGU9MjAxJnNpZ25hdHVyZT1RT2Y2RWdWZ01tUEV1LTc5d25pVzhBZ3hjelBBYWd4RzV3NDcxcUliR1BjJTNE&source=web', 0, N'success', CAST(N'2022-11-03T11:01:23.797' AS DateTime), CAST(N'2022-11-03T11:01:24.140' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (25, N'90011_221013101156.12386', N'90011_221013101156.12386', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', N'app', 1667474727218, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=dLRNc8ac8ea9f82cad9e&order_id=90011_221013101156.12386&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAmY2xpZW50X2lkPTEyMDAwMzY4JnJlZmVyZW5jZV9pZD05MDAxMV8yMjEwMTMxMDExNTYuMTIzODYmcmVzdWx0X2NvZGU9MjAxJnNpZ25hdHVyZT0wdDE1MDBDVjQ0eW40blA3X3dWUTBGLXRJTDZ3WXpNWDBFdGx3V2RHVGNjJTNE&source=web', 0, N'success', CAST(N'2022-11-03T11:05:27.237' AS DateTime), CAST(N'2022-11-03T11:05:27.597' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (26, N'90011_221013101156.12348', N'90011_221013101156.12348', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', NULL, 1670397505167, NULL, NULL, NULL, 1, N'unknown platform type', CAST(N'2022-12-07T06:58:25.163' AS DateTime), CAST(N'2022-12-07T06:58:25.680' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (28, N'90011_221013101156.12350', N'90011_221013101156.12350', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', N'web', 1670397600470, NULL, NULL, NULL, 1, N'unknown platform type', CAST(N'2022-12-07T07:00:00.450' AS DateTime), CAST(N'2022-12-07T07:00:00.760' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (29, N'90011_221013101156.12351', N'90011_221013101156.12351', N'myvietteltest', N'myvietteltest', 1000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1670397672265, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=4z4f33fb914f36cadac1&order_id=90011_221013101156.12351&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAmY2xpZW50X2lkPTEyMDAwMzY4JnJlZmVyZW5jZV9pZD05MDAxMV8yMjEwMTMxMDExNTYuMTIzNTEmcmVzdWx0X2NvZGU9MjAxJnNpZ25hdHVyZT0yU2FzRDRjRm1WU0t2OVhqUlF1a0k2bHR1bUw5d3dxV2pDQ3VZZ3lCYmRFJTNE&source=web', 0, N'success', CAST(N'2022-12-07T07:01:12.243' AS DateTime), CAST(N'2022-12-07T07:01:12.530' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (30, N'90011_221013101156.12352', N'90011_221013101156.12352', N'myvietteltest', N'myvietteltest', 100000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1670399357408, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=jNbM56329c4dceb934f1&order_id=90011_221013101156.12352&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAwMCZjbGllbnRfaWQ9MTIwMDAzNjgmcmVmZXJlbmNlX2lkPTkwMDExXzIyMTAxMzEwMTE1Ni4xMjM1MiZyZXN1bHRfY29kZT0yMDEmc2lnbmF0dXJlPVZ3UHgtanV6V1EyaFBuYlBubS1qbkRyaksyRVlNaVNnc1JiSkRncWUxaDAlM0Q%3D&source=web', 0, N'success', CAST(N'2022-12-07T07:29:17.393' AS DateTime), CAST(N'2022-12-07T07:29:17.770' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (31, N'90011_221013101156.12353', N'90011_221013101156.12353', N'myvietteltest', N'myvietteltest', 100000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1670400013509, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=AaB7379883999a2d30c0&order_id=90011_221013101156.12353&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAwMCZjbGllbnRfaWQ9MTIwMDAzNjgmcmVmZXJlbmNlX2lkPTkwMDExXzIyMTAxMzEwMTE1Ni4xMjM1MyZyZXN1bHRfY29kZT0yMDEmc2lnbmF0dXJlPTJoTUtDcXktRS00dUg0MnZ0NFFua09iSjdFRlpYb3NCUTZKTzNKYjl1aUUlM0Q%3D&source=web', 0, N'success', CAST(N'2022-12-07T07:40:13.513' AS DateTime), CAST(N'2022-12-07T07:40:14.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (32, N'90011_221013101156.12354', N'90011_221013101156.12354', N'myvietteltest', N'myvietteltest', 100000, N'VND', N'http://localhost:8080/payment_result.html', N'pc', 1670401783231, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=OkUS8703fe5c9195c2ce&order_id=90011_221013101156.12354&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAwMCZjbGllbnRfaWQ9MTIwMDAzNjgmcmVmZXJlbmNlX2lkPTkwMDExXzIyMTAxMzEwMTE1Ni4xMjM1NCZyZXN1bHRfY29kZT0yMDEmc2lnbmF0dXJlPXBHdDRYOVlRSXF5WEZWWktzbmxYNVM1Tmx2Z0lYWGJWenR4SVp5UTZyS1ElM0Q%3D&source=web', 0, N'success', CAST(N'2022-12-07T08:09:43.253' AS DateTime), CAST(N'2022-12-07T08:10:25.030' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 200, N'{"amount":100000,"transaction_sn":"1011000305","reference_id":"90011_221013101156.12354","payment_method":16,"user_id_hash":"752fbeedaf6ad405fc277db9f3eb39d8a9b954212969a602ebf9dae16c0184ea","merchant_ext_id":"myvietteltest","store_ext_id":"myvietteltest","transaction_status":3}', 3, 10)
GO
INSERT [dbo].[payment_gateway_transactions] ([rec_id], [request_id], [payment_reference_id], [merchant_ext_id], [store_ext_id], [payment_amount], [currency], [return_url], [platform_type], [expire_time], [additional_info], [promo_ids], [rsp_redirect_url], [rsp_error_code], [rsp_msg], [created_date], [rsp_date], [update_date], [update_status], [order_cancel_status], [order_refund_status], [cancel_at], [refund_at], [final_status], [callback_msg], [callback_status], [partner_id]) VALUES (33, N'90011_221013101156.12355', N'90011_221013101156.12355', N'myvietteltest', N'myvietteltest', 100000, N'VND', N'http://localhost:8080/payment_result.html', N'app', 1670405831281, NULL, NULL, N'https://pay.uat.airpay.vn/h5pay/pay?type=start&app_id=12000368&key=qwfTd80b4228b94723b3&order_id=90011_221013101156.12355&return_url=aHR0cDovL2xvY2FsaG9zdDo4MDgwL3BheW1lbnRfcmVzdWx0Lmh0bWw%2FYW1vdW50PTEwMDAwMCZjbGllbnRfaWQ9MTIwMDAzNjgmcmVmZXJlbmNlX2lkPTkwMDExXzIyMTAxMzEwMTE1Ni4xMjM1NSZyZXN1bHRfY29kZT0yMDEmc2lnbmF0dXJlPURHbFVaUlYtbDFoN0JwQ3FGYWl2WTFSb0NVY1podk9XOXRpZmtqZWRJTUElM0Q%3D&source=web', 0, N'success', CAST(N'2022-12-07T09:17:11.317' AS DateTime), CAST(N'2022-12-07T09:17:11.797' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10)
GO
SET IDENTITY_INSERT [dbo].[payment_gateway_transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_ADMIN_USERS] ON 
GO
INSERT [dbo].[TBL_ADMIN_USERS] ([admin_user_id], [admin_user_name], [admin_user_password], [admin_user_email], [admin_user_fullname], [admin_user_status], [bcrypt_password]) VALUES (1, N'sysadmin3', N'???????y;?5oC?C?Dk$??-?5V?}???C???J?????.?"S6A?A????|?', N'vuonghc@gmail.com', N'Hoang Cong Vuong', N'1', NULL)
GO
INSERT [dbo].[TBL_ADMIN_USERS] ([admin_user_id], [admin_user_name], [admin_user_password], [admin_user_email], [admin_user_fullname], [admin_user_status], [bcrypt_password]) VALUES (2, N'sysadmin', N'????~}??UNw ???1!?P?Xc?:N?IP8v5B"F??=??be26?x??^?q????YA', N'huyenntt@imediatech.com', N'Nguyen Thi Thanh Huyen', N'1', N'$2a$10$HlAQ6uqaQ0rXE0uey5qeHuNUQJV4pS615.L8sIgA4XJcn3CBYHPo6')
GO
INSERT [dbo].[TBL_ADMIN_USERS] ([admin_user_id], [admin_user_name], [admin_user_password], [admin_user_email], [admin_user_fullname], [admin_user_status], [bcrypt_password]) VALUES (3, N'sysadmin1', N'?7?z?????????s?N?-??r??!gF?sq??^?d????q?g
ST?K?z?E????z', N'khailv@imediatech.com', N'Le van khai', N'1', NULL)
GO
INSERT [dbo].[TBL_ADMIN_USERS] ([admin_user_id], [admin_user_name], [admin_user_password], [admin_user_email], [admin_user_fullname], [admin_user_status], [bcrypt_password]) VALUES (4, N'sysadmin2', N'??o?????O$????????4??????D9s^??g??`9??E???g,&g
/?m*O4??$rIh', N'thienld@imediatech.com', N'Thien ld maker', N'1', NULL)
GO
SET IDENTITY_INSERT [dbo].[TBL_ADMIN_USERS] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_MERCHANTS] ON 
GO
INSERT [dbo].[TBL_MERCHANTS] ([merchant_id], [merchant_username], [merchant_password], [merchant_code], [merchant_type], [merchant_name], [merchant_address1], [merchant_address2], [merchant_address3], [merchant_balance], [postal_code], [DEFAULT_RECEIPT_COMPANY_NAME], [DEFAULT_RECEIPT_OUTLET_LOCATION], [DEFAULT_RECEIPT_COMPANY_SLOGAN], [CONTACT_TITLE], [CONTACT_NAME], [CONTACT_NUMBER], [CONTACT_EXTENSION_NUMBER], [CONTACT_FAX], [BILLING_ADDRESS1], [BILLING_ADDRESS2], [BILLING_ADDRESS3], [BILLING_POSTAL], [register_person], [register_datetime], [update_person], [update_datetime], [merchant_status], [remark], [owner_by], [owner_id], [saleman_id], [REGISTER_BY], [UPDATE_BY], [payment_type], [alert_amount], [EMAIL], [PASSWORD_REPORT], [ACTIVATE], [ip_list], [is_check_ip], [public_key], [public_key1], [authen_key], [tax_code], [merchant_debt], [bcrypt_password], [callback_trans_url]) VALUES (6, N'cdv_itopup', N'	???H?W?i??7????[?^?2"K2???8?,Y?b??`???{K????????[Q=', N'abc', N'0', N'cdv_itopup', N'Tang 7 toa nha vien dong 36 hoang cau hn', NULL, NULL, 1010520000, N'844', N'', N'', N'', N'Test', N'Test', N'844', N'', N'', NULL, NULL, NULL, N'', 12, CAST(N'2018-09-20T10:22:16.833' AS DateTime), 0, CAST(N'2021-08-12T13:23:21.657' AS DateTime), N'1', NULL, N'1', -10, 59, N'1', N'1', NULL, 82931550, N'louis95xx@gmail.com', N'?2S?j?k?-Jo?=????A??J??v!??3?H????m?F?????^???y~???Td????', NULL, N'210.245.8.26', 0, N'public keys', NULL, N'123456789000009', N'a', NULL, NULL, NULL)
GO
INSERT [dbo].[TBL_MERCHANTS] ([merchant_id], [merchant_username], [merchant_password], [merchant_code], [merchant_type], [merchant_name], [merchant_address1], [merchant_address2], [merchant_address3], [merchant_balance], [postal_code], [DEFAULT_RECEIPT_COMPANY_NAME], [DEFAULT_RECEIPT_OUTLET_LOCATION], [DEFAULT_RECEIPT_COMPANY_SLOGAN], [CONTACT_TITLE], [CONTACT_NAME], [CONTACT_NUMBER], [CONTACT_EXTENSION_NUMBER], [CONTACT_FAX], [BILLING_ADDRESS1], [BILLING_ADDRESS2], [BILLING_ADDRESS3], [BILLING_POSTAL], [register_person], [register_datetime], [update_person], [update_datetime], [merchant_status], [remark], [owner_by], [owner_id], [saleman_id], [REGISTER_BY], [UPDATE_BY], [payment_type], [alert_amount], [EMAIL], [PASSWORD_REPORT], [ACTIVATE], [ip_list], [is_check_ip], [public_key], [public_key1], [authen_key], [tax_code], [merchant_debt], [bcrypt_password], [callback_trans_url]) VALUES (7, N'IMEDIA_TEST', N'?B???Y??g{??k????T?M-?l
N? ?9?3?????0?q\}?3)0dv<RE(??8??q?)?`', N'IMEDIA_TEST', N'0', N'IMEDIA_TEST', N'IMEDIA_TEST', NULL, NULL, 185265734, N'84', N'', N'', N'', N'844', N'Tam', N'844', N'', N'', NULL, NULL, NULL, N'', 1, CAST(N'2018-09-27T16:18:49.150' AS DateTime), 0, CAST(N'2022-12-19T03:37:01.643' AS DateTime), N'1', NULL, N'1', -10, 58, N'1', N'1', NULL, NULL, N'louis95xx@gmail.com', N'????????9&W"?t??B??v??&1y?:?8h?x??g??????S???x?Q?t+??i?H?', NULL, N'', 0, N'MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgLyqjm+K6L937E49NERq9ughqy7Gne/c8on48Fq8HF2Hq44ALxcNEssKLOsqI1sN83wvKVK8YI6qeIKmH+1DoB0f28pFN89S6b1DM2t9fGrnSps+E1BMdvh8DhWAue/Y0u+fCOmbSTKQ3ul1OR5BbV0BukNVF0jZgvHG9SyNTQ31AgMBAAE=', NULL, NULL, N'b', 0, NULL, NULL)
GO
INSERT [dbo].[TBL_MERCHANTS] ([merchant_id], [merchant_username], [merchant_password], [merchant_code], [merchant_type], [merchant_name], [merchant_address1], [merchant_address2], [merchant_address3], [merchant_balance], [postal_code], [DEFAULT_RECEIPT_COMPANY_NAME], [DEFAULT_RECEIPT_OUTLET_LOCATION], [DEFAULT_RECEIPT_COMPANY_SLOGAN], [CONTACT_TITLE], [CONTACT_NAME], [CONTACT_NUMBER], [CONTACT_EXTENSION_NUMBER], [CONTACT_FAX], [BILLING_ADDRESS1], [BILLING_ADDRESS2], [BILLING_ADDRESS3], [BILLING_POSTAL], [register_person], [register_datetime], [update_person], [update_datetime], [merchant_status], [remark], [owner_by], [owner_id], [saleman_id], [REGISTER_BY], [UPDATE_BY], [payment_type], [alert_amount], [EMAIL], [PASSWORD_REPORT], [ACTIVATE], [ip_list], [is_check_ip], [public_key], [public_key1], [authen_key], [tax_code], [merchant_debt], [bcrypt_password], [callback_trans_url]) VALUES (10, N'merch_test', N'?t???A?x????eW????~$???????[???\?r?33vz?????<S????5?????', N'partner_sb', N'0', N'partner_sb', N'Ha noi', NULL, NULL, 100000, N'10000', NULL, NULL, NULL, N'DEV', NULL, N'0912345678', NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-05-07T10:12:32.293' AS DateTime), 0, CAST(N'2019-05-07T10:12:32.293' AS DateTime), N'1', NULL, N'1', -10, 58, N'1', N'1', NULL, NULL, NULL, N'?F6?Rh?6??
u
????d??Ho?0??????)????t??????^&Fj?&B?#x?@x???', NULL, N'127.0.0.1', 1, NULL, NULL, NULL, N'f', 0, N'$2a$10$HbhkK4Yf91rFsVlfFjoFf.33kJHlY30EJc8pIv4aYx42fSmOV8uHy', N'x')
GO
SET IDENTITY_INSERT [dbo].[TBL_MERCHANTS] OFF
GO
SET IDENTITY_INSERT [dbo].[tracking_code_data] ON 
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (1, N'Chấp nhận.', N'Chấp nhận.', CAST(N'2023-04-23T13:02:13.967' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (2, N'Khởi hành từ Việt Nam.', N'Khởi hành từ Việt Nam.', CAST(N'2023-04-23T13:24:27.363' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (3, N'Đã đến nước phát.', N'Đã đến nước phát.', CAST(N'2023-04-23T16:24:54.640' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (4, N'Đang làm thủ tục hải quan.', N'Đang làm thủ tục hải quan.', CAST(N'2023-04-23T16:25:09.610' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (5, N'Đã xong thủ tục hải quan.', N'Đã xong thủ tục hải quan.', CAST(N'2023-04-23T16:25:19.797' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (6, N'Đã phât thành công', N'Đã phât thành công', CAST(N'2023-04-23T16:25:27.697' AS DateTime))
GO
INSERT [dbo].[tracking_code_data] ([state_id], [tracking_code], [tracking_code_long_desc], [created_date]) VALUES (7, N'Phát không thành công', N'Phát không thành công', CAST(N'2023-04-23T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tracking_code_data] OFF
GO
SET IDENTITY_INSERT [dbo].[tracking_logs] ON 
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (1, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (2, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (3, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (4, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (5, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (6, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (7, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (8, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (9, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (10, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (11, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (12, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (13, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (14, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (15, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (16, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (17, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (18, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (19, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (20, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (21, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (22, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (23, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (24, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (25, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (26, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (27, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (28, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (29, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (30, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (31, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (32, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (33, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (34, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (35, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (36, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (37, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (38, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (39, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (40, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (41, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (42, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (43, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (44, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (45, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (46, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (47, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (48, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (49, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (50, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (51, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (52, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (53, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (54, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (55, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (56, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (57, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (58, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (59, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (60, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (61, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (62, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (63, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (64, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (65, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (66, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (67, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (68, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (69, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (70, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (71, N'MCE000022828', N'EE000022828LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (72, N'MCE000022828', N'EE000022828LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (73, N'MCE000022828', N'EE000022828LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (74, N'MCE000022828', N'EE000022828LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (75, N'MCE000022828', N'EE000022828LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (76, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (77, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (78, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (79, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (80, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (81, N'MCE000022845', N'EE000022845LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (82, N'MCE000022845', N'EE000022845LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (83, N'MCE000022845', N'EE000022845LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (84, N'MCE000022845', N'EE000022845LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (85, N'MCE000022845', N'EE000022845LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (86, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (87, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (88, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (89, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (90, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (91, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (92, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (93, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (94, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (95, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (96, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (97, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (98, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (99, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (100, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (101, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (102, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (103, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (104, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (105, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (106, N'MCE000022893', N'EE000022893LA', CAST(N'2023-05-07T09:18:05.157' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (107, N'MCE000022893', N'EE000022893LA', CAST(N'2023-05-07T09:18:05.153' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (108, N'MCE000022893', N'EE000022893LA', CAST(N'2023-05-07T09:18:05.153' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (109, N'MCE000022893', N'EE000022893LA', CAST(N'2023-05-07T09:18:05.150' AS DateTime), N'N/A', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (110, N'MCE000022893', N'EE000022893LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (111, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (112, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (113, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (114, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (115, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (116, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (117, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (118, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (119, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (120, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (121, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (122, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (123, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (124, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (125, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (126, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (127, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (128, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (129, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (130, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (131, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (132, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (133, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (134, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (135, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (136, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (137, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (138, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (139, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (140, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (141, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (142, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (143, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (144, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (145, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (146, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (147, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (148, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (149, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (150, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (151, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (152, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (153, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (154, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (155, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (156, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (157, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (158, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (159, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (160, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (161, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (162, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (163, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (164, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (165, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (166, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (167, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (168, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (169, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (170, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (171, N'MCE000025020', N'EE000025020LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (172, N'MCE000025020', N'EE000025020LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (173, N'MCE000025020', N'EE000025020LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (174, N'MCE000025020', N'EE000025020LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (175, N'MCE000025020', N'EE000025020LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (176, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (177, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (178, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (179, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (180, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (181, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (182, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (183, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (184, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (185, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (186, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (187, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (188, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (189, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (190, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (191, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (192, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (193, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (194, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (195, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (196, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (197, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (198, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (199, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (200, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-03T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (202, N'MCE000025081', N'EE000025081LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (203, N'MCE000025081', N'EE000025081LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (204, N'MCE000025081', N'EE000025081LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (205, N'MCE000025081', N'EE000025081LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (206, N'MCE000025095', N'EE000025095LA', CAST(N'2023-05-05T14:44:28.493' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (207, N'MCE000025095', N'EE000025095LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (208, N'MCE000025095', N'EE000025095LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (209, N'MCE000025095', N'EE000025095LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (210, N'MCE000025095', N'EE000025095LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (211, N'MCE000025104', N'EE000025104LA', CAST(N'2023-05-05T14:44:28.503' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (212, N'MCE000025104', N'EE000025104LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (213, N'MCE000025104', N'EE000025104LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (214, N'MCE000025104', N'EE000025104LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (215, N'MCE000025104', N'EE000025104LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (216, N'MCE000025118', N'EE000025118LA', CAST(N'2023-05-05T14:44:28.510' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (217, N'MCE000025118', N'EE000025118LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (218, N'MCE000025118', N'EE000025118LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (219, N'MCE000025118', N'EE000025118LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (220, N'MCE000025118', N'EE000025118LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (221, N'MCE000025121', N'EE000025121LA', CAST(N'2023-05-05T14:44:28.517' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (222, N'MCE000025121', N'EE000025121LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (223, N'MCE000025121', N'EE000025121LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (224, N'MCE000025121', N'EE000025121LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (225, N'MCE000025121', N'EE000025121LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (226, N'MCE000025135', N'EE000025135LA', CAST(N'2023-05-05T14:44:28.527' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (227, N'MCE000025135', N'EE000025135LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (228, N'MCE000025135', N'EE000025135LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (229, N'MCE000025135', N'EE000025135LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (230, N'MCE000025135', N'EE000025135LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (231, N'MCE000025149', N'EE000025149LA', CAST(N'2023-05-05T14:44:28.533' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (232, N'MCE000025149', N'EE000025149LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (233, N'MCE000025149', N'EE000025149LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (234, N'MCE000025149', N'EE000025149LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (235, N'MCE000025149', N'EE000025149LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (236, N'MCE000025152', N'EE000025152LA', CAST(N'2023-05-05T14:44:28.540' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (237, N'MCE000025152', N'EE000025152LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (238, N'MCE000025152', N'EE000025152LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (239, N'MCE000025152', N'EE000025152LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (240, N'MCE000025152', N'EE000025152LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (241, N'MCE000025166', N'EE000025166LA', CAST(N'2023-05-05T14:44:28.547' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (242, N'MCE000025166', N'EE000025166LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (243, N'MCE000025166', N'EE000025166LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (244, N'MCE000025166', N'EE000025166LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (245, N'MCE000025166', N'EE000025166LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (246, N'MCE000025170', N'EE000025170LA', CAST(N'2023-05-05T14:44:28.553' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (247, N'MCE000025170', N'EE000025170LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (248, N'MCE000025170', N'EE000025170LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (249, N'MCE000025170', N'EE000025170LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (250, N'MCE000025170', N'EE000025170LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (251, N'MCE000025183', N'EE000025183LA', CAST(N'2023-05-05T14:44:28.560' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (252, N'MCE000025183', N'EE000025183LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (253, N'MCE000025183', N'EE000025183LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (254, N'MCE000025183', N'EE000025183LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (255, N'MCE000025183', N'EE000025183LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (256, N'MCE000025197', N'EE000025197LA', CAST(N'2023-05-05T14:44:28.570' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (257, N'MCE000025197', N'EE000025197LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (258, N'MCE000025197', N'EE000025197LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (259, N'MCE000025197', N'EE000025197LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (260, N'MCE000025197', N'EE000025197LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (261, N'MCE000025206', N'EE000025206LA', CAST(N'2023-05-05T14:44:28.577' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (262, N'MCE000025206', N'EE000025206LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (263, N'MCE000025206', N'EE000025206LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (264, N'MCE000025206', N'EE000025206LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (265, N'MCE000025206', N'EE000025206LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (266, N'MCE000025210', N'EE000025210LA', CAST(N'2023-05-05T14:44:28.587' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (267, N'MCE000025210', N'EE000025210LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (268, N'MCE000025210', N'EE000025210LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (269, N'MCE000025210', N'EE000025210LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (270, N'MCE000025210', N'EE000025210LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (271, N'MCE000025223', N'EE000025223LA', CAST(N'2023-05-05T14:44:28.597' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (272, N'MCE000025223', N'EE000025223LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (273, N'MCE000025223', N'EE000025223LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (274, N'MCE000025223', N'EE000025223LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (275, N'MCE000025223', N'EE000025223LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (276, N'MCE000025237', N'EE000025237LA', CAST(N'2023-05-05T14:44:28.603' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (277, N'MCE000025237', N'EE000025237LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (278, N'MCE000025237', N'EE000025237LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (279, N'MCE000025237', N'EE000025237LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (280, N'MCE000025237', N'EE000025237LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (281, N'MCE000025245', N'EE000025245LA', CAST(N'2023-05-05T14:44:28.610' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (282, N'MCE000025245', N'EE000025245LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (283, N'MCE000025245', N'EE000025245LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (284, N'MCE000025245', N'EE000025245LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (285, N'MCE000025245', N'EE000025245LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (286, N'MCE000025254', N'EE000025254LA', CAST(N'2023-05-05T14:44:28.617' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (287, N'MCE000025254', N'EE000025254LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (288, N'MCE000025254', N'EE000025254LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (289, N'MCE000025254', N'EE000025254LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (290, N'MCE000025254', N'EE000025254LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (291, N'MCE000025268', N'EE000025268LA', CAST(N'2023-05-05T14:44:28.623' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (292, N'MCE000025268', N'EE000025268LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (293, N'MCE000025268', N'EE000025268LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (294, N'MCE000025268', N'EE000025268LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (295, N'MCE000025268', N'EE000025268LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (296, N'MCE000025271', N'EE000025271LA', CAST(N'2023-05-05T14:44:28.633' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (297, N'MCE000025271', N'EE000025271LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (298, N'MCE000025271', N'EE000025271LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (299, N'MCE000025271', N'EE000025271LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (300, N'MCE000025271', N'EE000025271LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (301, N'MCE000025285', N'EE000025285LA', CAST(N'2023-05-05T14:44:28.640' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (302, N'MCE000025285', N'EE000025285LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (303, N'MCE000025285', N'EE000025285LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (304, N'MCE000025285', N'EE000025285LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (305, N'MCE000025285', N'EE000025285LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (306, N'MCE000025299', N'EE000025299LA', CAST(N'2023-05-05T14:44:28.647' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (307, N'MCE000025299', N'EE000025299LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (308, N'MCE000025299', N'EE000025299LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (309, N'MCE000025299', N'EE000025299LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (310, N'MCE000025299', N'EE000025299LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (311, N'MCE000025308', N'EE000025308LA', CAST(N'2023-05-05T14:44:28.653' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (312, N'MCE000025308', N'EE000025308LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (313, N'MCE000025308', N'EE000025308LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (314, N'MCE000025308', N'EE000025308LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (315, N'MCE000025308', N'EE000025308LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (316, N'MCE000025311', N'EE000025311LA', CAST(N'2023-05-05T14:44:28.660' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (317, N'MCE000025311', N'EE000025311LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (318, N'MCE000025311', N'EE000025311LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (319, N'MCE000025311', N'EE000025311LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (320, N'MCE000025311', N'EE000025311LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (321, N'MCE000025325', N'EE000025325LA', CAST(N'2023-05-05T14:44:28.667' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (322, N'MCE000025325', N'EE000025325LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (323, N'MCE000025325', N'EE000025325LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (324, N'MCE000025325', N'EE000025325LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (325, N'MCE000025325', N'EE000025325LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (326, N'MCE000025339', N'EE000025339LA', CAST(N'2023-05-05T14:44:28.673' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (327, N'MCE000025339', N'EE000025339LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (328, N'MCE000025339', N'EE000025339LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (329, N'MCE000025339', N'EE000025339LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (330, N'MCE000025339', N'EE000025339LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (331, N'MCE000025342', N'EE000025342LA', CAST(N'2023-05-05T14:44:28.680' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (332, N'MCE000025342', N'EE000025342LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (333, N'MCE000025342', N'EE000025342LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (334, N'MCE000025342', N'EE000025342LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (335, N'MCE000025342', N'EE000025342LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (337, N'MCE000025356', N'EE000025356LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (338, N'MCE000025356', N'EE000025356LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (339, N'MCE000025356', N'EE000025356LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (340, N'MCE000025356', N'EE000025356LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (342, N'MCE000025360', N'EE000025360LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (343, N'MCE000025360', N'EE000025360LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (344, N'MCE000025360', N'EE000025360LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (345, N'MCE000025360', N'EE000025360LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (347, N'MCE000025373', N'EE000025373LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (348, N'MCE000025373', N'EE000025373LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (349, N'MCE000025373', N'EE000025373LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (350, N'MCE000025373', N'EE000025373LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (352, N'MCE000025387', N'EE000025387LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (353, N'MCE000025387', N'EE000025387LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (354, N'MCE000025387', N'EE000025387LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (355, N'MCE000025387', N'EE000025387LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (357, N'MCE000025395', N'EE000025395LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (358, N'MCE000025395', N'EE000025395LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (359, N'MCE000025395', N'EE000025395LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (360, N'MCE000025395', N'EE000025395LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (362, N'MCE000025400', N'EE000025400LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (363, N'MCE000025400', N'EE000025400LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (364, N'MCE000025400', N'EE000025400LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (365, N'MCE000025400', N'EE000025400LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (367, N'MCE000025413', N'EE000025413LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (368, N'MCE000025413', N'EE000025413LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (369, N'MCE000025413', N'EE000025413LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (370, N'MCE000025413', N'EE000025413LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (372, N'MCE000025427', N'EE000025427LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (373, N'MCE000025427', N'EE000025427LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (374, N'MCE000025427', N'EE000025427LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (375, N'MCE000025427', N'EE000025427LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (377, N'MCE000025435', N'EE000025435LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (378, N'MCE000025435', N'EE000025435LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (379, N'MCE000025435', N'EE000025435LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (380, N'MCE000025435', N'EE000025435LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (382, N'MCE000025444', N'EE000025444LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (383, N'MCE000025444', N'EE000025444LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Nhật Bản', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (384, N'MCE000025444', N'EE000025444LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (385, N'MCE000025444', N'EE000025444LA', CAST(N'2023-05-04T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (391, N'MCE000025081', N'EE000025081LA', CAST(N'2023-05-05T14:44:28.487' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (392, N'MCE000025356', N'EE000025356LA', CAST(N'2023-05-05T14:44:28.687' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (393, N'MCE000025360', N'EE000025360LA', CAST(N'2023-05-05T14:44:28.693' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (394, N'MCE000025373', N'EE000025373LA', CAST(N'2023-05-05T14:44:28.700' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (395, N'MCE000025387', N'EE000025387LA', CAST(N'2023-05-05T14:44:28.707' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (396, N'MCE000025395', N'EE000025395LA', CAST(N'2023-05-05T14:44:28.713' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (397, N'MCE000025400', N'EE000025400LA', CAST(N'2023-05-05T14:44:28.720' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (398, N'MCE000025413', N'EE000025413LA', CAST(N'2023-05-05T14:44:28.727' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (399, N'MCE000025427', N'EE000025427LA', CAST(N'2023-05-05T14:44:28.733' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (400, N'MCE000025435', N'EE000025435LA', CAST(N'2023-05-05T14:44:28.740' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (401, N'MCE000025444', N'EE000025444LA', CAST(N'2023-05-05T14:44:28.747' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (407, N'MCE000022859', N'EE000022859LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (408, N'MCE000022876', N'EE000022876LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (409, N'MCE000022880', N'EE000022880LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (410, N'MCE000022902', N'EE000022902LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (411, N'MCE000022916', N'EE000022916LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (412, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (413, N'MCE000022933', N'EE000022933LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (414, N'MCE000022947', N'EE000022947LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (415, N'MCE000022955', N'EE000022955LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (416, N'MCE000022964', N'EE000022964LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (417, N'MCE000022978', N'EE000022978LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (418, N'MCE000022981', N'EE000022981LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (419, N'MCE000022995', N'EE000022995LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (420, N'MCE000025002', N'EE000025002LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (421, N'MCE000025033', N'EE000025033LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (422, N'MCE000025458', N'EE000025458LA', CAST(N'2023-05-06T09:30:41.857' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (423, N'MCE000025458', N'EE000025458LA', CAST(N'2023-05-06T09:30:41.857' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (424, N'MCE000025458', N'EE000025458LA', CAST(N'2023-05-06T09:30:41.853' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (425, N'MCE000025458', N'EE000025458LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (426, N'MCE000025458', N'EE000025458LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (427, N'MCE000025461', N'EE000025461LA', CAST(N'2023-05-06T09:30:41.873' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (428, N'MCE000025461', N'EE000025461LA', CAST(N'2023-05-06T09:30:41.870' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (429, N'MCE000025461', N'EE000025461LA', CAST(N'2023-05-06T09:30:41.867' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (430, N'MCE000025461', N'EE000025461LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (431, N'MCE000025461', N'EE000025461LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (432, N'MCE000025475', N'EE000025475LA', CAST(N'2023-05-06T09:30:41.887' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (433, N'MCE000025475', N'EE000025475LA', CAST(N'2023-05-06T09:30:41.883' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (434, N'MCE000025475', N'EE000025475LA', CAST(N'2023-05-06T09:30:41.880' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (435, N'MCE000025475', N'EE000025475LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (436, N'MCE000025475', N'EE000025475LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (437, N'MCE000025489', N'EE000025489LA', CAST(N'2023-05-06T09:30:41.897' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (438, N'MCE000025489', N'EE000025489LA', CAST(N'2023-05-06T09:30:41.897' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (439, N'MCE000025489', N'EE000025489LA', CAST(N'2023-05-06T09:30:41.893' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (440, N'MCE000025489', N'EE000025489LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (441, N'MCE000025489', N'EE000025489LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (442, N'MCE000025492', N'EE000025492LA', CAST(N'2023-05-06T09:30:41.910' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (443, N'MCE000025492', N'EE000025492LA', CAST(N'2023-05-06T09:30:41.910' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (444, N'MCE000025492', N'EE000025492LA', CAST(N'2023-05-06T09:30:41.907' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (445, N'MCE000025492', N'EE000025492LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (446, N'MCE000025492', N'EE000025492LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (447, N'MCE000025501', N'EE000025501LA', CAST(N'2023-05-06T09:30:41.923' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (448, N'MCE000025501', N'EE000025501LA', CAST(N'2023-05-06T09:30:41.920' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (449, N'MCE000025501', N'EE000025501LA', CAST(N'2023-05-06T09:30:41.920' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (450, N'MCE000025501', N'EE000025501LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (451, N'MCE000025501', N'EE000025501LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (452, N'MCE000025515', N'EE000025515LA', CAST(N'2023-05-06T09:30:41.940' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (453, N'MCE000025515', N'EE000025515LA', CAST(N'2023-05-06T09:30:41.937' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (454, N'MCE000025515', N'EE000025515LA', CAST(N'2023-05-06T09:30:41.937' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (455, N'MCE000025515', N'EE000025515LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (456, N'MCE000025515', N'EE000025515LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (457, N'MCE000025529', N'EE000025529LA', CAST(N'2023-05-06T09:30:41.950' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (458, N'MCE000025529', N'EE000025529LA', CAST(N'2023-05-06T09:30:41.950' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (459, N'MCE000025529', N'EE000025529LA', CAST(N'2023-05-06T09:30:41.947' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (460, N'MCE000025529', N'EE000025529LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (461, N'MCE000025529', N'EE000025529LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (462, N'MCE000025532', N'EE000025532LA', CAST(N'2023-05-06T09:30:41.960' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (463, N'MCE000025532', N'EE000025532LA', CAST(N'2023-05-06T09:30:41.960' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (464, N'MCE000025532', N'EE000025532LA', CAST(N'2023-05-06T09:30:41.957' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (465, N'MCE000025532', N'EE000025532LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (466, N'MCE000025532', N'EE000025532LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (467, N'MCE000025546', N'EE000025546LA', CAST(N'2023-05-06T09:30:41.983' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (468, N'MCE000025546', N'EE000025546LA', CAST(N'2023-05-06T09:30:41.980' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (469, N'MCE000025546', N'EE000025546LA', CAST(N'2023-05-06T09:30:41.980' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (470, N'MCE000025546', N'EE000025546LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (471, N'MCE000025546', N'EE000025546LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (472, N'MCE000025550', N'EE000025550LA', CAST(N'2023-05-06T09:30:41.993' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (473, N'MCE000025550', N'EE000025550LA', CAST(N'2023-05-06T09:30:41.993' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (474, N'MCE000025550', N'EE000025550LA', CAST(N'2023-05-06T09:30:41.990' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (475, N'MCE000025550', N'EE000025550LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (476, N'MCE000025550', N'EE000025550LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (477, N'MCE000025563', N'EE000025563LA', CAST(N'2023-05-06T09:30:42.003' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (478, N'MCE000025563', N'EE000025563LA', CAST(N'2023-05-06T09:30:42.003' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (479, N'MCE000025563', N'EE000025563LA', CAST(N'2023-05-06T09:30:42.000' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (480, N'MCE000025563', N'EE000025563LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (481, N'MCE000025563', N'EE000025563LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (482, N'MCE000025577', N'EE000025577LA', CAST(N'2023-05-06T09:30:42.013' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (483, N'MCE000025577', N'EE000025577LA', CAST(N'2023-05-06T09:30:42.013' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (484, N'MCE000025577', N'EE000025577LA', CAST(N'2023-05-06T09:30:42.010' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (485, N'MCE000025577', N'EE000025577LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (486, N'MCE000025577', N'EE000025577LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (487, N'MCE000025585', N'EE000025585LA', CAST(N'2023-05-06T09:30:42.027' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (488, N'MCE000025585', N'EE000025585LA', CAST(N'2023-05-06T09:30:42.023' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (489, N'MCE000025585', N'EE000025585LA', CAST(N'2023-05-06T09:30:42.023' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (490, N'MCE000025585', N'EE000025585LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (491, N'MCE000025585', N'EE000025585LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (492, N'MCE000025594', N'EE000025594LA', CAST(N'2023-05-06T09:30:42.037' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (493, N'MCE000025594', N'EE000025594LA', CAST(N'2023-05-06T09:30:42.033' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (494, N'MCE000025594', N'EE000025594LA', CAST(N'2023-05-06T09:30:42.033' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (495, N'MCE000025594', N'EE000025594LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (496, N'MCE000025594', N'EE000025594LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (497, N'MCE000025603', N'EE000025603LA', CAST(N'2023-05-06T09:30:42.047' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (498, N'MCE000025603', N'EE000025603LA', CAST(N'2023-05-06T09:30:42.043' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (499, N'MCE000025603', N'EE000025603LA', CAST(N'2023-05-06T09:30:42.043' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (500, N'MCE000025603', N'EE000025603LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (501, N'MCE000025603', N'EE000025603LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (502, N'MCE000025617', N'EE000025617LA', CAST(N'2023-05-06T09:30:42.057' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (503, N'MCE000025617', N'EE000025617LA', CAST(N'2023-05-06T09:30:42.053' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (504, N'MCE000025617', N'EE000025617LA', CAST(N'2023-05-06T09:30:42.053' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (505, N'MCE000025617', N'EE000025617LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (506, N'MCE000025617', N'EE000025617LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (507, N'MCE000025625', N'EE000025625LA', CAST(N'2023-05-06T09:30:42.063' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (508, N'MCE000025625', N'EE000025625LA', CAST(N'2023-05-06T09:30:42.063' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (509, N'MCE000025625', N'EE000025625LA', CAST(N'2023-05-06T09:30:42.060' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (510, N'MCE000025625', N'EE000025625LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (511, N'MCE000025625', N'EE000025625LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (512, N'MCE000025634', N'EE000025634LA', CAST(N'2023-05-06T09:30:42.073' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (513, N'MCE000025634', N'EE000025634LA', CAST(N'2023-05-06T09:30:42.073' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (514, N'MCE000025634', N'EE000025634LA', CAST(N'2023-05-06T09:30:42.070' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (515, N'MCE000025634', N'EE000025634LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (516, N'MCE000025634', N'EE000025634LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (517, N'MCE000025648', N'EE000025648LA', CAST(N'2023-05-06T09:30:42.083' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (518, N'MCE000025648', N'EE000025648LA', CAST(N'2023-05-06T09:30:42.083' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (519, N'MCE000025648', N'EE000025648LA', CAST(N'2023-05-06T09:30:42.080' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (520, N'MCE000025648', N'EE000025648LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (521, N'MCE000025648', N'EE000025648LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (522, N'MCE000025651', N'EE000025651LA', CAST(N'2023-05-06T09:30:42.093' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (523, N'MCE000025651', N'EE000025651LA', CAST(N'2023-05-06T09:30:42.090' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (524, N'MCE000025651', N'EE000025651LA', CAST(N'2023-05-06T09:30:42.090' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (525, N'MCE000025651', N'EE000025651LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (526, N'MCE000025651', N'EE000025651LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (527, N'MCE000025665', N'EE000025665LA', CAST(N'2023-05-06T09:30:42.100' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (528, N'MCE000025665', N'EE000025665LA', CAST(N'2023-05-06T09:30:42.100' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (529, N'MCE000025665', N'EE000025665LA', CAST(N'2023-05-06T09:30:42.100' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (530, N'MCE000025665', N'EE000025665LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (531, N'MCE000025665', N'EE000025665LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (532, N'MCE000025679', N'EE000025679LA', CAST(N'2023-05-06T09:30:42.110' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (533, N'MCE000025679', N'EE000025679LA', CAST(N'2023-05-06T09:30:42.110' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (534, N'MCE000025679', N'EE000025679LA', CAST(N'2023-05-06T09:30:42.107' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (535, N'MCE000025679', N'EE000025679LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (536, N'MCE000025679', N'EE000025679LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (537, N'MCE000025682', N'EE000025682LA', CAST(N'2023-05-06T09:30:42.120' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (538, N'MCE000025682', N'EE000025682LA', CAST(N'2023-05-06T09:30:42.120' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (539, N'MCE000025682', N'EE000025682LA', CAST(N'2023-05-06T09:30:42.117' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (540, N'MCE000025682', N'EE000025682LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (541, N'MCE000025682', N'EE000025682LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (542, N'MCE000025696', N'EE000025696LA', CAST(N'2023-05-06T09:30:42.130' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (543, N'MCE000025696', N'EE000025696LA', CAST(N'2023-05-06T09:30:42.127' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (544, N'MCE000025696', N'EE000025696LA', CAST(N'2023-05-06T09:30:42.127' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (545, N'MCE000025696', N'EE000025696LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (546, N'MCE000025696', N'EE000025696LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (547, N'MCE000025705', N'EE000025705LA', CAST(N'2023-05-06T09:30:42.137' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (548, N'MCE000025705', N'EE000025705LA', CAST(N'2023-05-06T09:30:42.137' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (549, N'MCE000025705', N'EE000025705LA', CAST(N'2023-05-06T09:30:42.137' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (550, N'MCE000025705', N'EE000025705LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (551, N'MCE000025705', N'EE000025705LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (552, N'MCE000025719', N'EE000025719LA', CAST(N'2023-05-06T09:30:42.147' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (553, N'MCE000025719', N'EE000025719LA', CAST(N'2023-05-06T09:30:42.147' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (554, N'MCE000025719', N'EE000025719LA', CAST(N'2023-05-06T09:30:42.147' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (555, N'MCE000025719', N'EE000025719LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (556, N'MCE000025719', N'EE000025719LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (557, N'MCE000025722', N'EE000025722LA', CAST(N'2023-05-06T09:30:42.157' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (558, N'MCE000025722', N'EE000025722LA', CAST(N'2023-05-06T09:30:42.157' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (559, N'MCE000025722', N'EE000025722LA', CAST(N'2023-05-06T09:30:42.153' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (560, N'MCE000025722', N'EE000025722LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (561, N'MCE000025722', N'EE000025722LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (562, N'MCE000025736', N'EE000025736LA', CAST(N'2023-05-06T09:30:42.167' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (563, N'MCE000025736', N'EE000025736LA', CAST(N'2023-05-06T09:30:42.163' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (564, N'MCE000025736', N'EE000025736LA', CAST(N'2023-05-06T09:30:42.163' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (565, N'MCE000025736', N'EE000025736LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (566, N'MCE000025736', N'EE000025736LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (567, N'MCE000025740', N'EE000025740LA', CAST(N'2023-05-06T09:30:42.173' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (568, N'MCE000025740', N'EE000025740LA', CAST(N'2023-05-06T09:30:42.173' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (569, N'MCE000025740', N'EE000025740LA', CAST(N'2023-05-06T09:30:42.170' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (570, N'MCE000025740', N'EE000025740LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (571, N'MCE000025740', N'EE000025740LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (572, N'MCE000025753', N'EE000025753LA', CAST(N'2023-05-06T09:30:42.183' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (573, N'MCE000025753', N'EE000025753LA', CAST(N'2023-05-06T09:30:42.183' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (574, N'MCE000025753', N'EE000025753LA', CAST(N'2023-05-06T09:30:42.180' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (575, N'MCE000025753', N'EE000025753LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (576, N'MCE000025753', N'EE000025753LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (577, N'MCE000025767', N'EE000025767LA', CAST(N'2023-05-06T09:30:42.193' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (578, N'MCE000025767', N'EE000025767LA', CAST(N'2023-05-06T09:30:42.190' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (579, N'MCE000025767', N'EE000025767LA', CAST(N'2023-05-06T09:30:42.190' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (580, N'MCE000025767', N'EE000025767LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (581, N'MCE000025767', N'EE000025767LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (582, N'MCE000025775', N'EE000025775LA', CAST(N'2023-05-06T09:30:42.200' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (583, N'MCE000025775', N'EE000025775LA', CAST(N'2023-05-06T09:30:42.200' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (584, N'MCE000025775', N'EE000025775LA', CAST(N'2023-05-06T09:30:42.197' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (585, N'MCE000025775', N'EE000025775LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (586, N'MCE000025775', N'EE000025775LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (587, N'MCE000025784', N'EE000025784LA', CAST(N'2023-05-06T09:30:42.210' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (588, N'MCE000025784', N'EE000025784LA', CAST(N'2023-05-06T09:30:42.210' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (589, N'MCE000025784', N'EE000025784LA', CAST(N'2023-05-06T09:30:42.207' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (590, N'MCE000025784', N'EE000025784LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (591, N'MCE000025784', N'EE000025784LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (592, N'MCE000025798', N'EE000025798LA', CAST(N'2023-05-06T09:30:42.220' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (593, N'MCE000025798', N'EE000025798LA', CAST(N'2023-05-06T09:30:42.217' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (594, N'MCE000025798', N'EE000025798LA', CAST(N'2023-05-06T09:30:42.217' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (595, N'MCE000025798', N'EE000025798LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (596, N'MCE000025798', N'EE000025798LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (597, N'MCE000025807', N'EE000025807LA', CAST(N'2023-05-06T09:30:42.227' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (598, N'MCE000025807', N'EE000025807LA', CAST(N'2023-05-06T09:30:42.227' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (599, N'MCE000025807', N'EE000025807LA', CAST(N'2023-05-06T09:30:42.227' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (600, N'MCE000025807', N'EE000025807LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (601, N'MCE000025807', N'EE000025807LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (602, N'MCE000025815', N'EE000025815LA', CAST(N'2023-05-06T09:30:42.237' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (603, N'MCE000025815', N'EE000025815LA', CAST(N'2023-05-06T09:30:42.237' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (604, N'MCE000025815', N'EE000025815LA', CAST(N'2023-05-06T09:30:42.237' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (605, N'MCE000025815', N'EE000025815LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (606, N'MCE000025815', N'EE000025815LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (607, N'MCE000025824', N'EE000025824LA', CAST(N'2023-05-06T09:30:42.247' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (608, N'MCE000025824', N'EE000025824LA', CAST(N'2023-05-06T09:30:42.247' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (609, N'MCE000025824', N'EE000025824LA', CAST(N'2023-05-06T09:30:42.243' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (610, N'MCE000025824', N'EE000025824LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (611, N'MCE000025824', N'EE000025824LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (612, N'MCE000025838', N'EE000025838LA', CAST(N'2023-05-06T09:30:42.257' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (613, N'MCE000025838', N'EE000025838LA', CAST(N'2023-05-06T09:30:42.253' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (614, N'MCE000025838', N'EE000025838LA', CAST(N'2023-05-06T09:30:42.253' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (615, N'MCE000025838', N'EE000025838LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (616, N'MCE000025838', N'EE000025838LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (617, N'MCE000025841', N'EE000025841LA', CAST(N'2023-05-06T09:30:42.263' AS DateTime), N'N/A', 5, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (618, N'MCE000025841', N'EE000025841LA', CAST(N'2023-05-06T09:30:42.263' AS DateTime), N'N/A', 4, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (619, N'MCE000025841', N'EE000025841LA', CAST(N'2023-05-06T09:30:42.263' AS DateTime), N'N/A', 3, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (620, N'MCE000025841', N'EE000025841LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (621, N'MCE000025841', N'EE000025841LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (622, N'MCE000025855', N'EE000025855LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (623, N'MCE000025855', N'EE000025855LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (624, N'MCE000025869', N'EE000025869LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (625, N'MCE000025869', N'EE000025869LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (626, N'MCE000025872', N'EE000025872LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (627, N'MCE000025872', N'EE000025872LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (628, N'MCE000025886', N'EE000025886LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (629, N'MCE000025886', N'EE000025886LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (630, N'MCE000025890', N'EE000025890LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Viet Nam', 2, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (631, N'MCE000025890', N'EE000025890LA', CAST(N'2023-05-05T00:00:00.000' AS DateTime), N'Viet Nam', 1, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (632, N'MCE000022791', N'EE000022791LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (633, N'MCE000022805', N'EE000022805LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (634, N'MCE000022814', N'EE000022814LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (635, N'MCE000022831', N'EE000022831LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (636, N'MCE000025047', N'EE000025047LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (637, N'MCE000025055', N'EE000025055LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (638, N'MCE000025064', N'EE000025064LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (639, N'MCE000025078', N'EE000025078LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (640, N'MCE000025016', N'EE000025016LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (641, N'MCE000022686', N'EE000022686LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (642, N'MCE000022690', N'EE000022690LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (643, N'MCE000022709', N'EE000022709LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (644, N'MCE000022712', N'EE000022712LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (645, N'MCE000022726', N'EE000022726LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (646, N'MCE000022730', N'EE000022730LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (647, N'MCE000022743', N'EE000022743LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (648, N'MCE000022757', N'EE000022757LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (649, N'MCE000022765', N'EE000022765LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (650, N'MCE000022774', N'EE000022774LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (651, N'MCE000022788', N'EE000022788LA', CAST(N'2023-05-07T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (652, N'MCE000022862', N'EE000022862LA', CAST(N'2023-05-06T00:00:00.000' AS DateTime), N'Nhật Bản', 6, NULL)
GO
INSERT [dbo].[tracking_logs] ([row_id], [order_code], [order_reference_code], [change_date], [log_location], [state_id], [remark]) VALUES (653, N'MCE000022920', N'EE000022920LA', CAST(N'2023-05-07T09:18:05.167' AS DateTime), N'N/A', 7, NULL)
GO
SET IDENTITY_INSERT [dbo].[tracking_logs] OFF
GO
ALTER TABLE [dbo].[tracking_code_data] ADD  CONSTRAINT [DF_tracking_code_data_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tracking_logs] ADD  CONSTRAINT [DF_tracking_logs_change_date]  DEFAULT (getdate()) FOR [change_date]
GO
