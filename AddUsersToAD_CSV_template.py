import csv

# Function to create a CSV file with column names only
def create_empty_user_csv(file_name, headers):
    # Open the CSV file in write mode
    with open(file_name, 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Write headers to the CSV file
        csv_writer.writerow(headers)

    print(f"Empty CSV file '{file_name}' with column names created successfully.")

if __name__ == "__main__":
    # Define the column headers
    column_headers = ["First Name", "Last Name", "Display Name", "Description", "Email", "Address", "City", "ZIP Code",
                      "sAMAccountName", "UPN", "Company", "Job Title", "Department"]

    # File name for the CSV file
    csv_file_name = "AD_Users_sample.csv"

    # Create the empty CSV file with column names
    create_empty_user_csv(csv_file_name, column_headers)
