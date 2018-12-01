USE PhishingSample;

--Step #14
SELECT UserID, CampaignID
FROM [Lookup]
;

--Step #15
SELECT UserID, CampaignID
	, COALESCE(TimeClickedLink, TimeSubmitted
						, TimeOpenedAttachment, '9999-12-31'
					  ) AS ClickTime
FROM [Lookup]
ORDER BY ClickTime
;