# frozen_string_literal: true

require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require_relative 'app/jobs/importer_job'
Dir['./app/*.rb'].each { |file| require file }

set :public_folder, 'public'

get '/tests' do
  db = Database.new
  db.return_exams.to_json
end

get '/index.html' do
  send_file File.join(settings.public_folder, 'views/index.html')
end

get '/hello' do
  'Hello world!'
end

get '/import' do
  ImporterJob.perform_async
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
