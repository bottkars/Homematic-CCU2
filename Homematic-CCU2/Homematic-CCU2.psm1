function Get-CCU2Version {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url
    )
    $method = "CCU.getVersion"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
#CCU.restartSSHDaemon
function Restart-CCU2SSHDaemon {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "CCU.restartSSHDaemon"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
function Get-CCU2SSHState {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "CCU.getSSHState"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
#CCU.getStickyUnreachState
function Get-CCU2StickyUnreachState {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "CCU.StickyUnreachState"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"      
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}
function Get-CCU2Serialnumber {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "CCU.getSerial"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
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
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            #'interface' = $interface
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}
function Get-CCU2Interfaces {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.listInterfaces"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}
#Device.get
function Get-CCU2Device {
    [CmdletBinding()]
    param(
        #[ValidateSet('BidCos-RF','HmIP-RF','VirtualDevices')]$interface = "HmIP-RF",
        [Parameter(Mandatory = $true)]
        #[ValidatePattern('[A-F,a-f,0-9]{14}')]
        [string][alias('ID')]$Device_id,     
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Device.get"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'id'                             = $Device_id
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
#Device.listAll
function Get-CCU2ConfiguredDevices {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Device.listAll"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
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
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            "interface"                      = $interface;
            "address"                        = $address
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}

function Get-CCU2Devices {
    [CmdletBinding()]
    param(
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.listDevices"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'interface'                      = $interface
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result 
}

function Get-CCU2DeviceFirmwareState {
    [CmdletBinding()]
    param(
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.listDevices"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'interface'                      = $interface
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json" 
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result | select address, type, firmware, availableFirmware, updatable, firmwareUpdateState | where address -notmatch ":" |  Sort-Object -Descending -Property firmwareUpdateState | ft
}

#Interface.getInstallMode
function Get-CCU2HmIPInstallMode {
    [CmdletBinding()]
    param(
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.getInstallMode"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'interface'                      = $interface;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json" 
    Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}
#Interface.setInstallModeHMIP
#_session_id_ installMode interface on time address key keymode
function Set-CCU2HmIPInstallMode {
    [CmdletBinding()]
    param(
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        #[parameter(mandatory = $false)][ValidateRange(1,120)][int]$time = 60,
        $ccu2url = $global:ccu2url)
    $method = "Interface.setInstallModeHMIP"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'interface'                      = $interface;
            'installMode'                    = 'online'
            'on'                             = '1';
            'address'                        = '';
            'key'                            = ''
            'keymode'                        = ''
            'time'                           = ''
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json" 
    Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}
#Interface.refreshDeployedDeviceFirmwareList
function Update-CCU2DeployedDeviceFirmwareList {
    [CmdletBinding()]
    param(
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.refreshDeployedDeviceFirmwareList"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'interface'                      = $interface
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json" 
    Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}
#Interface.updateFirmware
function Update-CCU2DeviceFirmware {
    [CmdletBinding()]
    param(
        #[Parameter(Mandatory = $true)]
        #[ValidatePattern('[A-F,a-f,0-9]{14}')]
        [string][alias('address')]$Device,        
        [ValidateSet('BidCos-RF', 'HmIP-RF', 'VirtualDevices')]$interface = "HmIP-RF",
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Interface.updateFirmware"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            "device"                         = $Device
            'interface'                      = $interface
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json" 
    Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
}

function Connect-CCU2 {
    [CmdletBinding()]
    
    param(
        $ccu2_name = "homematic-ccu2.fritz.box",
        $Username = "Admin",
        $Password = ""

    )
    $global:ccu2url = "http://$ccu2_name/api/homematic.cgi"

    $json = [ordered]@{   "jsonrpc" = "1.0"
        "method"                    = "Session.login"
        "params"                    = [ordered]@{'username' = $Username
            "password"                   = $Password
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    [System.Net.ServicePointManager]::Expect100Continue = $false            
    $Login = Invoke-CCU2method -Uri $global:ccu2url -body $json -Method Post -ContentType "application/json"
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
    $json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = "Session.logout"
        "params"                    = [ordered]@{'_session_id_' = $session_id}
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    Invoke-CCU2method -Uri $ccu2_url -body $json -Method Post -ContentType "application/json"
    $host.ui.RawUI.WindowTitle = "Windows Powershell"
    
}
#Session.renew
function Update-CCU2Session {
    [CmdletBinding()]
    param(
        $ccu2_url = $Global:ccu2url,
        $Session_id = $Global:ccu2session
    )
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = "Session.renew"
        "params"                    = [ordered]@{'_session_id_' = $session_id}
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    Invoke-CCU2method -Uri $ccu2_url -body $Json -Method Post -ContentType "application/json"
    $host.ui.RawUI.WindowTitle = "Windows Powershell"
}

function Invoke-CCU2method {
    [CmdletBinding()]
    param
    (
        $uri = $Global:ccu2url,
        $body,
        $method = "POST",
        $ContentType = "application/json" 
    )    

    try {
        $result = Invoke-RestMethod -Uri $uri -body $body -Method $method -ContentType $ContentType -TimeoutSec 60 -UseBasicParsing
            
    }
    catch {
        write-host "error calling ccu2 with $body"
        Write-Host $_.exception
        break
    }
    if ($($result.error)) {
        write-warning "We got $($result.error), will evaluate $($result.error.code)"
        switch ($result.error.code) {
            100	{
                write-Host "illegal request"
            }
            101	{
                write-host "the element 'ID' missing in request"
            }
            102	{
                write-host "the element 'method' missing in request"
            }
            103	{
                write-host "the element 'parameters' missing in request"
            }
            200	{
                write-host "illegal response"
            }
            201	{
                write-host "the element 'ID' missing in response"
            }
            202	{
                write-host "the element 'result' missing in response"
            }
            203	{
                write-host "the element 'error' missing in response"
            }
            300	{
                write-host "internal error"
            }
            400	{
                write-host "user level insufficient"
            }
            401	{
                write-host "method not found"
            }
            402	{
                write-host "argument not found"
            }
            501	{
                write-host "WebSite might not be ready yet, did you reboot the CCU2 ?"    
            }
            default {
                write-host "Application Specific error $($result.error.code) occured"
            } 
        }
        break
    }
    Write-Verbose $result
    write-output $result
}


#Device.getNewDeviceCount
function Get-CCU2NewDevicesCount {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url
    )
    $method = "Device.getNewDeviceCount"
    $Json = [ordered]@{   "jsonrpc" = "1.1";
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id}
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}

#system.listMethods
function Get-CCU2Methods {
    [CmdletBinding()]
    param(
        $ccu2url = $global:ccu2url
    )
    $method = "system.listMethods"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method
        "params"                    = ""
        "id"                        = 1 
    }| ConvertTo-Json -Compress
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
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method
        "params"                    = [ordered]@{"name" = $Methodname}
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}

#system.describe
function Get-CCU2Api {
    [CmdletBinding()]
    param(
        #$session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url
    )
    $method = "system.describe"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method
        "params"                    = ""
        "id"                        = 1 
    }| ConvertTo-Json -Compress
    write-verbose "Calling method $method with $json"
    $api = Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
    #cleaning wron formatted json
    $myresult = $api -replace ",}", "}" | ConvertFrom-Json
    write-output $myresult.result
}

#Subsection.listAll	
function Get-CCU2AllSubsections {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Subsection.listAll"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}


#Subsection.listAll	
function Get-CCU2AllSubsectionsDetail {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Subsection.getAll"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    $myresult = Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
    $myresult = $myresult -replace "\\", "" | ConvertFrom-Json
    Write-Output $myresult.result
}
#Subsection.get

function Get-CCU2Subsection {
    [CmdletBinding()]
    param(
        [parameter(mandatory = $true)][string][alias('ID')]$channel_id,     
    
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "Subsection.get"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'id'                             = $channel_id
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    $myresult = Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json"
    $myresult = $myresult -replace "\\", "" | ConvertFrom-Json
    Write-Output $myresult.result
}


#SysVar.getAll

function Get-CCU2AllSysVars {
    [CmdletBinding()]
    param(
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "SysVar.getAll"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}

#SysVar.get

function Get-CCU2SysVar {
    [CmdletBinding()]
    param(
        [parameter(mandatory = $true)][string][alias('ID')]$var_id,     
        $session_id = $global:ccu2session,
        $ccu2url = $global:ccu2url)
    $method = "SysVar.get"
    $Json = [ordered]@{   "jsonrpc" = "1.1"
        "method"                    = $method;
        "params"                    = [ordered]@{'_session_id_' = $session_id;
            'id'                             = $var_id    
        }
        "id"                        = 1 
    }| ConvertTo-Json -Compress

    write-verbose "Calling method $method with $json"
    (Invoke-CCU2method -Uri $ccu2url -body $json -Method Post -ContentType "application/json").result
}
