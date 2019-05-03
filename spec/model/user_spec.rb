require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Association-tests' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:suggestions).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:reports).dependent(:destroy) }
  end
end
