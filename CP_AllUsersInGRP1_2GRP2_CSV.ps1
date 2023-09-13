# Specify the path to the CSV file
$csvPath = "C:\temp\AD_Automate\CP_AllUsersInGRP1_2GRP2_CSV_sample.csv"  # Make sure the CSV file is in the same directory as this script

# Import data from the CSV file
$data = Import-Csv -Path $csvPath

# Loop through the data and copy users from 'FROM' to 'TO' groups
foreach ($row in $data) {
    $sourceGroup = $row.FROM
    $destinationGroup = $row.TO

    # Get members of the source group
    $sourceGroupMembers = Get-ADGroupMember -Identity $sourceGroup

    # Loop through the members and add them to the destination group
    foreach ($member in $sourceGroupMembers) {
        if ($member.objectClass -eq "user") {
            # Only add user objects to the destination group
            Add-ADGroupMember -Identity $destinationGroup -Members $member
            Write-Host "User '$($member.SamAccountName)' copied from '$sourceGroup' to '$destinationGroup'."
        }
    }

    Write-Host "Copying users from '$sourceGroup' to '$destinationGroup' completed."
}
