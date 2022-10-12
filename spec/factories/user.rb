# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    avatar { Faker::LoremFlickr.image }
    occupation { Faker::Job.title }
  end
end
