##Title: Maltapost Monitor Looper
##Author: Mark Farrugia Sant'Angelo
##Date: 31/08/2021
##Description: Powershell loop to monitor a tracked item via Maltapost's API every 2 minutes for real-time updates to a parcel's status

$tcode = Read-Host -Prompt 'Input your parcel tracking code'
$seconds = 120


Function monitor {
  cls
  echo ""
  echo ""
  echo ""
  echo "Retrieving information for tracking code $tcode every 2 minutes"
  echo ""
  echo ""
  echo ""
  $response = Invoke-RestMethod -Uri "https://www.maltapost.com/TrackAndTraceApi/v1/trackedItems?barcode=$tcode"
  $response.flag
  echo $response.movements
  
  #Progress Bar
  1..$seconds |
    ForEach-Object { 
      $percent = $_ * 100 / $seconds; 
      Write-Progress -Activity "API Lookup countdown" -Status "$($seconds - $_) seconds remaining..." -PercentComplete $percent; 
      Start-Sleep -Seconds 1
      }
  
  }

while (1) {monitor; sleep $seconds}

