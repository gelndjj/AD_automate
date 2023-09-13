import csv
def create_template(file_path):
    with open(file_path, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(["sAMAccountName", "AD GROUP"])

    print(f"CSV template created at {file_path}")

if __name__ == "__main__":
    template_file = "AD_GRP_sample.csv"
    create_template(template_file)
