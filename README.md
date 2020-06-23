# DeployWebsitesWithPSDSC
Deploy web sites with PowerShell DSC


```Json
{
   "StartDate":"2020-06-23T14:58:38.7750000+00:00",
   "IPV6Addresses":[
      "fe80::9151:1193:b5c3:d898%5",
      "::2000:0:0:0",
      "::1",
      "::2000:0:0:0"
   ],
   "DurationInSeconds":"2",
   "JobID":"{04A31CF2-B562-11EA-8D5E-000D3A1D6993}",
   "CurrentChecksum":"D1B3946BAA325AA97158882ECC04A81013079A1CA9027E385D6E2F8D0B0F9578",
   "MetaData":"Author: emre; Name: Install-HelloSite; Version: 2.0.0; GenerationDate: 06/15/2020 13:41:09; GenerationHost: emreg-dsc;",
   "RebootRequested":"False",
   "Status":"Success",
   "IPV4Addresses":[
      "10.10.0.9",
      "127.0.0.1"
   ],
   "LCMVersion":"2.0",
   "ResourcesNotInDesiredState":[
      {
         "StartDate":"2020-06-23T14:58:40.9780000+00:00",
         "DurationInSeconds":"0.047",
         "ModuleVersion":"1.1",
         "ResourceName":"File",
         "ResourceId":"[File]SourceFiles",
         "InDesiredState":"False",
         "StateChanged":"False",
         "ConfigurationName":"Install-HelloSite",
         "InstanceName":"SourceFiles",
         "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsDeployWebSitesWithPSDSC.ps1::24::9::File",
         "ModuleName":"PSDesiredStateConfiguration",
         "DependsOn":[
            "[WindowsFeature]IIS"
         ],
         "RebootRequested":"False"
      }
   ],
   "NumberOfResources":"5",
   "Type":"Consistency",
   "HostName":"emreg-web01",
   "ResourcesInDesiredState":[
      {
         "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsDeployWebSitesWithPSDSC.ps1::11::9::WindowsFeature",
         "ModuleName":"PSDesiredStateConfiguration",
         "DurationInSeconds":"0.813",
         "InstanceName":"IIS",
         "StartDate":"2020-06-23T14:58:39.8060000+00:00",
         "ResourceName":"WindowsFeature",
         "StateChanged":"False",
         "ModuleVersion":"1.1",
         "RebootRequested":"False",
         "ResourceId":"[WindowsFeature]IIS",
         "ConfigurationName":"Install-HelloSite",
         "InDesiredState":"True"
      },
      {
         "StartDate":"2020-06-23T14:58:40.6190000+00:00",
         "DurationInSeconds":"0.359",
         "ModuleVersion":"1.1",
         "ResourceName":"WindowsFeature",
         "ResourceId":"[WindowsFeature]IISManagementTools",
         "InDesiredState":"True",
         "StateChanged":"False",
         "ConfigurationName":"Install-HelloSite",
         "InstanceName":"IISManagementTools",
         "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsDeployWebSitesWithPSDSC.ps1::17::9::WindowsFeature",
         "ModuleName":"PSDesiredStateConfiguration",
         "DependsOn":[
            "[WindowsFeature]IIS"
         ],
         "RebootRequested":"False"
      },
      {
         "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsDeployWebSitesWithPSDSC.ps1::33::9::xWebAppPool",
         "ModuleName":"xWebAdministration",
         "DurationInSeconds":"0.438",
         "InstanceName":"DeployWebsitesWithPSDSC",
         "StartDate":"2020-06-23T14:58:41.0250000+00:00",
         "ResourceName":"xWebAppPool",
         "StateChanged":"False",
         "ModuleVersion":"3.1.1",
         "RebootRequested":"False",
         "ResourceId":"[xWebAppPool]DeployWebsitesWithPSDSC",
         "ConfigurationName":"Install-HelloSite",
         "InDesiredState":"True"
      },
      {
         "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsDeployWebSitesWithPSDSC.ps1::41::9::xWebsite",
         "ModuleName":"xWebAdministration",
         "DurationInSeconds":"0.25",
         "InstanceName":"DeployWebsitesWithPSDSC",
         "StartDate":"2020-06-23T14:58:41.4630000+00:00",
         "ResourceName":"xWebSite",
         "StateChanged":"False",
         "ModuleVersion":"3.1.1",
         "RebootRequested":"False",
         "ResourceId":"[xWebSite]DeployWebsitesWithPSDSC",
         "ConfigurationName":"Install-HelloSite",
         "InDesiredState":"True"
      }
   ],
   "MACAddresses":[
      "00-0D-3A-1D-69-93"
   ],
   "MetaConfiguration":{
      "AgentId":"4449425D-AF9D-11EA-8D5A-000D3A1D6993",
      "ConfigurationDownloadManagers":[
         {
            "RegistrationKey":"",
            "ServerURL":"https://emreg-dsc.contoso.com/psdscpullserver.svc",
            "ResourceId":"[ConfigurationRepositoryWeb]DSCProdServer",
            "ConfigurationNames":[
               "DeployWebsitesWithPSDSC"
            ],
            "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsMetaDeployWebsitesWithPSDSC.ps1::36::9::ConfigurationRepositoryWeb"
         }
      ],
      "ActionAfterReboot":"ContinueConfiguration",
      "LCMCompatibleVersions":[
         "1.0",
         "2.0"
      ],
      "LCMState":"Idle",
      "ResourceModuleManagers":[

      ],
      "ReportManagers":[
         {
            "RegistrationKey":"",
            "ServerURL":"https://emreg-dsc.contoso.com/psdscpullserver.svc",
            "ResourceId":"[ReportServerWeb]PullServerReport",
            "SourceInfo":"C:ReposDeployWebsitesWithPSDSCConfigurationsMetaDeployWebsitesWithPSDSC.ps1::23::9::ReportServerWeb"
         }
      ],
      "StatusRetentionTimeInDays":"30",
      "LCMVersion":"2.0",
      "MaximumDownloadSizeMB":"500",
      "ConfigurationMode":"MonitorOnly",
      "RefreshFrequencyMins":"1440",
      "RebootNodeIfNeeded":"True",
      "SignatureValidationPolicy":"NONE",
      "RefreshMode":"Pull",
      "DebugMode":[
         "NONE"
      ],
      "LCMStateDetail":"",
      "AllowModuleOverwrite":"False",
      "ConfigurationModeFrequencyMins":"120",
      "SignatureValidations":[

      ]
   },
   "Locale":"en-US",
   "Mode":"Pull"
}
```