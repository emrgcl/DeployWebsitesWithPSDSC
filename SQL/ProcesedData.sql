;With CTE as (

select
	--vsrf.NodeName,
	--vsrf.StartTime,
	vsrf.NodeName,
	max(vsrf.StartTime) as StartTime
	--vsrf.OperationType,
	--vsrf.StatusData,
	--vsrf.status,
	
	

from dbo.vStatusReportFixed vsrf
where vsrf.OperationType in('Consistency','Initial')
and (Json_Query(vsrf.StatusData,'$.ResourcesInDesiredState') is not null or Json_Query(vsrf.StatusData,'$.ResourcesNotInDesiredState') is not null)
Group by 	
	vsrf.NodeName
	--vsrf.NodeName,
	--vsrf.OperationType,
	--vsrf.StatusData,
	--vsrf.Status
	)

Select 	
	vsrf2.NodeName,
	vsrf2.StartTime,
	vsrf2.EndTime,
	vsrf2.status,
	vsrf2.OperationType,
	Json_Value(vsrf2.StatusData,'$.LCMVersion') as LCMVErsion,
	Json_Value(vsrf2.StatusData,'$.NumberOfResources') as NumberOfResources,
	Json_Value(vsrf2.StatusData,'$.MetaConfiguration.ConfigurationMode') as ConfigurationMode,
	Json_Value(vsrf2.StatusData,'$.MetaConfiguration.RefreshFrequencyMins') as RefreshFrequencyMins,
	Json_Value(vsrf2.StatusData,'$.MetaConfiguration.ConfigurationModeFrequencyMins') as ConfigurationModeFrequencyMins,
	Json_Query(vsrf2.StatusData,'$.ResourcesInDesiredState') as ResourcesInDesiredState,
	Json_Query(vsrf2.StatusData,'$.ResourcesNotInDesiredState') as ResourcesNotInDesiredState

from CTE 
join vStatusReportFixed vsrf2 on vsrf2.NodeName=cte.NodeName and vsrf2.StartTime=cte.StartTime
