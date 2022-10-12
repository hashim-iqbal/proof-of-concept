require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should define_enum_for(:type).with(%i[conversion impression]) }

    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:revenue) }

    subject { FactoryBot.build(:event) }
    it { should validate_uniqueness_of(:user_id).scoped_to(%i[type time]) }
  end
end
