class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
    @my_cart = @user.purchasings
  end

  private
  def users_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
  end
end