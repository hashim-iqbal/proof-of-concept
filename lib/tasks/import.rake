# frozen_string_literal: true

namespace :import do
  desc 'Populate all data(User or Event) using JSON file'
  task users: [:environment] do |task|
    populate_table_from_file(model(task))
  end

  task events: [:environment] do |task|
    populate_table_from_file(model(task))
  end
end

private

def populate_table_from_file(model_name)
  prompt_file(model_name)
  collection = JSON.parse(File.read(@file_name))

  $stdout.puts "Importing #{model_name} (#{collection.count}) records"

  collection.in_groups_of(1000, false).each do |record_group|
    ActiveRecord::Base.transaction do
      record_group&.each do |record|
        model_name.constantize.find_or_initialize_by(id: record['id']).update(record.except('id'))
      end
      print('- ')
    end
  end
  puts ''

  $stdout.puts "Imported #{model_name} (#{collection.count}) records"
end

def model(task)
  task.to_s.split(':').last.singularize.capitalize
end

def prompt_file(model_name)
  $stdout.puts "Please provide file path to import records i.e.\
  #{model_name == 'Event' ? '`./data/event_data.json`' : '`./data/users.json`'}"
  @file_name = $stdin.gets.strip.downcase

  abort('Your provided path does not contain any file.') unless File.exist?(@file_name)
end
