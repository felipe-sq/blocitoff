class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.create(name: params[:item][:name])

    if @item.save!
      flash[:notice] = "Your item was successfully saved!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error saving your item. Please try again."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted."
    #  redirect_to user_path(current_user)
    else
      flash[:alert] = "Item couldn't be deleted. Please try again."
    #  redirect_to user_path(current_user)
    end
    #respond_to do |format|
    #  format.html
    #  format.js
    #end
  end
end
