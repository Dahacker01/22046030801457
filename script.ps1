# -----------------------------
# 1. Download Sony Cyberattack Image
# -----------------------------
$imageUrl = "https://elements-resized.envatousercontent.com/elements-video-cover-images/ef547aaf-3b49-461e-ab10-c9acb1519d19/video_preview/video_preview_0000.jpg?w=1200&h=630&cf_fit=crop&q=85&format=jpeg&s=37e0ba759e20a56e2cd7f1c90f652a60892836af854a4a24f54b1612872d7f35"
$localPath = "$env:USERPROFILE\Pictures\sony_cyberattack.jpg"

Invoke-WebRequest -Uri $imageUrl -OutFile $localPath

# -----------------------------
# 2. Set Desktop Background
# -----------------------------
function Set-Wallpaper($path) {
    Add-Type @"
using System;
using System.Runtime.InteropServices;

public class NativeMethods {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
    [NativeMethods]::SystemParametersInfo(20, 0, $path, 1 -bor 2)
}

Set-Wallpaper $localPath

# -----------------------------
# 3. Toggle Desktop Icons (No Registry, No Admin)
# -----------------------------
$desktop = (New-Object -ComObject Shell.Application).NameSpace(0)

# The command that toggles "Show Desktop Icons"
$desktop.Self.InvokeVerb("ToggleDesktopIcons")

Write-Host "Wallpaper applied. Desktop icons toggled (hidden if they were visible)." -ForegroundColor Green
