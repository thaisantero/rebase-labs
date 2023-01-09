class Importer
  attr_reader :db

  def initialize
    @db = Database.new
  end

  def execute
    db.create_exams_table
    CsvImporter.import("./data.csv", db)
  end
end