import csv
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
