param (
    [string]$sourceDir = "dist",
    [string]$targetDir = "."
)

# Ensure the source directory exists
if (-not (Test-Path $sourceDir)) {
    Write-Error "Source directory '$sourceDir' does not exist."
    exit 1
}

# Copy all files from the source directory to the target directory
Get-ChildItem -Path $sourceDir -Recurse | ForEach-Object {
    $targetPath = Join-Path -Path $targetDir -ChildPath $_.FullName.Substring($sourceDir.Length + 1)
    
    if ($_.PSIsContainer) {
        # Create directory if it doesn't exist
        if (-not (Test-Path $targetPath)) {
            New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
            Write-Host "Created directory: $targetPath"
        }
    } else {
        # Copy file
        $targetParent = Split-Path -Path $targetPath -Parent
        if (-not (Test-Path $targetParent)) {
            New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
        }
        Copy-Item -Path $_.FullName -Destination $targetPath -Force
        Write-Host "Copied: $($_.FullName) to $targetPath"
    }
}

Write-Host "Copy completed successfully!"
