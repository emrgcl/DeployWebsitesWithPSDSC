[Cmdletbinding()]
Param(

    [string]$ConfigurationDataPath,
    [string]$OutPutPath

)
[DSCLocalConfigurationManager()]
configuration Deploy-MetoConfig
{
    Node $allnodes.nodename
    {
        Settings
        {
            RefreshMode = 'Pull'
            RefreshFrequencyMins = 1440 # Change this value to 1440
            ConfigurationModeFrequencyMins = 120 # Change this value to 120
            RebootNodeIfNeeded = $true
            ConfigurationMode = 'ApplyAndMonitor' #Set to ApplyAndMonitor once all configs are compliant on all nodes to be able to report on a schedule to SQL DB
            StatusRetentionTimeInDays = 30
        }
        
        ReportServerWeb PullServerReport
        {
            ServerURL = $ConfigurationData.NonNodeData.DSCProdServerURL
            RegistrationKey = $ConfigurationData.NonNodeData.registrationKey
        }
           
    }
       
    Node $allnodes.Where{$_.role -eq 'FrontEnd'}.nodename
    {
        $ConfigurationNamesArray = @()
        $ConfigurationNamesArray = @("DeployWebsitesWithPSDSC")
        
        ConfigurationRepositoryWeb DSCProdServer
        {
            ServerURL = $ConfigurationData.NonNodeData.DSCProdServerURL
            RegistrationKey = $ConfigurationData.NonNodeData.registrationKey
            ConfigurationNames = $ConfigurationNamesArray
        }
    }
}

    Deploy-MetoConfig -ConfigurationData $ConfigurationDataPath -OutputPath $OutPutPath