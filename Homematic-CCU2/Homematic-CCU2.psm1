function Get-CCU2Version
{
[CmdletBinding()]
param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url
)
$method = "CCU.getVersion"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
}
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}


#CCU.restartSSHDaemon
function Restart-CCU2SSHDaemon
{
[CmdletBinding()]
param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "CCU.restartSSHDaemon"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
}
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
function Get-CCU2SSHState
{
[CmdletBinding()]
param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "CCU.getSSHState"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
}
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
#CCU.getStickyUnreachState


function Get-CCU2StickyUnreachState
{
    [CmdletBinding()]
    param(
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "CCU.StickyUnreachState"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
}
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"      
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}
function Get-CCU2Serialnumber {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "CCU.getSerial"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}



function Get-CCU2DeviceDetails {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Device.listAllDetail"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
            #'interface' = $interface
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
    #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
    #(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}


function Get-CCU2Interfaces {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.listInterfaces"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
    #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
    #(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}
#Device.get
function Get-CCU2Device
{
   [CmdletBinding()]
   param(
#[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
[Parameter(Mandatory = $true)]
#[ValidatePattern('[A-F,a-f,0-9]{14}')]
[string][alias('ID')]$Device_id,     
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Device.get"
$Json = @{   "jsonrpc" = "1.1"
           "method"= $method;
           "params"= @{'_session_id_' = $session_id;
           'id' = $Device_id}
           "id" = 1 }| ConvertTo-Json -Compress

write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
}



#Device.listAll
function Get-CCU2ConfiguredDevices {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Device.listAll"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
}
#Interface.getDeviceDescription

function Get-CCU2DeviceDescription {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidatePattern('[A-F,a-f,0-9]{14}')]
        [string][alias('device')]$address,        
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.getDeviceDescription"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
            "interface"             = $interface;
            "address"               = $address
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}

function Get-CCU2Devices
 {
    [CmdletBinding()]
    param(
[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.listDevices"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            'interface' = $interface}
            "id" = 1 }| ConvertTo-Json -Compress

write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result #| select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}

function Get-CCU2DeviceFirmwareState
{
    [CmdletBinding()]
    param(
[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.listDevices"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            'interface' = $interface}
            "id" = 1 }| ConvertTo-Json -Compress

            write-verbose "Calling method $method with $json" 
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result | select address,firmware,availableFirmware,updatable,firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
#(Invoke-RestMethod -Uri "$baseuri" -body $json -Method Post -ContentType "application/json").result | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft

}

#Interface.refreshDeployedDeviceFirmwareList

function Update-CCU2DeployedDeviceFirmwareList
{
    [CmdletBinding()]
    param(
[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url)
$method = "Interface.refreshDeployedDeviceFirmwareList"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method;
            "params"= @{'_session_id_' = $session_id;
            'interface' = $interface}
            "id" = 1 }| ConvertTo-Json -Compress

            write-verbose "Calling method $method with $json" 
Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}

#Interface.updateFirmware

function Update-CCU2DeviceFirmware {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidatePattern('[A-F,a-f,0-9]{14}')]
        [string][alias('address')]$Device,        
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.updateFirmware"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method;
        "params"           = @{'_session_id_' = $session_id;
            "device"                = $Device
            'interface'             = $interface
        }
        "id"               = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json" 
    Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}

function Connect-CCU2

{
    [CmdletBinding()]
    
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
$Login = Invoke-CCU2method -Uri $global:ccu2url -body $Json_login -Method Post -ContentType "application/json"
$global:ccu2session = $login.result
$host.ui.RawUI.WindowTitle = "Connected to $ccu2_name with SessionID $($Global:ccu2session) as $Username"
Write-Output $Login
}

function Disconnect-CCU2 {
    [CmdletBinding()]
    param(
        $ccu2_url = $Global:ccu2url,
        $Session_id = $Global:ccu2session
    )
    $Json_login = @{   "jsonrpc" = "1.1"
        "method"                 = "Session.logout"
        "params"                 = @{'_session_id_' = $session_id}
        "id"                     = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    Invoke-CCU2method -Uri $ccu2_url -body $Json_login -Method Post -ContentType "application/json"
    $host.ui.RawUI.WindowTitle = "Windows Powershell"
    
}


function Invoke-CCU2method 
{
    [CmdletBinding()]
    param
(
$uri = $Global:ccu2url,
$body,
$method = "POST",
$ContentType = "application/json" 
)    

try {
    $result = Invoke-RestMethod -Uri $uri -body $body -Method $method -ContentType $ContentType
            
}
catch {
     write-host "error calling ccu2 with $body"
     Write-Host $_.exception
     break
}
Write-Verbose $result
write-output $result
}


#system.listMethods

function Get-CCU2Methods
{
[CmdletBinding()]
param(
#$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url
)
$method = "system.listMethods"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method
            "params"= ""
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"
(Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}

function Get-CCU2methodHelp {
    [CmdletBinding()]
    param(
        $Methodname,
        $ccu2url = $global:ccu2url
    )
    $method = "system.methodHelp"
    $Json = @{   "jsonrpc" = "1.1"
        "method"           = $method
        "params"           = @{"name" = $Methodname}
        "id"               = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}

#system.describe
function Get-CCU2Api
{
[CmdletBinding()]
param(
#$session_id = $global:ccu2session,
$ccu2url = $global:ccu2url
)
$method = "system.describe"
$Json = @{   "jsonrpc" = "1.1"
            "method"= $method
            "params"= ""
            "id" = 1 }| ConvertTo-Json -Compress
write-verbose "Calling method $method with $json"
Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}