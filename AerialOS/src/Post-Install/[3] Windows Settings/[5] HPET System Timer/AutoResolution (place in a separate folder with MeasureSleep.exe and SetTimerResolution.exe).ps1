param(
    [double]$increment = 0.002,
    [double]$start = 0.5,
    [double]$end = 0.8,
    [int]$samples = 50
)

function DisplayHeader {
    $iterations = ($end - $start) / $increment
    $totalMs = $iterations * 102 * $samples
	
    Write-Host
    Write-Host "Estimated Time for Completion (Worst-Case): $([math]::Round($totalMs / 6E4, 2)) minutes" -ForegroundColor Cyan
    Write-Host "Worst-case is based on an assumption: Sleep(1) = ~2ms with 1ms Timer Resolution" -ForegroundColor DarkCyan
    Write-Host "Parameters: Start = $($start)ms, End = $($end)ms, Increment = $($increment)ms, Samples = $($samples)" -ForegroundColor Green
}

function CheckDependencies {
    foreach ($dependency in @("SetTimerResolution.exe", "MeasureSleep.exe")) {
        if (-not (Test-Path $dependency)) {
            Write-Host "Error: $($dependency) does not exist in the current directory" -ForegroundColor Red
            return $false
        }
    }
    return $true
}

function BenchmarkResolution {
    $bestAvg = [double]::MaxValue
    $bestStdev = [double]::MaxValue
    $bestResolution = 0

    Write-Host "`nRequested Resolution (ms), Delta (ms), Standard Deviation (STDEV)`n" -ForegroundColor Yellow

    for ($i = $start; $i -le $end; $i += $increment) {
        Write-Host "Benchmarking: $([math]::Round($i, 3))ms" -ForegroundColor White

        Start-Process ".\SetTimerResolution.exe" -ArgumentList @("--resolution", ($i * 1E4), "--no-console")
        Start-Sleep 1

        $output = .\MeasureSleep.exe --samples $samples
        $outputLines = $output -split "`n"

        $avg = $null
        $stdev = $null

        foreach ($line in $outputLines) {
            if ($line -match "Avg: (\d+(\.\d+)?)") {
                $avg = [double]$matches[1]
            } elseif ($line -match "STDEV: (\d+(\.\d+)?)") {
                $stdev = [double]$matches[1]
            }
        }

        if ($null -ne $avg -and $null -ne $stdev) {
            Write-Host "$([math]::Round($i, 3)), $([math]::Round($avg, 3)), $($stdev)" -ForegroundColor Green
        } else {
            Write-Host "Warning: Failed to retrieve Avg or STDEV for $([math]::Round($i, 3))ms" -ForegroundColor DarkYellow
        }

        if ($avg -lt $bestAvg -or ($avg -eq $bestAvg -and $stdev -lt $bestStdev)) {
            $bestAvg = $avg
            $bestStdev = $stdev
            $bestResolution = $i
        }

        Stop-Process -Name "SetTimerResolution" -ErrorAction SilentlyContinue

        Write-Host
    }

    Write-Host "`nSummary of Best Results:" -ForegroundColor Cyan
    Write-Host "Optimal Resolution: $([math]::Round($bestResolution, 3))ms" -ForegroundColor Green
    Write-Host "Average: $([math]::Round($bestAvg, 3))ms" -ForegroundColor Green
    Write-Host "Standard Deviation: $($bestStdev)ms" -ForegroundColor Green
}

function main {
    DisplayHeader

    Stop-Process -Name "SetTimerResolution" -ErrorAction SilentlyContinue

    Set-Location $PSScriptRoot

    if (-not (CheckDependencies)) {
        return 1
    }

    BenchmarkResolution
    return 0
}

$_exitCode = main
Write-Host "Press any key to exit..." -ForegroundColor DarkGray
[System.Console]::ReadKey($true) > $null