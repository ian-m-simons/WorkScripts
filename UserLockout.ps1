param (
	[string]$user
)
$userObject = Get-ADUser $user -Properties LockedOut

if ($userObject.LockedOut) {
	$unlock = read-host "$user is locked out, would you like to unlock them? (y=yes/n=no)"
	if ($unlock -eq "y"){
		Unlock-ADAccount -Identity $user
	}
	else if ($unlock -eq "n"){
		write-host "$user remains locked"
	}
	else {
		write-host "you failed to read instructions, please manually unlock account or ask for help"
	}


}
else{
	write-host "$user is not locked out, open AD users and Computers to further troubleshoot"
}
