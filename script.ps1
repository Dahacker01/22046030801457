# Check if running as administrator
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "You need to run this script as an administrator!" -ForegroundColor Red
    Exit
}

# Your admin-level commands go here
Write-Host "Running with administrator privileges!" -ForegroundColor Green

# Example: Create a folder in C:\Program Files (requires admin)
$folderPath = "C:\Program Files\TestFolder"
If (-Not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
    Write-Host "Folder created at $folderPath"
} else {
    Write-Host "Folder already exists at $folderPath"
}
