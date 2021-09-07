module SessionsHelper
  def log_in(user)
    # session adds a temporary incrypted cookie
    session[:user_id] = user.id
  end

  def current_user
    # @current_user = @current_user(if any) || User.find_by(id: session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
