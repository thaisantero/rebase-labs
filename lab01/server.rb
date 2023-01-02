require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require_relative 'app/csv_importer'

get '/tests' do
  db = Database.new
  db.return_exams.to_json
end

get '/hello' do
  'Hello world!'
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)