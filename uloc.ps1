param(
	[string]$user
)
$date = get-date -format "YYYY:mm:dd"
$time = get-date -format"HH:MM:ss"
try {
	Unlock-AdAccount $user
	write-host "$user unlocked at $time"
	echo "[$date]$user unlocked at $time" >> C:\Users\$env:USERNAME\Desktop\logs\uloc.log
catch {
	write-host "[ERROR]User not found"
