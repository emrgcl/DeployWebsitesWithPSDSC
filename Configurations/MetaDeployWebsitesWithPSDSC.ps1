[DSCLocalConfigurationManager()]
configuration TFSMetaConfig
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
        
        ReportServerWeb RepotrtServer1
        {
            ServerURL = $ConfigurationData.NonNodeData.DSCProdServerURL
            RegistrationKey = $ConfigurationData.NonNodeData.registrationKey
        }
           
    }
       
    Node $allnodes.Where{$_.role -eq 'UYGULAMA'}.nodename
    {
        $ConfigurationNamesArray = @()
        $ConfigurationNamesArray = @("DeployWebsitesWithPSDSC")
        
        ConfigurationRepositoryWeb Turkcell-Prod-PullSrv
        {
            ServerURL = $ConfigurationData.NonNodeData.DSCProdServerURL
            RegistrationKey = $ConfigurationData.NonNodeData.registrationKey
            ConfigurationNames = $ConfigurationNamesArray
        }

        PartialConfiguration "DeployWebsitesWithPSDSC"
        {
            Description                     = "DeployWebsitesWithPSDSC"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]RepotrtServer1")
            RefreshMode                     = 'Pull'
        }

        PartialConfiguration "$($node.role)_Roles"
        {
            Description                     = "$($node.role)_Roles"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]Turkcell-Prod-PullSrv")
            RefreshMode                     = 'Pull'
        }

        PartialConfiguration "$($node.role)_Services"
        {
            Description                     = "$($node.role)_Services"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]Turkcell-Prod-PullSrv")
            RefreshMode                     = 'Pull'
            DependsOn                       = "[PartialConfiguration]$($node.role)_Roles"
        }

        PartialConfiguration "$($node.role)_AppPool"
        {
            Description                     = "$($node.role)_AppPool"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]Turkcell-Prod-PullSrv")
            RefreshMode                     = 'Pull'
            DependsOn                       = "[PartialConfiguration]$($node.role)_Roles"
        }

        PartialConfiguration "$($node.role)_Sites"
        {
            Description                     = "$($node.role)_Sites"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]Turkcell-Prod-PullSrv")
            RefreshMode                     = 'Pull'
            DependsOn                       = "[PartialConfiguration]$($node.role)_AppPool"
        }

        PartialConfiguration "$($node.role)_Applications"
        {
            Description                     = "$($node.role)_Applications"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]Turkcell-Prod-PullSrv")
            RefreshMode                     = 'Pull'
            DependsOn                       = "[PartialConfiguration]$($node.role)_Sites"
        }
    }
}

    TFSMetaConfig -ConfigurationData .\Powershell\envanter.psd1 -OutputPath C:\temp\TFS\TFSMetaConfig