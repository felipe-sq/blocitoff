class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = Item.create(user_id: @user.id, name: params[:name])

    if item.save!
      flash[:notice] = "Your item was successfully saved!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your item. Please try again."
      redirect_to user_path(current_user)
    end
  end

end
