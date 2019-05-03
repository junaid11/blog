require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation-tests' do
    let(:comment) { build(:comment) }

    it 'ensures comment body presence' do
      comment.body = nil
      expect(comment.save).to eq(false)
    end

    it 'should save' do
      expect(comment.save).to eq(true)
    end
  end

  describe 'Association-tests' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should have_many(:replies).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:reports).dependent(:destroy) }
  end
end
