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

      it 'redirects to user#show'

      it 'should belong to the user'



      context 'blank item' do
        it 'displays an error'
      end
    end

    context 'user not signed in' do
      it 'does not create an item'
    end
  end
end
