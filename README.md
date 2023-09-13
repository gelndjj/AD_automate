<a name="readme-top"></a>

[![Contributors][contributors-shield]](https://github.com/gelndjj/AD_automate/graphs/contributors)
[![Forks][forks-shield]](https://github.com/gelndjj/AD_automate/forks)
[![Stargazers][stars-shield]](https://github.com/gelndjj/AD_automate/stargazers)
[![Issues][issues-shield]](https://github.com/gelndjj/AD_automate/issues)
[![MIT License][license-shield]](https://github.com/gelndjj/AD_automate/blob/main/LICENSE)
[![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/jonathanduthil/)


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/gelndjj/"AD_automate">
    <img src="https://github.com/gelndjj/AD_automate/blob/main/resources/image.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">AD_automate</h3>

  <p align="center">
    Automate basic Active Directory tasks.
    <br />
    <a href="https://github.com/gelndjj/AD_automate"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="https://github.com/gelndjj/AD_automate/issues">Report Bug</a>
    ·
    <a href="https://github.com/gelndjj/AD_automate/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>

  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
<div align="center">
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/main_windows.png" alt="Logo" width="628" height="293">
</br>
</br>
AD_automate is a series of PowerShell script to handle AD basic tasks such as adding and removing users, copy users belonging to group to another group, extract users information into a CSV file etc ...  </br>
</br>
</div>Among the PowerShell scripts, there are some Python scripts that create CSV template, used to provide the necessary information the PS script needs to perform the action.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Built With

<a href="https://www.python.org">
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/py_icon.png" alt="Icon" width="32" height="32">
</a>
&nbsp;
<a href="https://customtkinter.tomschimansky.com">
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/ctk_icon.png" alt="Icon" width="32" height="32">
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

## Generate fake users
Run "Create_FakeADusers.py" to get a CSV filled of users. <br>

```import csv
from faker import Faker

# Function to create a CSV file with fake user data
def create_fake_user_csv(file_name, headers, num_users):
    fake = Faker()
    sAMAccountName_counter = 0

    with open(file_name, 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Write headers to the CSV file
        csv_writer.writerow(headers)

        for i in range(num_users):
            first_name = fake.first_name()
            last_name = fake.last_name()
            display_name = f"{first_name} {last_name}"
            description = "Employee"  # Set description to "Employee"
            email = f"{first_name.lower()}.{last_name.lower()}@mybusiness.local" 
            address = fake.street_address()
            city = fake.city()
            zip_code = fake.zipcode()
            sAMAccountName = f"I{sAMAccountName_counter:07d}"
            UPN = f"{first_name.lower()}.{last_name.lower()}@mybusiness.local"
            company = fake.company()
            job_title = fake.job()
            department = fake.bs()

            # Write fake user data to the CSV file
            csv_writer.writerow(
                [first_name, last_name, display_name, description, email, address, city, zip_code, sAMAccountName, UPN,
                 company, job_title, department])

            sAMAccountName_counter += 1

    print(f"CSV file '{file_name}' filled with fake user data successfully.")


if __name__ == "__main__":
    # Define the column headers including "sAMAccountName" and "UPN" (without "Country")
    column_headers = ["First Name", "Last Name", "Display Name", "Description", "Email", "Address", "City", "ZIP Code",
                      "sAMAccountName", "UPN", "Company", "Job Title", "Department"]

    # File name for the CSV file
    csv_file_name = "AD_Users_sample.csv"

    # Number of fake users to generate
    num_fake_users = 25  # Adjust this as needed

    # Create the CSV file with fake user data
    create_fake_user_csv(csv_file_name, column_headers, num_fake_users)
```

By default, the generated columns are the following : 
<br>
```
# Define the column headers
    column_headers = ["First Name", "Last Name", "Display Name", "Description", "Email", "Address", "City", "ZIP Code",
                      "sAMAccountName", "UPN", "Company", "Job Title", "Department"]
```
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/fake_users.png" alt="Logo" width="750" height="400">
<br>
You can edit the code to fit your need.
<br>
<br>
Changing the mail address :
<br>

```email = f"{first_name.lower()}.{last_name.lower()}@mybusiness.local"  # Adjust email address```
<br>
<br>
Changing the domain name after the UPN : 
<br>
```UPN = f"{first_name.lower()}.{last_name.lower()}@mybusiness.local"```
<br>
<br>
Changing the number of user generated : 
<br>
``` num_fake_users = 25  # Adjust this as needed ```
<br>
## Adding users to Active Directory
"AddUsersToAD_CSV_Server.ps1" must be placed in "C:\temp\AD_Automate" as well as "AD_Users_sample.csv".<br>
<br>
Right click and run or edit "AddUsersToAD_CSV_Server.ps1".<br>
You will be asked to enter the OU path where the users will be added in and to set a Password.
Type these information into the prompt.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_run_users_script.PNG" alt="Logo" width="750" height="400">
<br>
<br>
You'll get a message indicating how many users has been added as well as how many users are present now in the OU.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_run_users_script_1.PNG" alt="Logo" width="750" height="400">
<br>
<br>
What the AD looks like now: <br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_after_users.PNG" alt="Logo" width="750" height="400">
<br>
## Adding users to AD group(s)
Let's create a CSV template the same way for adding users to group(s).
<br>
```import csv
def create_template(file_path):
    with open(file_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(["sAMAccountName", "AD GROUP"])

    print(f"CSV template created at {file_path}")

if __name__ == "__main__":
    template_file = "AD_GRP_sample.csv"
    create_template(template_file)
```
"CP_AllUsersInGRP1_2GRP2_CSV_sample.csv" will be created after running the script.
"AD_GRP_sample.csv" will be created after running the script.
<br>
Now let's copy/paste to this template the sAMAccountName from the users template created before and add some AD Groups.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/CSV_cp_users_grp.png" alt="Logo" width="750" height="400">
<br>
<br>
In this example I have 2 Groups where I want to add users.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_grp.png" alt="Logo" width="777" height="316">
<br>
<br>
Right click and run or edit "AddUsersToADGroup_CSV_Server.ps1".
"AD_GRP_sample.csv" must be placed in "C:\temp\AD_Automate" as well as "AddUsersToADGroup_CSV_Server.ps1". 
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_run_grp_script.PNG" alt="Logo" width="750" height="400">
<br>
<br>
Once done,you can see the users (from their sAMAccountName) has been added to the AD Groups present in the column AD_GROUP.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_after_grp.PNG" alt="Logo" width="886" height="519">
<br>
<br>
## Copy all users from a AD Group to another.
Let's create a CSV template.
<br>
```import csv
import csv

# Define the data for the CSV file
data = [
    {"FROM": "SourceGroup1", "TO": "DestinationGroup1"},
    {"FROM": "SourceGroup2", "TO": "DestinationGroup2"},
    # Add more rows as needed
]

# Specify the CSV file name
csv_file = ("CP_AllUsersInGRP1_2GRP2_CSV_sample.csv")

# Write the data to the CSV file
with open(csv_file, mode="w", newline="") as file:
    fieldnames = ["FROM", "TO"]
    writer = csv.DictWriter(file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(data)

print(f"CSV file '{csv_file}' created successfully.")
```
<br>
"CP_AllUsersInGRP1_2GRP2_CSV_sample.csv" will be created after running the script.
<br>
Write in the specific columns the Group you want the users to be copied from and the Group the users will be copied to.
<br>
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/CSV_GRP2GRP.png" alt="Logo" width="487" height="569">
<br>
<br>
Right click and run or edit "CP_AllUsersInGRP1_2GRP2_CSV.ps1".
"CP_AllUsersInGRP1_2GRP2_CSV_sample.csv" must be placed in "C:\temp\AD_Automate" as well as "CP_AllUsersInGRP1_2GRP2_CSV.ps1". 

<!-- GETTING STARTED -->

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".


1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the GNU GENERAL PUBLIC LICENSE. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

[LinkedIn](https://www.linkedin.com/in/jonathanduthil/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Vue.js]: https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vuedotjs&logoColor=4FC08D
[Vue-url]: https://vuejs.org/
[Angular.io]: https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white
[Angular-url]: https://angular.io/
[Svelte.dev]: https://img.shields.io/badge/Svelte-4A4A55?style=for-the-badge&logo=svelte&logoColor=FF3E00
[Svelte-url]: https://svelte.dev/
[Laravel.com]: https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white
[Laravel-url]: https://laravel.com
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 
