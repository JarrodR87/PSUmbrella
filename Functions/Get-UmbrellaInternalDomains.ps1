function Get-UmbrellaInternalDomains {
    <#
        .SYNOPSIS
            Collects all Internal Domain Information Umbrella is aware of from the Umbrella Management Console
        .DESCRIPTION
            Gathers the following information regarding Internal Domains from the Umbrella Management Console. Domain, Description, Creation Date, and Modified Date
        .PARAMETER Key
            API Key
        .PARAMETER Secret
            Secret for API Key
        .PARAMETER OrganizationID
            Organization ID for Umbrella Management Console
        .EXAMPLE
            Get-UmbrellaInternalDomains -Key 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -Secret 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -OrganizationID 'xxxxxxx'
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
        $response = Invoke-RestMethod "https://management.api.umbrella.com/v1/organizations/$OrganizationID/internaldomains" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response
    } #END

} #FUNCTION