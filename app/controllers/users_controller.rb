class UsersController < ApplicationController

	
  def edit
    @user = User.find(params[:id])
    # debugger
    # redirect_to @user
  end
  def new
  	@user = User.new
  end
  def create
  	 @user = User.new(params[:user])
  	 if @user.save
       #debugger
        redirect_to @user
      else
        render 'new'
      end 
  	
  end
  def show
    @user = User.find(params[:id])
  end
end
