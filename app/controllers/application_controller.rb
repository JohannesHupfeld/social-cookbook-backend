class ApplicationController < ActionController::API
  def current_user
    # MOCK of being logged in
    User.find_by(id: session[:user_id])
    # #If current user is already defined then itll equal @ current_user otherwise itll find by id in the users table
    # @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] #The if prevents calls to the database if no need
    # #else already object  <--   then look for object   <--   if this
  end

  def logged_in?
    !!current_user
  end

  # def authorized_to_edit?
  # end
end
