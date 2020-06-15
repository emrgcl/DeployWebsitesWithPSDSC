Configuration Install-HelloSite {
Import-DscResource -Module 'PSDesiredStateConfiguration'
Node DeployWebsitesWithPSDSC {

WindowsFeature IIS {
Ensure = 'Present'
Name ='Web-Server'

}

WindowsFeature IISManagementTools {
Ensure = 'Present'
Name ='Web-Mgmt-Tools'
DependsOn = '[WindowsFeature]IIS'

}

File SourceFiles {
SourcePath = '\\emreg-dsc\Repos\DeployWebsitesWithPSDSC\SiteContent\DeployWebsitesWithPSDSC'
DestinationPath = 'c:\inetpub\DeployWebsitesWithPSDSC'
DependsOn = '[WindowsFeature]IIS'
}


}


}

Install-HelloSite