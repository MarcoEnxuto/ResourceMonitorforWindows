#Written by Marco Enxuto
function Show-ResourceMonitor()
{
    Write-Host "Press [ctrl+c] to stop" -ForegroundColor Yellow
    do
    {
        $cpuCounter=Get-Counter -Counter "\Processor(_Total)\% Processor Time"
        $diskCounter=Get-Counter -Counter "\PhysicalDisk(_Total)\% Disk Time"
        $memoryCounter=Get-Counter -Counter "\Memory\% Committed Bytes In Use"
        $cpuValue=[System.Math]::Round($cpuCounter.CounterSamples.CookedValue,2)
        $diskValue=[System.Math]::Round($diskCounter.CounterSamples.CookedValue,2)
        $memoryValue=[System.Math]::Round($memoryCounter.CounterSamples.CookedValue,2)
        Write-Progress -Activity "CPU usage" -PercentComplete $cpuValue -Status "$cpuValue %" -Id 0
        Write-Progress -Activity "Disk usage" -PercentComplete $diskValue -Status "$diskValue %" -ParentId 0 -Id 1
        Write-Progress -Activity "Memory usage" -PercentComplete $memoryValue -Status "$memoryValue %" -ParentId 1 -Id 2
        Start-Sleep -Milliseconds 400
    }
    while ($z -lt 0) {}
}
