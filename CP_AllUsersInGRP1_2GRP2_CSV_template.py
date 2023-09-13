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
