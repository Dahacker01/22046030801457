# URL of the Sony Cyberattack image
$imageUrl = "https://elements-resized.envatousercontent.com/elements-video-cover-images/ef547aaf-3b49-461e-ab10-c9acb1519d19/video_preview/video_preview_0000.jpg?w=1200&h=630&cf_fit=crop&q=85&format=jpeg&s=37e0ba759e20a56e2cd7f1c90f652a60892836af854a4a24f54b1612872d7f35"

# Local path to save the image
$localPath = "$env:USERPROFILE\sony_cyberattack.jpg"

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $localPath

# Function to set the desktop wallpaper
function Set-Wallpaper($path) {
    Add-Type @"
using System;
using System.Runtime.InteropServices;

public class NativeMethods {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

    # SPI_SETDESKWALLPAPER = 20, SPIF_UPDATEINIFILE = 1, SPIF_SENDCHANGE = 2
    [NativeMethods]::SystemParametersInfo(20, 0, $path, 1 -bor 2)
}

# Set the downloaded image as wallpaper
Set-Wallpaper $localPath

Write-Host "Wallpaper has been changed to the Sony Cyberattack image."
