# Powershell Scripts
A collection of useful powershell scripts to help make life easier ;) 

## Scripts

### mp_monitor.ps1
A powershell loop to monitor a tracked item via Maltapost's API every 2 minutes for real-time updates to a parcel's status. Run in powershell and input the local tracking code when prompted. Consists of a while loop which triggers an Invoke-RestMethod cmdlet to query Maltapost's API. 


