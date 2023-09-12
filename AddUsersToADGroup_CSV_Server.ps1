# Specify the path to the CSV file
$csvPath = "C:\temp\AD_Automate\AD_GRP_sample.csv"  # Replace with the actual path

# Import data from the CSV file
$data = Import-Csv -Path $csvPath

# Loop through the data and add users to AD group
foreach ($row in $data) {
    $userLogonName = $row."sAMAccountName"  # Adjust column header
    $adGroup = $row."AD GROUP"  # Adjust column header

    # Add user to AD group
    Add-ADGroupMember -Identity $adGroup -Members $userLogonName

    Write-Host "User '$userLogonName' added to group '$adGroup'."
}
