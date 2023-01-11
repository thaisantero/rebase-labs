# frozen_string_literal: true

require 'pg'

class Database
  def initialize
    @conn = PG.connect(host: 'postgres', user: 'postgres', dbname: 'postgres')
  end

  def create_exams_table
    @conn.exec("CREATE TABLE IF NOT EXISTS exams(
			cpf VARCHAR(100),
			nome_paciente VARCHAR(100),
			email_paciente VARCHAR(100),
			data_nascimento_paciente VARCHAR(100),
			endereco_rua_paciente VARCHAR(100),
			cidade_paciente VARCHAR(100),
			estado_paciente VARCHAR(100),
			crm_médico VARCHAR(100),
			crm_médico_estado VARCHAR(100),
			nome_médico VARCHAR(100),
			email_médico VARCHAR(100),
			token_resultado_exame VARCHAR(100),
			data_exame VARCHAR(100),
			tipo_exame VARCHAR(100),
			limites_tipo_exame VARCHAR(100),
			resultado_tipo_exame VARCHAR(100)
			)")
  end

  def insert_exam(exam)
    @conn.exec("INSERT INTO exams (cpf, nome_paciente, email_paciente, data_nascimento_paciente,
			endereco_rua_paciente, cidade_paciente, estado_paciente, crm_médico, crm_médico_estado,
			nome_médico, email_médico, token_resultado_exame, data_exame, tipo_exame,
		limites_tipo_exame, resultado_tipo_exame) VALUES ('#{exam[0]}', '#{exam[1]}', '#{exam[2]}',
			'#{exam[3]}', '#{exam[4]}', '#{PG::Connection.escape_string(exam[5])}', '#{exam[6]}', '#{exam[7]}',
			'#{exam[8]}', '#{exam[9]}', '#{exam[10]}', '#{exam[11]}', '#{exam[12]}',
			'#{exam[13]}', '#{exam[14]}', '#{exam[15]}')")
  end

  def return_exams
    @conn.exec('SELECT * FROM exams').to_a
  end

  def drop_exams
    @conn.exec('DROP TABLE exams')
  end

	def find_by_token(token)
		@conn.exec(
			"SELECT * from exams
			WHERE token_resultado_exame = '#{token}'"
		).to_a
	end
end
