# Powershell module for Homemeatic CCU2 Homeautomation

the goal of this module is to get information from you CCU2 without using the Web Interface.

This is helpful specially for Dokumentation, Firmwareupdates etc.

The Module can be installed from the Powershell Module Gallery.
![homematic-ccu2](https://user-images.githubusercontent.com/8255007/29993823-6b518730-8fc2-11e7-888a-052bc127d355.gif)


## Installation
```Powershell
Install-Module Homematic-CCU2 -Scope CurrentUser
Import-Module Homematic-CCU2
```

## Usage
Connect to CCU2:

```Powershell
Connect-CCU2 -ccu2_name homematic-ccu2.fritz.box -Username Admin -Password ""
```
this will retrive a Homeatic Session ID.
The SessionID and the Connection URL will be stored as Global Variables in Powershell.
To disconnect from CCU2, use
```Powershell
Disconnect-CCU2
```
## Example:
Checking Firmware States
```Powershell
 Get-CCU2DeviceFirmwareState -interface HmIP-R
 ```
 

## Error Handling
The Modules are Prepared for catchin Errors from CCU2 Calls. However, the error responses still need to be translated.






