USE [CTM_TeaM]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CTM_CryptPwd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CTM_CryptPwd]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

-----------------------------------------------------------
-- Effect Web MuOnline
-- CTM_CheckLogin
-- Release 30/06/2011
-- Powered by Erick-Master
-----------------------------------------------------------

CREATE PROCEDURE [dbo].[CTM_CryptPwd]
@Account VARCHAR(10),
@Password VARCHAR(10)
AS
BEGIN

DECLARE @Hash BINARY(16);
EXEC master..XP_MD5_EncodeKeyVal @Password, @Account, @Hash OUT;
UPDATE MuOnline.dbo.MEMB_INFO SET memb__pwd = @Hash WHERE memb___id = @Account;

END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

