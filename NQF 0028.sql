USE ;
GO
DECLARE @START_DATE DATETIME
DECLARE @END_DATE DATETIME
SET @START_DATE = '01/01/2016'
SET @END_DATE = '12/31/2016'

SELECT
CAEMP.ID, CAEMP.SORT_NAME AS [PROVIDER NAME], COUNT (DISTINCT sv.[CLIENT_ID]) AS [COUNT OF CLIENTS]

FROM CDCLSVC sv
		LEFT JOIN CDCLIENT ON sv.CLIENT_ID = CDCLIENT.ID
				AND sv.[BEG_DATE] between @START_DATE AND @END_DATE AND
				ISNULL(VOID_FLAG,'')<>'Y' AND
				[CNTTYP_ID] = 'F' AND
				[APPTYP_ID] IN (1, 2) AND
				CDCLIENT.[DOB] BETWEEN DATEADD (YEAR, -150, sv.BEG_DATE) AND DATEADD (YEAR, -13, sv.BEG_DATE)
		LEFT JOIN CAEMP ON sv.EMP_ID = CAEMP.ID 
		LEFT JOIN CDSVRCRD ON sv.EMP_ID = CDSVRCRD.EMP_ID
		LEFT JOIN CDCLDIAG ON CDCLDIAG.CLIENT_ID = CDCLIENT.ID
		LEFT JOIN CDCLINS ON CDCLINS.CLIENT_ID = CDCLIENT.ID

WHERE sv.[BEG_DATE] between @START_DATE AND @END_DATE AND
				ISNULL(VOID_FLAG,'')<>'Y' AND
				[CNTTYP_ID] = 'F' AND
				[APPTYP_ID] IN (1, 2) AND
				CDCLIENT.[DOB] BETWEEN DATEADD (YEAR, -150, sv.BEG_DATE) AND DATEADD (YEAR, -18, sv.BEG_DATE) AND
				[SVC_ID] IN ('3505', '3001', '3500', '1101', '1102', '1103', '1104', '1105', '1111', '1112', '1113', '1114',
				'1115', '1335', '1336'
				) AND CDCLDIAG.END_DATE IS NULL AND
				PAYSRC_ID = '1'

GROUP BY CAEMP.SORT_NAME, CAEMP.ID
