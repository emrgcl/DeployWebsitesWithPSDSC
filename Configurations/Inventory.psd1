@{
    NonNodeData =
    @{
        registrationKey     = '8dada20f-b6f8-41e7-8d3c-099cc3c6bf14'
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
