USE HealthCareSample;

SELECT PatientID FROM OutpatientVisit 
WHERE VisitDate BETWEEN '20070101' and '20071231'
EXCEPT
SELECT PatientID FROM OutpatientVisit 
WHERE VisitDate BETWEEN '20170101' and '20171231'
;