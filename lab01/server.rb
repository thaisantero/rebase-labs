# frozen_string_literal: true
require 'byebug'
require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require_relative 'app/jobs/importer_job'
Dir['./app/*.rb'].each { |file| require file }

set :public_folder, 'public'
set :views, 'app/views'

get '/tests' do
  db = Database.new
  db.return_exams.to_json
end

get '/index.html' do
  send_file File.join(settings.public_folder, 'views/index.html')
end

get '/import' do
  ImporterJob.perform_async
end

get '/show/:token' do
  db = Database.new
  data = db.find_by_token(params[:token])

  erb :show, locals: { data: }
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)
