function Get-CCU2Devices
{
param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Device.listAllDetail"
#$method = "Device.listAllDetail"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            #'interface' = $interface
}
            "id" = 1 }| ConvertTo-Json -Compress

$Json
(Invoke-RestMethod -Uri $ccu2url -body $json -Method Post -ContentType "application/json" -Verbose).result 
#| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}


function Get-CCU2Interfaces
{
param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.listInterfaces"
#$method = "Device.listAllDetail"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            }
            "id" = 1 }| ConvertTo-Json -Compress

$Json
(Invoke-RestMethod -Uri $ccu2url -body $json -Method Post -ContentType "application/json" -Verbose).result 
#| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}

function Get-CCU2Actors
{
param(
[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.listDevices"
#$method = "Device.listAllDetail"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            'interface' = $interface}
            "id" = 1 }| ConvertTo-Json -Compress

$Json
(Invoke-RestMethod -Uri $ccu2url -body $json -Method Post -ContentType "application/json" -Verbose).result #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}

function Get-CCU2ActorsFirmwareState
{
param(
[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.listDevices"
#$method = "Device.listAllDetail"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            'interface' = $interface}
            "id" = 1 }| ConvertTo-Json -Compress

$Json
(Invoke-RestMethod -Uri $ccu2url -body $json -Method Post -ContentType "application/json" -Verbose).result | select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}


function Connect-CCU2
{
param(
$ccu2_name = "homematic-ccu2.fritz.box",
$Username = "Admin",
$Password = ""

)
$global:ccu2url = "http://$ccu2_name/api/homematic.cgi"

$Json_login = @{   "jsonrpc" = "1.1"
            "method"= "Session.login"
            "params"= @{'username' = $Username
                        "password" = $Password}
            "id" = 1 }| ConvertTo-Json -Compress

$Login = Invoke-RestMethod -Uri $global:ccu2url -body $Json_login -Method Post -ContentType "application/json"  -Verbose
$global:ccu2session = $login.result
Write-Output $Login
}

function Disconnect-CCU2
{
param(
$ccu2_url =  $Global:ccu2url,
$Session_id = $Global:ccu2session
)
$Json_login = @{   "jsonrpc" = "1.1"
            "method"= "Session.logout"
            "params"= @{'_session_id_' = $session_id}
            "id" = 1 }| ConvertTo-Json -Compress
Invoke-RestMethod -Uri $ccu2_url -body $Json_login -Method Post -ContentType "application/json"  -Verbose

}


