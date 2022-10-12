# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    type { %i[conversion impression].sample }
    revenue { Faker::Number.decimal(l_digits: 2) }

    association :user
  end
end
