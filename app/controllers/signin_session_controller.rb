class SigninSessionController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])
    #debugger
    if user && user.authenticate(params[:password])

      #signin_session[:user] = user.id

     redirect_to user_path(user)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy

    
  end
end
