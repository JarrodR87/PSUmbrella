function Get-UmbrellaInternalNetworks {
    <#
        .SYNOPSIS
            Gathers Internal Network Information from the Umbrella Management Console
        .DESCRIPTION
            Collects Internal Network Information gathered by the Umbrella Virtual Appliance from the Umbrella Management Console
        .PARAMETER Key
            API Key
        .PARAMETER Secret
            Secret for API Key
        .PARAMETER OrganizationID
            Organization ID for Umbrella Management Console
        .EXAMPLE
            Get-UmbrellaInternalNetworks -Key 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -Secret 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -OrganizationID 'xxxxxxx'
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]$Key,
        [Parameter(Mandatory = $true)]$Secret,
        [Parameter(Mandatory = $true)]$OrganizationID
    ) 
    BEGIN { 
        $pair = "$($Key):$($Secret)"

        $encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
        $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
        $headers.Add("Authorization", "Basic $encodedCreds" )
    } #BEGIN

    PROCESS {
        $response = Invoke-RestMethod "https://management.api.umbrella.com/v1/organizations/$OrganizationID/internalnetworks" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response
    } #END

} #FUNCTION