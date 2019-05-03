require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'scope-tests' do
    let!(:post) { create(:post) }
    let!(:post1) { create(:post) }
    let!(:post2) { build(:post, approve: true).save }
    let!(:post3) { build(:post, approve: true).save }
    let!(:post4) { build(:post, approve: true).save }

    it 'should return unapproved' do
      expect(Post.unapproved.size).to eq(2)
    end

    it 'should return approved' do
      expect(Post.approved.size).to eq(3)
    end

    it 'default scope test return desc' do
      expect(Post)
    end
  end

  describe 'default scope test' do
    let!(:post) { create(:post) }
    let!(:post1) { create(:post) }

    it 'order by desc post' do
      Post.all.except eq [post1, post]
    end
  end

  describe 'Association-tests' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:suggestions).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:reports).dependent(:destroy) }
  end

  describe 'Methods-test' do
    let(:post) { build(:post) }

    before(:each) do
      post.approve
      post.save
    end

    it 'it make approve true' do
      expect(Post.approved.size).to eq(1)
    end
  end

  describe 'validation-tests' do
    let(:post) { build(:post) }

    it 'ensures title presence' do
      post.title = nil
      expect(post.save).to eq(false)
    end

    it 'ensures title length' do
      post.title = 'qwe'
      expect(post.save).to eq(false)
    end

    it 'ensures body presence' do
      post.body = nil
      expect(post.save).to eq(false)
    end

    it 'ensures body length' do
      post.body = 'india'
      expect(post.save).to eq(false)
    end

    it 'should save' do
      expect(post.save).to eq(true)
    end
  end
end
