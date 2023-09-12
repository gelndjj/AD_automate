# Import the CSV file containing user information
$users = Import-Csv -Path "C:\temp\AD_Automate\AD_Users_sample.csv"

# Prompt the user for the target OU path
$ouPath = Read-Host "Enter the target OU path (e.g., OU=Users,OU=Administration,DC=mybusiness,DC=local)"

# Prompt the user for the password
$password = Read-Host "Enter the password for new users" -AsSecureString

# Initialize a counter for created users
$createdUserCount = 0

# Loop through each user record in the CSV and create AD user accounts
foreach ($user in $users) {
    $sAMAccountName = $user."sAMAccountName"

    # Check if the user already exists in Active Directory
    if (Get-ADUser -Filter {SamAccountName -eq $sAMAccountName}) {
        Write-Host "User $sAMAccountName already exists in Active Directory. Skipping..."
    }
    else {
        $firstName = $user."First Name"
        $lastName = $user."Last Name"
        $displayName = $user."Display Name"
        $description = $user."Description"
        $email = $user."Email"
        $address = $user."Address"
        $city = $user."City"
        $zipCode = $user."ZIP Code"
        $UPN = $user."UPN"
        $company = $user."Company"
        $jobTitle = $user."Job Title"
        $department = $user."Department"

        # Create the new user account in the specified OU with the provided password
        New-ADUser -Name "$firstName $lastName" -GivenName $firstName -Surname $lastName -DisplayName $displayName -Description $description -EmailAddress $email -StreetAddress $address -City $city -PostalCode $zipCode -SamAccountName $sAMAccountName -UserPrincipalName $UPN -AccountPassword $password -Enabled $true -Path $ouPath

        # Set additional properties like company, job title, and department (adjust as needed)
        Set-ADUser -Identity $sAMAccountName -Company $company
        Set-ADUser -Identity $sAMAccountName -Title $jobTitle
        Set-ADUser -Identity $sAMAccountName -Department $department

        # Increment the created user count
        $createdUserCount++
    }
}

Write-Host "User accounts created successfully in $ouPath."
Write-Host "Total users created: $createdUserCount"

# Get the count of users in the specified OU
$ouUserCount = (Get-ADUser -Filter * -SearchBase $ouPath).Count
Write-Host "Total users in ${ouPath}: $ouUserCount"

