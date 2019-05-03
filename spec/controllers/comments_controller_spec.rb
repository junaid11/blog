require 'rails_helper'

describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post1) { create(:post) }

  before { sign_in user }

  describe 'Delete Comment#Destroy' do
    let(:comment) { build(:comment) }

    it 'should destroy Comment' do
      user.add_role :user
      comment.user_id = user.id
      comment.post_id = post1.id
      comment.save
      delete :destroy, params: { post_id: post1.id, id: comment.id, format: :js }
      expect(Comment.all.count).to eq(0)
    end
  end

  describe 'Post Comment#Create' do
    context 'with valid attributes' do
      let!(:comment) { build(:comment) }
      it 'should save new Comment' do
        comment.post_id = post1.id
        post :create, params: { post_id: post1.id, comment: { body: comment.body }, format: :js }
        expect(Comment.all.count).to eq(1)
      end
    end
  end
end
