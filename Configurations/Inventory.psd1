@{
    NonNodeData =
    @{
        registrationKey     = 'cacf30a0-3a38-4142-84e0-f77801e2b6d9'
        DSCProdServerURL    = 'https://emreg-dsc.contoso.com/psdscpullserver.svc'
    }

    AllNodes =
    @(
        @{
            NodeName    = 'emreg-web01.contoso.com'
            Role        = 'FrontEnd'
            Location    = 'Test'
        }
    )
}
