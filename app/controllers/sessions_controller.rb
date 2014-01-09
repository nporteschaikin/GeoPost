class SessionsController < ApplicationController
  
	before_filter  :signed_out, only: [:new, :create]
	before_filter  :signed_in,  only: [:destroy]
  
  def new; end
  
  def create
    user = User.find_by_email_or_username params[:session][:email_or_username]
    if user and user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_path
    else
			flash.now[:error] = "Invalid email or password."
			render "new"
    end
  end
  
  def destroy
    sign_out
    redirect_to sign_in_path
  end
  
end