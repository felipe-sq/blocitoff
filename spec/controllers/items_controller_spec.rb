require 'rails_helper'
include RandomData

RSpec.describe ItemsController, type: :controller do
  describe '#create' do
    let(:user) { create(:user) }

    context 'user signed in' do
      before { sign_in user }

      it 'can create an item' do
        expect { post :create, user_id: user.id, name: 'something' }.to \
          change { Item.count }.by(1)
      end

      it 'redirects to user#show' do
        post :create, user_id: user.id, item: {name: 'something'}
        expect(response).to redirect_to user
      end

      it 'should belong to the user' do
        post :create, user_id: user.id, item: {name: 'something'}
        expect(assigns(:item)).to eq(user)
      end



      context 'blank item' do
        it 'displays an error' do
          post :create, user_id: user.id, item: {name: 'something'}
          expect(:item).not_to be_nil
        end
      end
    end

    context 'user not signed in' do
      it 'does not create an item' do
        post :create, user_id: user.id, item: {name: 'something'}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
