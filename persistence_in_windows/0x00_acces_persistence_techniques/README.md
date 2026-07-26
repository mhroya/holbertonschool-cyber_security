# Background Intelligent Transfer Service (BITS) Analysis & Detection Report

## 1. Introduction
Background Intelligent Transfer Service (BITS) is a Windows component designed for asynchronous, prioritized, and bandwidth-throttled file transfers. While primarily used for Windows Updates, threat actors frequently abuse BITS to download malicious payloads and maintain persistent access without raising network alarms.

## 2. Understanding BITS Capabilities
* **Background Execution:** Operates via `svchost.exe` under `NT AUTHORITY\SYSTEM` context.
* **Resilience:** Resumes downloads automatically after system reboots or network drops.
* **Notification Commands (`/SetNotifyCmdLine`):** Allows execution of an arbitrary command or executable once a transfer job completes or encounters an error.

## 3. Mechanics of BITS Persistence
Attackers leverage command-line utilities like `bitsadmin.exe` or PowerShell (`Start-BitsTransfer`) to create jobs with attached notification triggers. Because job details are stored in the persistent BITS database (`qmgr*.dat`), the triggers remain active across reboots.

## 4. Detection Mechanisms
To identify unauthorized or suspicious BITS jobs:
* **Windows Event Logs:** Monitor `Microsoft-Windows-BITS-Client/Operational`:
  * **Event ID 3:** Job creation.
  * **Event ID 59 / 4001:** Job state modifications.
  * **Event ID 4005:** Execution of notification commands (`SetNotifyCmdLine`).
* **Sysmon (Event ID 1):** Audit process creation involving `bitsadmin.exe` with parameters like `/create`, `/addfile`, or `/SetNotifyCmdLine`.

## 5. Defense and Remediation
1. **Regular Auditing:** Frequently inspect active BITS jobs using PowerShell (`Get-BitsTransfer -AllUsers`).
2. **Restrict Execution:** Limit `bitsadmin.exe` via AppLocker or WDAC policies.
3. **PowerShell Logging:** Enable Script Block Logging (Event ID 4104) to catch `BitsTransfer` cmdlet abuse.

## 6. Conclusion
BITS is a double-edged native Windows feature. Effective defense requires continuous log monitoring, application control, and proactive auditing of background transfer jobs.
