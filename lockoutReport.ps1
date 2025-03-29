get-aduser -filter * -properties Enabled,LockedOut,name,samAccountName | where-object {$_.enabled -eq $true -and $_.lockedout -eq $true} | select name,SamAccountName
