Option Explicit

Dim objFSO, strNow, strBackupFile, objWMIService, colListOfServices, objService
Dim scriptdir, b, sSkippedSvc, iSvcCount

Set objFSO = CreateObject("Scripting.FilesystemObject")
strNow = Replace(FormatDateTime(Now, vbShortDate), "/", "")
scriptdir = objFSO.GetParentFolderName(WScript.ScriptFullName)
strBackupFile = scriptdir & "\Backup Services " & strNow & ".reg"
Set b = objFSO.CreateTextFile(strBackupFile, True)
b.WriteLine "Windows Registry Editor Version 5.00"
b.WriteBlankLines 1

iSvcCount = 0
sSkippedSvc = ""

Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colListOfServices = objWMIService.ExecQuery("Select * from Win32_Service")

For Each objService In colListOfServices
    iSvcCount = iSvcCount + 1
    b.WriteLine "[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\" & Trim(objService.Name) & "]"
    Select Case LCase(objService.StartMode)
        Case "boot": b.WriteLine """Start""=dword:00000000"
        Case "system": b.WriteLine """Start""=dword:00000001"
        Case "auto": b.WriteLine """Start""=dword:00000002"
        Case "manual": b.WriteLine """Start""=dword:00000003"
        Case "disabled": b.WriteLine """Start""=dword:00000004"
        Case Else: sSkippedSvc = sSkippedSvc & ", " & objService.Name
    End Select
    b.WriteBlankLines 1
Next

If Trim(sSkippedSvc) <> "" Then
    MsgBox "Services Found: " & iSvcCount & ". Failed to backup: " & Mid(sSkippedSvc, 3)
Else
    MsgBox "Services Found: " & iSvcCount & ". Successfully!"
End If

b.Close
Set objFSO = Nothing