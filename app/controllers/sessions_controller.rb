class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # avoid attackers to obtains a copy of the session id and then uses it to log in as the user
      reset_session
      log_in(user)
      redirect_to root_path
    else
      flash[:notice] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
  end
end
