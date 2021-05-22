function Get-UmbrellaVirtualAppliances {
    <#
        .SYNOPSIS
            Collects all Virtual Appliance Information from the Umbrella Management Console
        .DESCRIPTION
            Gathers Collectors, Virtual Appliances, and Domain Controllers from the Umbrella Management Console
        .PARAMETER Key
            API Key
        .PARAMETER Secret
            Secret for API Key
        .PARAMETER OrganizationID
            Organization ID for Umbrella Management Console
        .EXAMPLE
            Get-UmbrellaVirtualAppliances -Key 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -Secret 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -OrganizationID 'xxxxxxx'
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
        $response = Invoke-RestMethod "https://management.api.umbrella.com/v1/organizations/$OrganizationID/virtualappliances" -Method 'GET' -Headers $headers -Body $body
    } #PROCESS

    END { 
        $response
    } #END

} #FUNCTION