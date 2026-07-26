<#
.SYNOPSIS
    BITS Job Security Audit and Monitoring Script
.DESCRIPTION
    This script inspects all active BITS jobs on the system, checks for potential
    persistence triggers (SetNotifyCmdLine), and logs suspicious activity.
#>

Write-Output "=========================================="
Write-Output "   BITS Jobs Security Audit & Monitor     "
Write-Output "=========================================="

# Retrieve all BITS jobs across all user contexts
try {
    $bitsJobs = Get-BitsTransfer -AllUsers -ErrorAction Stop
} catch {
    Write-Error "Failed to retrieve BITS transfers. Ensure you are running as Administrator."
    exit
}

if ($null -eq $bitsJobs -or $bitsJobs.Count -eq 0) {
    Write-Output "[+] No active BITS jobs found on the system."
} else {
    Write-Output "[!] Active BITS jobs detected: $($bitsJobs.Count)"
    Write-Output "------------------------------------------"

    foreach ($job in $bitsJobs) {
        Write-Output "Job ID:           $($job.JobId)"
        Write-Output "Display Name:     $($job.DisplayName)"
        Write-Output "Owner Account:    $($job.OwnerAccount)"
        Write-Output "State:            $($job.JobState)"
        Write-Output "Remote URL:       $($job.RemoteFileName)"
        Write-Output "Local Path:       $($job.LocalFileName)"

        # Check for suspicious notification command triggers
        if ($job.NotificationCommandLine) {
            Write-Warning "  [ALERT] Suspicious Notification Command Found!"
            Write-Warning "  Execution Path: $($job.NotificationCommandLine)"
        } else {
            Write-Output "  [OK] No command execution trigger attached."
        }
        Write-Output "------------------------------------------"
    }
}
