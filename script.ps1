# URL of the image you want as your wallpaper
$imageUrl = "https://example.com/sony-cyberattack.jpg"

# Path to save the image locally
$localPath = "$env:USERPROFILE\Pictures\sony_cyberattack.jpg"

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $localPath

# Function to set wallpaper
function Set-Wallpaper($path) {
    Add-Type @"
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

    # 20 = SPI_SETDESKWALLPAPER, 3 = SPIF_UPDATEINIFILE + SPIF_SENDCHANGE
    [Wallpaper]::SystemParametersInfo(20, 0, $path, 3)
}

# Set the downloaded image as wallpaper
Set-Wallpaper $localPath
