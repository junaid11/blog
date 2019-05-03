require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'Association-tests' do
    it { should belong_to(:reportable) }
    it { should belong_to(:user) }
  end
end
