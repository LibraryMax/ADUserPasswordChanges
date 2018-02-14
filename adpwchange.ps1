Import-Module ActiveDirectory
# Set the new password

# Import users from CSV
Import-Csv "C:\Scripts\ADUsers.csv" | ForEach-Object {
 $samAccountName = $_."samAccountName"
 $samPassword = $_."samPassword"
 $newPassword = ConvertTo-SecureString -AsPlainText $samPassword -Force
 
# Reset user password.
Set-ADAccountPassword -Identity $samAccountName -NewPassword $newPassword -Reset
 
Write-Host " AD Password has been reset for: "$samAccountName
}