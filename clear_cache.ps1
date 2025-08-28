# Clear Cache and Temp Files Script
# Author: Your Name
# GitHub Repo: https://github.com/YourUsername/clear-cache-windows

function Clear-UserTemp {
    Write-Host "Clearing user temp files..."
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "User temp files cleared."
}

function Clear-SystemTemp {
    Write-Host "Clearing Windows temp files (admin required)..."
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "System temp files cleared."
}

function Clear-BrowserCache {
    Write-Host "Clearing Edge/Chrome cache..."
    $paths = @(
        "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*",
        "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*"
    )
    foreach ($path in $paths) {
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
    }
    Write-Host "Browser cache cleared."
}

function Show-Menu {
    Clear-Host
    Write-Host "============================="
    Write-Host "   Clear Cache & Temp Files  "
    Write-Host "============================="
    Write-Host "1. Clear User Temp Files"
    Write-Host "2. Clear Windows Temp Files"
    Write-Host "3. Clear Browser Cache"
    Write-Host "4. Clear All"
    Write-Host "0. Exit"
}

do {
    Show-Menu
    $choice = Read-Host "Enter choice"
    switch ($choice) {
        "1" { Clear-UserTemp; Pause }
        "2" { Clear-SystemTemp; Pause }
        "3" { Clear-BrowserCache; Pause }
        "4" {
            Clear-UserTemp
            Clear-SystemTemp
            Clear-BrowserCache
            Pause
        }
        "0" { Write-Host "Exiting..." }
        default { Write-Host "Invalid option. Try again."; Pause }
    }
} while ($choice -ne "0")
