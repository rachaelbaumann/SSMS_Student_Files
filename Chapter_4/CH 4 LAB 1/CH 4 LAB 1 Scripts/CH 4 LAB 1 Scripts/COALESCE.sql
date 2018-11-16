USE PhishingSample;

SELECT L.UserID, L.CampaignID,
	COALESCE(L.TimeClickedLink, 
			 L.TimeSubmitted, 
			 L.TimeOpenedAttachment, 
			 '9999-12-31') AS ClickTime
FROM [Lookup] AS L
ORDER BY ClickTime;