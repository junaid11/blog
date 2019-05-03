require 'rails_helper'

describe PostsController, type: :controller do
  let!(:user) { create(:user) }

  before { sign_in user }

  describe 'GET Post#index' do
    context 'when the user is logged in' do
      it 'returns a success response' do
        get :index
        expect(response).to be_successful
      end
    end

    context 'when the user is not logged in' do
      before { sign_out user }
      it 'Return no response ' do
        get :index
        should redirect_to new_user_session_path
      end
    end
  end

  describe 'GET Post#show' do
    let!(:post1) { create(:post) }
    it 'returns a success response' do
      get :show, params: { id: post1.id }
      expect(response).to be_successful
    end
  end

  describe 'POST Post#create' do
    context 'with valid attributes' do
      it 'should save new Post' do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        expect(Post.count).not_to be_zero
      end

      it 'should redirect to Post#index' do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        should redirect_to(posts_path)
      end

      it 'Strong parameters check' do
        params = {
          post: {
            title: 'Pakistan1234',
            body: 'jhjljfahssjlfhlahfhaflkahslfhljsjahfljhasdfdfewdfsljleijejej'
          }
        }
        should permit(:title, :body).for(:create, params: params).on(:post)
      end
    end

    context 'with invalid attributes' do
      it 'should not save new post' do
        post :create, params: { post: { title: 'P',
                                        body: 'jhjljfahssjlfhlahfhaflkahslfhljsjahfljhaslsadsjleijejej' } }
        expect(Post.count).to be_zero
      end

      it 'should redirect to new post' do
        post :create, params: { post: { title: 'P',
                                        body: 'jhjljfahssjlfhlahfhaflkahslfhljsjahfljhaslsadsjleijejej' } }
        should render_template('new')
      end
    end
  end

  describe 'Delete Post#Destroy' do
    let!(:post) { build(:post) }

    before do
      user.add_role :user
      post.user_id = user.id
      post.save
    end

    it 'should destroy Post' do
      delete :destroy, params: { id: post.id }
      expect(Post.all.count).to eq(0)
    end

    it 'should redirect to back after destroy' do
      delete :destroy, params: { id: post.id }
      should redirect_to root_path
    end

    context 'User un-authorize user' do
      let!(:user1) { create(:user) }
      before do
        sign_out user
        sign_in user1
      end

      it 'cancan must stop' do
        expect { delete :destroy, params: { id: post.id } }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  describe 'PUT Post#Update' do
    let!(:post) { build(:post) }

    before do
      user.add_role :user
      post.user_id = user.id
      post.save
    end

    context 'Update with valid attributes' do
      it 'should save Updated Post' do
        put :update, params: { id: post.id, post: FactoryBot.attributes_for(:post) }
        expect(Post.count).not_to be_zero
      end

      it 'should redirect to Post#show' do
        put :update, params: { id: post.id, post: FactoryBot.attributes_for(:post) }
        should redirect_to(post_path(post.id))
      end
    end

    context 'Update with invalid attributes' do
      it 'should not save Updated post and render to edit' do
        put :update, params: { id: post.id, post: { title: 'P',
                                                    body: 'jhjljfahssjlfhlahfhaflkahslfhljsjahfljhaslsadsjleijejej' } }
        should render_template('edit')
      end
    end
  end
end
