$newComputerName = read-host "Please enter the name of the new computer "
$oldComputerName = read-host "Please enter the name of the old computer "

$newComputerObject = Get-ADComputer $newComputerName
$oldComputerObject = Get-ADComputer $oldComputerName

write-host "New computer name is $newComputerName"
write-host "Old computer name is $oldComputerName"

$run = read-host "is this correct? (y=yes/n=no)"

if (($run -eq 'y') -and ($newComputerObject.DistinguishedName -match "Computer Installs")){
	Get-ADPrincipalGroupMembership $oldComputerObject | foreach($_) {Add-ADGroupMember -Identity $_ -Members ($newComputerObject)}
}
else{
	exit
}
