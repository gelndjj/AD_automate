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

### Generate fake users
Run "Create_FakeADusers.py" to get a CSV filled of users. <br>
By default, the generated columns are the following : 
<br>
```
# Define the column headers
    column_headers = ["First Name", "Last Name", "Display Name", "Description", "Email", "Address", "City", "ZIP Code",
                      "sAMAccountName", "UPN", "Company", "Job Title", "Department"]
```
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/fake_users.png" alt="Logo" width="650" height="250">
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
<br>
### Adding users to Active Directory
"AddUsersToAD_CSV_Server.ps1" must be placed in "C:\temp\AD_Automate" as well as "AD_Users_sample.csv".<br>
<br>
Right click and run or edit "AddUsersToAD_CSV_Server.ps1".<br>
You will be asked to enter the OU path where the users will be added in and to set a Password.<br>
Type these information into the prompt.<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_run_users_script.PNG" alt="Logo" width="650" height="265">
<br><br>
You'll get a message indicating how many users has been added as well as how many users are present now in the OU.
<br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_run_users_script_1.PNG" alt="Logo" width="650" height="265">
<br>
What the AD looks like now: <br>
<img src="https://github.com/gelndjj/AD_automate/blob/main/resources/AD_after_users.PNG" alt="Logo" width="650" height="265">


<!-- GETTING STARTED -->
## Standalone APP

Install pyintaller
```
pip install pyinstaller
```
Generate the standalone app
```
pyinstaller --onefile your_script_name.py
```


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
