Param(

    [string]$OutputPath
)
Configuration Install-HelloSite {

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DSCResource -ModuleName xWebAdministration
    Node DeployWebsitesWithPSDSC {

        WindowsFeature IIS {
            Ensure = 'Present'
            Name   = 'Web-Server'

        }

        WindowsFeature IISManagementTools {
            Ensure    = 'Present'
            Name      = 'Web-Mgmt-Tools'
            DependsOn = '[WindowsFeature]IIS'

        }

        File SourceFiles {
            SourcePath      = '\\emreg-dsc\Repos\DeployWebsitesWithPSDSC\SiteContent\DeployWebsitesWithPSDSC'
            DestinationPath = 'c:\inetpub\DeployWebsitesWithPSDSC'
            DependsOn       = '[WindowsFeature]IIS'
            Checksum = 'SHA-256'
            Recurse = $true
            MatchSource = $true
        }

        xWebAppPool "DeployWebsitesWithPSDSC"
        {
            Name = "DeployWebsitesWithPSDSC"
            managedPipelineMode = "Integrated"
            managedRuntimeVersion = "v4.0"
            State = "Started"
            
        }

        xWebsite "DeployWebsitesWithPSDSC"
        {
            Name = "DeployWebsitesWithPSDSC"
            PhysicalPath = "c:\Inetpub\DeployWebsitesWithPSDSC"
            ApplicationPool = "DeployWebsitesWithPSDSC"
            State = "Started"
            BindingInfo = @(
				MSFT_xWebBindingInformation
				{
					Protocol = "http";
					SslFlags = 0;
					IPAddress = "*";
					Port = 4444;
					Hostname = "";
                }
            )

        }  

    }


}

Install-HelloSite -Outputpath  $OutputPath