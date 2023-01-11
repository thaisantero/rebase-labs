# frozen_string_literal: true

require 'csv'
require 'json'
require 'byebug'
require_relative './database'

class CsvImporter
  def self.old_import(csv_path)
    rows = CSV.read(csv_path, col_sep: ';')

    columns = rows.shift

    rows.map do |row|
      row.each_with_object({}).with_index do |(cell, acc), idx|
        column = columns[idx]
        acc[column] = cell
      end
    end.to_json
  end

  def self.import(csv_path, db)
    CSV.foreach(csv_path, col_sep: ';', headers: true) do |row|
      db.insert_exam(row)
    end
  end
end
