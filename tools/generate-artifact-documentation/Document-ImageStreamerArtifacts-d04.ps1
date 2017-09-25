# (c) Copyright 2017 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at #http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES #OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

<#
    .SYNOPSIS
    Tool to documents the contents of a HPE Synergy Image Streamer zip file

    .NOTES

    .DESCRIPTION
    Reads a HPE Synergy Image Streamer Artifact zip file (or folder)
    and document the contents
    There are options to list the scripts themselves and send the output to a
    text file

    .PARAMETER  File
    Path to the Artifact zip file

    Note: The parameters File and Folder are mutually exculsive

    .PARAMETER  Folder
    Path a folder containg the contents of a artifact ZIP file
    Documenting a folder is quicker as it the zip does not have to be expanded

    Note: The parameters File and Folder are mutually exculsive

    .PARAMETER  Full
    Document the steps in each build plan


    .EXAMPLE
    PS> .\document-ImageStreamerArtifacts.ps1 -file HPE_Foundation_Artifacts_1_00-2016-08-30a.zip
    Investigate contents of Artifact HPE_Foundation_Artifacts_1_00-2016-08-30a.zip

    .EXAMPLE
    PS> .\document-ImageStreamerArtifacts.ps1 -folder HPE_Foundation_Artifacts_1_00-2016-08-30a
    Investigate contents of FOLDER containing Artifacts

    .EXAMPLE
    PS> .\document-ImageStreamerArtifacts.ps1 -folder HPE_Foundation_Artifacts_1_00-2016-08-30a -full
    List artifact contents and the contents of the scripts

    .INPUTS
        Formal parameters only.
        Pipeline input is not accepted.

    .OUTPUTS
        File with name or folder or zip file being investigated with but with .txt extension.
        The output file is written to the same folder location as folder/ file being investigated

    .COMPONENT
#>

[CmdletBinding()]
param(
[Parameter(ParameterSetName="ZipFile",Mandatory=$true)]
    [string]$file,

    [Parameter(ParameterSetName="Folder",Mandatory=$true)]
    [string]$folder="C:\Users\PACKJ\OneDrive - Hewlett Packard Enterprise\_DCCWW\_534ImageStreamingService\Documentation\Artifacts\HPE-ESXi-2016-11-25",

    [Parameter(ParameterSetName="ZipFile")]
    [Parameter(ParameterSetName="Folder")]
    [switch]$full=$false,

    [Parameter(ParameterSetName="ZipFile")]
    [Parameter(ParameterSetName="Folder")]
    [switch]$OutputTextFile=$false,

    [Parameter(ParameterSetName="ZipFile")]
    [Parameter(ParameterSetName="Folder")]
    [switch]$ListeTagErrors=$false
    )

################################################################################
#Error handling (and debugging)
#

#Enforce variable declaration and other PS good practice
Set-PSDebug -Strict
Set-StrictMode -Version latest

#Set ErrorAction and DebugPreference
    if (($psboundparameters.containskey("debug")) -and ($psboundparameters.debug.ispresent)) {
        $ErrorActionPreference = "stop"
        $DebugPreference = "Continue"
        Write-Debug "Debug is set on"
        }
    else {
        $ErrorActionPreference = "Continue"
        $DebugPreference = "SilentlyContinue"
        }

################################################################################
#Functions
#
function delete-tempFolder {
    write-verbose "Checking for and deleteing temp folder"

    if (test-path variable:strTempFolder) {
        #The folder name got set, does the folder exist
        if (test-path $strTempFolder) {
            Write-Verbose "Deleting temp folder"
            remove-item -Path $strTempFolder -Recurse -Force -ErrorAction Continue
            }
        }
    }

function exit-fatal ([string]$strErrorMessage) {
<#
    .SYNOPSIS
    Single point of exit for fatal/ stop errors
#>
    #Don't stop for new errors
    $ErrorActionPreference = "Continue"

    #Remove temp folder
    If ($PsCmdlet.ParameterSetName -eq "ZipFile") {delete-tempFolder}
    write-error $strErrorMessage -ErrorAction stop
    }

function Expand-ZIPFile($strfile, $strdestination) {
    #Check source and destination exist
    if(-not (test-path -PathType leaf $strfile)) {
        exit-fatal "Expand-ZIPFile called, source file '$strfile' does not exist"
        }
    if(-not (test-path -PathType container $strdestination)) {
        exit-fatal "Expand-ZIPFile called, destination folder '$strdestination' does not exist"
        }

    $objShell = new-object -com shell.application
    $objZip = $objShell.NameSpace($strfile)
    foreach($objFile in $objzip.items()) {
        $objShell.Namespace($strdestination).copyhere($objFile)
        }
    }

function Output ([string]$strLine) {
    #Emit to pipeline/ console output
    $strLine

    #Save for writting as file
    if ($OutputTextFile) {
        if ($strOutPut.length -eq 0) {
            $script:strOutPut += $strLine
            }
        else {
            $script:strOutPut += "`n" + $strLine
            }
        }
}

################################################################################
#Glolal Variables
#
[string]$strOutPut = ""



################################################################################
#Script
#
#Check parameter combinations and values
switch ($PsCmdlet.ParameterSetName) {
    "ZipFile" {
        Write-Debug "Parameter Set: ZipFile"
        #Check file exists and is a zip file
        if (test-path -PathType Leaf $file) {
            Write-Verbose "Zip file exists [$file]"
            }
        else {
            exit-fatal "File or path invalid [$file]"
            }
        #Get folder Zip file resides in (for -$OutputTextFile)
        $strOutPutFilePath = split-path -Parent  $file #Get the folder
        $strOutPutFilePath = join-path $strOutPutFilePath $($(split-path -leaf $file) -replace "^(.*)\.zip$",'$1.txt')
        }

    "Folder" {
        Write-Debug "Parameter Set: Folder"
        #Check folder exists and contains json files
        if (test-path -PathType Container $folder) {
            Write-Verbose "Folder exists [$folder]"
            }
        else {
            exit-fatal "Folder invalid [$folder]"
            }
        if ((@(Get-ChildItem $folder -Filter *.json)).count -gt 0) {
            #Folder contains more than one json file
            }
        else {
            exit-fatal "No Jsonfiles found in [$folder]"
            }
        if ((@(Get-ChildItem $folder -Filter MANIFEST.MF)).count -ne 1) {
            exit-fatal "Check folder is Imaege Streamer Artifact, Manifest not found in [$folder]"
            }

        #Get folder Artifact folder resides in (for -$OutputTextFile)
        $strOutPutFilePath = $folder + ".txt"

        }

    default {
            exit-fatal "Invalid option(s) on command line"
        }

    }

#Setup for output as a file
if ($OutputTextFile) {

    #Validate output file location
    write-debug "Outputfile path is: $strOutPutFilePath"
    if (test-path $strOutPutFilePath) {
        #Outputfile already exists
        write-warning "Output file already exists and will be over written ($strOutPutFilePath)"
        }
    }

###
#Expand zip file into temp
#

If ($PsCmdlet.ParameterSetName -eq "ZipFile") {

    #Grab a random temp directory
    $strTempFolderName = [System.IO.Path]::GetFileNameWithoutExtension([System.IO.Path]::GetRandomFileName())
    $strTemp = [System.IO.Path]::GetTempPath()
    $strTempFolder = join-path $strTemp $strTempFolderName
    write-verbose "Temp folder: $strTempFolder"
    #Check if it exists
    if (test-path -type Container $strTempFolder) {
        exit-fatal "Temporary folder $strTempFolder already exists!"
        }
    #Create the temp folder
    try {
        New-Item -Path $strTempFolder -ItemType "directory" | Out-Null
        }
    catch {
        $error
        exit-fatal "Failed to create folder Temp folder ($strTempFolder)"
        }

    write-verbose "Unzipping files to temp folder"
    Expand-ZIPFile $file $strTempFolder
    }

###
write-verbose "Analysing files"
#

#What files do we have?
If ($PsCmdlet.ParameterSetName -eq "ZipFile") {$folder = $strTempFolder}
$arrFilesInZip = @(Get-ChildItem $folder)

#Create Output header wiht file information
Output    "--------------------------------------------------------------------------------`n"
If ($PsCmdlet.ParameterSetName -eq "ZipFile") {
    $strFileName = split-path -Leaf $file
    }
elseif ($PsCmdlet.ParameterSetName -eq "Folder") {
    $strFileName = [System.IO.Path]::GetFileName($folder)
    }
else {exit-fatal "Command line option unsupported [Output header]"}

                         Output $("`t            File name: {0}" -f $strFileName)
foreach ($objPlanScriptFile in $($arrFilesInZip | ?{$_.Name -match "MANIFEST.MF" } )) {
    $strPlanScript = get-content $objPlanScriptFile.FullName
    switch -Regex ($strPlanScript) {
        "Artifact Name" {Output $("`t	Name (in manifest): {0}" -f $($_ -replace "^Artifact Name:",""))}
        "Description"   {Output $("`t	       Description: {0}" -f $($_ -replace "^Description:",""))}
        "Time Stamp"    {
                         Output $("`t	             Dated: {0} ({1})" -f $($_ -replace "^Time Stamp:(.*)T.*",'$1'),
                            $($_ -replace "^Time Stamp:.*T(.*)\.\d+Z",'$1'))
        }
        }


    Output "`n--------------------------------------------------------------------------------"
    }

#Detail golden Images
If ( (@($($arrFilesInZip | ?{$_.Name -match "goldenimage\.json" }))).count -gt 0) {
    #Artifact contains a golden Image
    Output "`nGolden Images:`n"

    #Loop though each golden image and document it
    foreach ($objGIJson in $($arrFilesInZip | ?{$_.Name -match "goldenimage\.json" } )) {
        $objGI = get-content $objGIJson.FullName | ConvertFrom-Json
            Output $("`t        Name: {0}" -f $($objGI.name))
        If ($null -ne $($objGI.description)) {
            Output $("`tDescription: {0}" -f $($objGI.description))
            }
        }
    Output "`n"
    }

#Deployment Plans
if ($arrFilesInZip |  Where-Object {$_.Name -match "deploymentplan\.json"}) {
    Output "`nDeployment Plans:`n"
    }
foreach ($objDeploymentPlanScriptFile in $($arrFilesInZip | ?{$_.Name -match "deploymentplan\.json" } )) {
    $objDeployPlan = get-content $objDeploymentPlanScriptFile.FullName | ConvertFrom-Json
        Output $("`t        Name: {0} (Type:{1})" -f $($objDeployPlan.name),$($objDeployPlan.Type))
    If ($null -ne $($objDeployPlan.description)) {
        $strPrefix = "`t Description: {0}"
        foreach ($line in $($objDeployPlan.DESCRIPTION.split("`n"))) {
            $strPrefix -f $($line)
            $strPrefix = "`t              {0}"
            }
        }
    If (($null -ne $($objDeployPlan.goldenImageURI)) -and ($objDeployPlan.goldenImageURI.trim() -ne "")) {
        Output $("`tGoldernImage: {0}" -f $($objDeployPlan.goldenImageURI))
        }
    Output "`n"
    }

#Build Plans
if ($arrFilesInZip | ?{$_.Name -match "buildplan\.json" } ) {
    Output "`nBuild Plans:`n"
    }
foreach ($objBuildPlanScriptFile in $($arrFilesInZip | ?{$_.Name -match "buildplan\.json" } )) {
    #Check for duplicate eTag values
    $objBuildPlan = get-content $objBuildPlanScriptFile.FullName
    if (($objBuildPlan -cmatch "eTag") -and ($objBuildPlan -cmatch "etag")) {
       $blErrorInJson = $true
       $objBuildPlan = (get-content $objBuildPlanScriptFile.FullName) -replace '"eTag":.*?,','' | ConvertFrom-Json
        }
    else {
       $blErrorInJson = $false
       $objBuildPlan = get-content $objBuildPlanScriptFile.FullName | ConvertFrom-Json
        }

        Output $("`t       Name: {0} (Type:{1})" -f $($objBuildPlan.name),$($objBuildPlan.oeBuildPlanType))
    if (($null -ne $objBuildPlan.description) -and ($objBuildPlan.description.trim() -ne "")) {
        $strPrefix = "`tDescription: {0}"
        foreach ($line in $($objBuildPlan.description.split("`n"))) {
            $strPrefix -f $($line)
            $strPrefix = "`t             {0}"
            }
        }
    else {
        Output "`tDescription: (None)"
        }

    if (($blErrorInJson -and $ListeTagErrors)) {"`t(Error duplicate eTag/etag keys found in json)"}
    if ($full) {
        Output "`t`tSteps:"
        foreach ($line in $($objBuildPlan.buildStep | sort serialNumber | select -expandproperty planScriptName)) {
            Output $("`t`t{0}" -f $line)
            }
        }

    "`n"
    }

#Plan Scripts
if ($arrFilesInZip | ?{$_.Name -match "planscript\.json" } ) {
    Output "`nPlan Scripts:`n"
    }
foreach ($objPlanScriptFile in $($arrFilesInZip | ?{$_.Name -match "planscript\.json" } )) {
    $objPlanScript = get-content $objPlanScriptFile.FullName | ConvertFrom-Json
    Output $("`t       Name: {0} ({1})" -f $($objPlanScript.name) , $($objPlanScript.planType))
    Output $("`t   FullName: {0}" -f $(split-path -leaf $($objPlanScriptFile.FullName)))
    $strPrefix = $("`tDescription: {0}")
    foreach ($line in $($objPlanScript.DESCRIPTION.split("`n"))) {
            $strPrefix -f $($line)
            $strPrefix = "`t             {0}"
            }

    #Output script if required
    if ($full) {
        Output "`t`tSteps:"
        Output $("`t`t{0}" -f $($objPlanScript.content -replace '\n',"`n`t`t"))
        }
    Output "`n"
    }

#Check for any un-investigated files
if ( (@(dir $folder -Exclude SHA1SUM.sha1sum,MANIFEST.MF,*buildplan.json,*planscript.json,*goldenimage.json,*deploymentplan.json)).count -gt 0) {
    Output "`nFiles not documented:"
    foreach ($objPlanScriptFile in $($arrFilesInZip |
        ?{ -not (($_.Name -match "planscript\.json") -or ($_.Name -match "buildplan\.json") -or `
                 ($_.Name -match "MANIFEST.MF") -or ($_.Name -match "SHA1SUM.sha1sum") -or `
                 ($_.Name -match "goldenimage\.json") -or ($_.Name -match "deploymentplan\.json"))})) {
        Output $("`t{0}" -f $(split-path -leaf $objPlanScriptFile.FullName))
        }
    }

#Write output file
if ($OutputTextFile) {
    try {
        Out-File -InputObject $strOutPut -Filepath $strOutPutFilePath
        }
    catch {
        write-error $error[0] -ErrorAction continue
        exit-fatal "Error writing output file ($strOutPutFilePath)"
        }
    }


#Clean up
If ($PsCmdlet.ParameterSetName -eq "ZipFile") {delete-tempFolder}
