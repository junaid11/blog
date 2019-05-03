require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  describe 'Suggestion-validation-tests' do
    let(:suggestion) { build(:suggestion) }

    it 'ensures suggestion body presence' do
      suggestion.body = nil
      expect(suggestion.save).to eq(false)
    end

    it 'ensures suggestion reference_text presence' do
      suggestion.reference_text = nil
      expect(suggestion.save).to eq(false)
    end

    it 'should save' do
      expect(suggestion.save).to eq(true)
    end
  end

  describe 'Association-tests' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
