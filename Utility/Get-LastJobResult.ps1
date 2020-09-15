function GetReport
{
    param
    (
        $AgentId = "$((Get-DscLocalConfigurationManager).AgentId)", 
        $serviceURL = "https://emreg-dsc.contoso.com/psdscpullserver.svc"
    )

    $requestUri = "$serviceURL/Nodes(AgentId= '$AgentId')/Reports"
    $request = Invoke-WebRequest -Uri $requestUri  -ContentType "application/json;odata=minimalmetadata;streaming=true;charset=utf-8" `
               -UseBasicParsing -Headers @{Accept = "application/json";ProtocolVersion = "2.0"} `
               -ErrorAction SilentlyContinue -ErrorVariable ev
    $object = ConvertFrom-Json $request.content
    return $object.value
}
$Results = GetReport

$LastJobIDTrimmed = ((Get-DscConfigurationStatus).JobID).trim('{}')

$LastJobResult = $Results.Where({$_.Jobid -eq $LastJobIDTrimmed})

$LastJobResult.StatusData | ConvertFrom-Json