require_relative 'app/csv_importer'

db = Database.new
db.create_exams_table

CsvImporter.import("./data.csv", db)