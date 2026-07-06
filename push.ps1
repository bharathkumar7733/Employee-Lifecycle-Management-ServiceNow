# PowerShell Script to automate Git push for ServiceNow Employee Lifecycle Management System

$workDir = "c:\Lifecycle-Management-ServiceNow"
Set-Location -Path $workDir

# Output log file
$logFile = "$workDir\git_push_log.txt"

# Add log function
function Write-Log {
    param([string]$message)
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Add-Content -Path $logFile -Value "[$timestamp] $message"
    Write-Output "[$timestamp] $message"
}

Write-Log "Starting automated Git Push process..."

# Check if git is initialized
if (!(Test-Path -Path ".git")) {
    Write-Log "Error: Local git repository is not initialized."
    Exit 1
}

# Run git operations
try {
    Write-Log "Running git add..."
    git add . 2>&1 | Add-Content -Path $logFile
    
    Write-Log "Running git commit..."
    git commit -m "Complete ServiceNow Employee Lifecycle Management System documentation and assets" 2>&1 | Add-Content -Path $logFile
    
    Write-Log "Running git push origin main..."
    git push origin main 2>&1 | Add-Content -Path $logFile
    
    Write-Log "Git push completed successfully!"
} catch {
    Write-Log "Exception occurred: $_"
}
