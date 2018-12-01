SELECT SUM(CONVERT(int,PA.Myocardial_infarction)) AS Myocardial_infarctionCount
	, SUM(CONVERT(int,PA.Congestive_heart_failure)) AS Congestive_heart_failureCount
	, SUM(CONVERT(int,PA.Peripheral_vascular_disease)) AS Peripheral_vascular_diseaseCount
	,SUM(CONVERT(int, PA.Stroke)) AS StrokeCount
	 ,SUM(CONVERT(int, Dementia)) AS DementiaCount
      ,SUM(CONVERT(int, Pulmonary)) AS PulmonaryCount
      ,SUM(CONVERT(int, Rheumatic)) AS RheumaticCount
      ,SUM(CONVERT(int, Peptic_ulcer_disease)) AS Peptic_ulcer_diseaseCount
      ,SUM(CONVERT(int, LiverMild)) AS LiverMildCount
      ,SUM(CONVERT(int, Diabetes_without_complications)) AS Diabetes_without_complicationsCount
      ,SUM(CONVERT(int, Diabetes_with_complications)) AS Diabetes_with_complicationsCount
      ,SUM(CONVERT(int, Paralysis)) AS ParalysisCount
      ,SUM(CONVERT(int, Renal)) AS RenalCount
      ,SUM(CONVERT(int, Cancer)) AS CancerCount
      ,SUM(CONVERT(int, LiverSevere)) AS LiverSevereCount
      ,SUM(CONVERT(int, Metastatic_solid_tumour)) AS Metastatic_solid_tumourCount
      ,SUM(CONVERT(int, HIV)) AS HIVCount
      ,SUM(CONVERT(int, Obesity)) AS ObesityCount
      ,SUM(CONVERT(int, Depression)) AS DepressionCount
      ,SUM(CONVERT(int, Hypertension)) AS HypertensionCount
      ,SUM(CONVERT(int, Drugs)) AS DrugsCount
      ,SUM(CONVERT(int, Alcohol)) AS AlcoholCountCount
FROM PatientAnalytics AS PA
WHERE PA.death = 'Yes' AND PA.mortality_score < .3
;

 