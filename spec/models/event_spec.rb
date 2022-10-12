require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:revenue) }
    it { should validate_inclusion_of(:type).in_array(Event::TYPES) }

    subject { FactoryBot.build(:event) }
    it { should validate_uniqueness_of(:user_id).scoped_to(%i[type time]) }
  end
end
