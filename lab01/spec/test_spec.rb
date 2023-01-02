require_relative "../app/csv_importer"

describe CsvImporter do
  describe '.old_import' do
    it 'parse csv into json' do
      result = CsvImporter.old_import("spec/support/test.csv")
      

      parsed_result = JSON.parse(result)
      first_row = parsed_result.first

      expect(first_row["cpf"]).to eq "048.973.170-88"
      expect(first_row["nome paciente"]).to eq "Emilly Batista Neto"
      expect(first_row["email paciente"]).to eq "gerald.crona@ebert-quigley.com"
      expect(first_row["data nascimento paciente"]).to eq "2001-03-11"
      expect(first_row["endereço/rua paciente"]).to eq "165 Rua Rafaela"
      expect(first_row["cidade paciente"]).to eq "Ituverava"
      expect(first_row["estado paciente"]).to eq "Alagoas"
      expect(first_row["crm médico"]).to eq "B000BJ20J4"
      expect(first_row["crm médico estado"]).to eq "PI"
      expect(first_row["nome médico"]).to eq "Maria Luiza Pires"
      expect(first_row["email médico"]).to eq "denna@wisozk.biz"
      expect(first_row["token resultado exame"]).to eq "IQCZ17"
      expect(first_row["data exame"]).to eq "2021-08-05"
      expect(first_row["tipo exame"]).to eq "hemácias"
      expect(first_row["limites tipo exame"]).to eq "45-52"
      expect(first_row["resultado tipo exame"]).to eq "97"
    end
  end
end