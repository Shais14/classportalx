class SessionsController < ApplicationController
  def new
  end
  def create  
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.privilege == "admin" || user.privilege == "superadmin"
        redirect_to static_pages_admin_url
      elsif user.privilege == "instructor"
        redirect_to static_pages_instructor_url
      elsif user.privilege == "student"
        redirect_to static_pages_student_url
      else
        redirect_to static_pages_home_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
