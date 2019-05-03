require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Association-tests' do
    it { should belong_to(:likeable) }
    it { should belong_to(:user) }
  end
end
