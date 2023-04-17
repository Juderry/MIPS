USE analive;
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
				CDCLIENT.[DOB] BETWEEN DATEADD (YEAR, -150, sv.BEG_DATE) AND DATEADD (YEAR, -13, sv.BEG_DATE) AND
				DIAG_ID IN ('30300','30301','30302','30303','30310','30320','30330', '3039', '30390', '30391', '30392', '30393',
				'30400', '30401', '30402', '30403', '30410', '30411', '30412', '30413', '30420', '30421', '30422', '30423', '30430',
				'30431', '30432', '30433', '30440', '30441', '30442', '30443', '30450', '30451', '30452', '30453', '30460', '30462',
				'30463', '30470', '30471', '30472', '30473', '30480', '30481', '30482', '30483', '30490', '30491', '30493', 'F10.10',
				'F10.121', 'F10.129', 'F10.14', 'F10.159', 'F10.180', 'F10.181', 'F10.182', 'F10.20', 'F10.221', 'F10.229', 'F10.231',
				'F10.232', 'F10.239', 'F10.24', 'F10.259', 'F10.26', 'F10.27', 'F10.280', 'F10.281', 'F10.282', 'F10.288', 'F10.921',
				'F10.929', 'F10.94', 'F10.959', 'F10.96', 'F10.97', 'F10.980', 'F10.981', 'F10.982', 'F10.988', 'F10.99', 'F11.10',
				'F11.121', 'F11.122', 'F11.129', 'F11.14', 'F11.181', 'F11.182', 'F11.188', 'F11.20', 'F11.221', 'F11.222', 'F11.229',
				'F11.23', 'F11.24', 'F11.281', 'F11.282', 'F11.288', 'F11.921', 'F11.922', 'F11.929', 'F11.94', 'F11.981', 'F11.982',
				'F11.988', 'F11.99', 'F12.10', 'F12.121', 'F12.122', 'F12.129', 'F12.159', 'F12.180', 'F12.188', 'F12.20', 'F12.221',
				'F12.222', 'F12.229', 'F12.259', 'F12.280', 'F12.288', 'F12.921', 'F12.922', 'F12.929', 'F12.959', 'F12.980', 'F12.988',
				'F12.99', 'F13.10', 'F13.121', 'F13.129', 'F13.14', 'F13.159', 'F13.180', 'F13.181', 'F13.182', 'F13.20', 'F13.221',
				'F13.229', 'F13.231', 'F13.232', 'F13.239', 'F13.24', 'F13.259', 'F13.27', 'F13.280', 'F13.281', 'F13.282', 'F13.288',
				'F13.921', 'F13.929', 'F13.94', 'F13.959', 'F13.97', 'F13.980', 'F13.981', 'F13.982', 'F13.988', 'F13.99', 'F14.10',
				'F14.121', 'F14.122', 'F14.14', 'F14.129', 'F14.20', 'F14.159', 'F14.180', 'F14.181', 'F14.182', 'F14.23', 'F14.24',
				'F14.188', 'F14.221', 'F14.222', 'F14.229', 'F14.259', 'F14.280', 'F14.281', 'F14.282', 'F14.288', 'F14.94', 'F14.99',
				'F14.921', 'F14.922', 'F15.10', 'F14.929', 'F15.14', 'F14.959', 'F14.980', 'F14.981', 'F14.982', 'F14.988', 'F15.121',
				'F15.122', 'F15.129', 'F15.159', 'F15.180', 'F15.20', 'F15.181', 'F15.182', 'F15.188', 'F15.221', 'F15.23', 'F15.24',
				'F15.222', 'F15.229', 'F15.93', 'F15.259', 'F15.94', 'F15.280', 'F15.281', 'F15.282', 'F15.288', 'F15.921', 'F15.922',
				'F15.929', 'F15.959', 'F15.99', 'F15.980', 'F16.10', 'F15.981', 'F15.982', 'F15.988', 'F16.121', 'F16.129', 'F16.159',
				'F16.180', 'F16.221', 'F16.20', 'F16.229', 'F16.24', 'F16.259', 'F16.280', 'F16.929', 'F16.959', 'F16.94', 'F16.980',
				'F16.983', 'F16.99', 'F17.200', 'F17.203', 'F18.10', 'F17.203', 'F17.209', 'F17.210', 'F18.121', 'F18.129', 'F18.159',
				'F18.180', 'F18.14', 'F18.188', 'F18.20', 'F18.17', 'F18.221', 'F18.229', 'F18.24', 'F18.259', 'F18.27', 'F18.280',
				'F18.288', 'F18.921', 'F18.929', 'F18.94', 'F18.99', 'F18.959', 'F18.980', 'F18.988', 'F19.121', 'F19.10', 'F19.129',
				'F19.14', 'F19.159', 'F19.17', 'F19.180', 'F19.20', 'F19.181', 'F19.182', 'F19.188', 'F19.221', 'F19.21', 'F19.229',
				'F19.231', 'F19.239', 'F19.24', 'F19.27', 'F19.94', 'F19.259', 'F19.280', 'F19.281', 'F19.282', 'F19.97', 'F19.288',
				'F19.921', 'F19.939', 'F19.99', 'F19.959', 'F19.980', 'F19.981', 'F19.982', 'F19.988', 'K29.20', 'K70.0', 'K29.21', 
				'K70.10', 'K70.11', 'K70.2', 'K70.30', 'K70.31', 'K70.40', 'K70.41', 'K70.9'
				) AND
				PAYSRC_ID = '1' AND 
		CAEMP.ID IN ('379', '1556', '2069', '2695', '2753', '4452', '5743', '5910', '5946', '5998', '5999', '6021', '6026', 
			'10154', '10226', '10423', '10581', '13137', '13431', '13537', '14033', '14143', '14218', '14286', '14770', '14824', 
			'15048', '15059', '15748', '15771', '15772', '15864', '15891', '16002', '16021', '16022', '16097', '16150', '16239',
			'16245', '16277', '16294', '16388', '16499', '16574', '16604', '16627', '16691', '16743', '16754', '16759', '16777',
			'16778', '16884', '16906', '16976', '16989', '17045', '17082', '17103', '17105', '17111', '17116', '17124', '17146', 
			'17155', '17223', '17234', '17243', '17307', '17321', '100027', '100028', '100052', '100099', '100156', '100171',
			'100184', '100207', '100215', '100235', '100278', '100284', '100346', '100349', '100364', '100455', '100484',
			'100488', '100492', '100511'

)

GROUP BY CAEMP.SORT_NAME, CAEMP.ID