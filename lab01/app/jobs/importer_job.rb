# frozen_string_literal: true

require 'sidekiq'
Dir['./app/*.rb'].each { |file| require file }

class ImporterJob
  include Sidekiq::Job

  def perform
    ::Importer.new.execute
  end
end
