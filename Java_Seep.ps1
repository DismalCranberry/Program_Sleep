PS C:\Users\hlreports> # Set the working directory to ensure files can be accessed properly
Set-Location "D:\Automation\Java"

# Infinite loop to repeat the task every hour
while ($true) {
    # Log the time the script runs for debugging purposes
    $startTime = Get-Date
    $timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
    "[$timestamp] Starting Java process..." | Out-File -Append "D:\Automation\Java\script_log.txt"

    # Run the Java command and wait for it to complete
    & "C:\Program Files\Microsoft\jdk-21.0.4.7-hotspot\bin\java.exe" -Dpassword="PASSWORD" -Dusername="NAME" -jar "D:\Automation\Java\main.jar" > D:\Automation\Java\output.log 2>&1

    # Log the completion of the process
    $endTime = Get-Date
    $duration = $endTime - $startTime
    $timestamp = $endTime.ToString("yyyy-MM-dd HH:mm:ss")
    "[$timestamp] Java process completed. Duration: $duration" | Out-File -Append "D:\Automation\Java\script_log.txt"
    
    # Calculate how long to sleep (the remaining time until 1 hour)
    $elapsedTime = [int]$duration.TotalSeconds
    $timeLeft = 3600 - $elapsedTime
    
    if ($timeLeft -gt 0) {
        # Sleep for the remaining time to complete 1 hour
        Start-Sleep -Seconds $timeLeft
    }
}
