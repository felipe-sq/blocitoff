class ItemsController < ApplicationController

  def create
    puts 'am i here?'
    @user = User.find(params[:user_id])
    @item = @user.items.new(user_id: @user.id, name: params[:name])
    @item.user = @user

    if @item.save!
      p 'did it'
      flash[:notice] = "Your item was successfully saved!"
      redirect_to user_path(current_user)
    else
      p 'error'
      flash[:error] = "There was an error saving your item. Please try again."
      redirect_to user_path(current_user)
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :name)
  end
end
