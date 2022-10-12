# frozen_string_literal: true

namespace :users do
  desc 'Populate all users using JSON file'
  task import: [:environment] do
    $stdout.puts "Please provide file path to import all user's records i.e. `./data/users.json` "
    file_name = $stdin.gets.strip.downcase

    if File.exist?(file_name)
      user_file = File.read(file_name)
      users = JSON.parse(user_file)

      $stdout.puts "Importing users(#{users.count}) records"
      User.import users, validate_uniqueness: true
      $stdout.puts "Imported users(#{users.count}) records"
    else
      $stdout.puts 'Your provided path does not contain any file.'
    end
  end
end
