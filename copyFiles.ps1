<# Powershell script for copying the contents of a folder to another folder

example 1 input:
Input source folder contents: \\ServerA\D$\SourceFolder\*
Input destination folder (folder name): \\serverB\D$\DestFolder

example 2 input:
Input source folder contents: \\ServerA\D$\SourceFolder
Input destination folder (folder name): \\serverB\D$\DestFolder

Author: Holly Jordan
Created: 7/16/2021
#>


# Ask user for source and destination files
[string]$source = $(Read-Host "Input source folder contents")

# Test to see if SOURCE folder exists
$Folder = $source
if (Test-Path -Path $Folder) {
}
else {
	" "
	Write-Host "*** Source path doesn't exist - exiting now, try again" -ForegroundColor red
	exit
}
[string]$destin = $(Read-Host "Input destination folder (folder name)")

# -------------------- Test to see if DESTINATION folder exists ---------------------------------
$Folder = $destin
if (Test-Path -Path $Folder) {
	# Destination already exists
	# Rename this current destination folder (to save it)
	[string]$Date = Get-Date -Format "yyyy-MM-dd@HH.mm.ss"
	[string]$newName = "$destin-save-$Date"
	
	Write-Host "*** Saving existing destination folder as: '$newName'" -ForegroundColor cyan
	Rename-Item $destin -NewName $newName
}
# Destination does not exist
# Create new folder
Write-Host "*** Creating new destination folder as: '$destin'" -ForegroundColor cyan
New-Item -Path $destin -ItemType "directory"
	
# --------------------- Copy from source to new destination folder ----------------------------------
# Count the number of items in $source
[int]$sourceCount = (Get-ChildItem -Path $source -Recurse).Count
	
# Inform the user
Write-Host "*** Copying $sourceCount files from '$source' to '$destin'..." -ForegroundColor cyan

# Copy the files from $source to $destin
Get-ChildItem -Path $source | Copy-Item -Destination $destin -Recurse

# Count the number of items in $destin
[int]$destinCount = (Get-ChildItem -Path $destin -Recurse).Count
	
# Check if items were successfully copied by comparing $sourceCount and $destinCount
if($sourceCount -eq $destinCount) {
	# number of items in source = number of items in new destination
	" "
	Write-Host "*** Successfully copied $destinCount items from '$source' to '$destin'" -ForegroundColor green
	"----------------------------------------------------------------------"
	"--> Source '$source' contains $sourceCount items "
	"--> Destination '$destin' contains $destinCount items"
}
else {
	# Unsuccessful copy
	# different number of items in source and destination files
	" "
	Write-Host "*** Error: Items were not successfully copied from '$source' to '$destin'" -ForegroundColor red
	"-------------------------- Error information: --------------------------"
	"--> Source '$source' contains $sourceCount items "
	"--> Destination '$destin' contains $destinCount items"
}


