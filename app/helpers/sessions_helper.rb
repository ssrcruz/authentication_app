module SessionsHelper
  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # returns the current logged in user, if any.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if the user is logged in, false if otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out user
  def logout
    session[:user_id] = nil
  end
end
