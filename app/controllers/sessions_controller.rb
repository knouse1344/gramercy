class SessionsController < ApplicationController
    def new
    	if signed_in?
    		sign_out
    		redirect_to @user
    	end
    end
 
	def create
		user = User.find_by(username: params[:session][:username].downcase)
	    if user && user.authenticate(params[:session][:password])
	      sign_in user
	      flash[:success] = "Welcome back!"
	      redirect_to user
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
	end

	def destroy
		sign_out
		flash[:success] = "See you again soon!"
		redirect_to root_url
	end
end
