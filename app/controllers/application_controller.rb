class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def student_login_auth_check
    if (Current.user.admin == false && Current.user.id != @student.user_id)
      redirect_to students_path, alert: "You are not an authorized user for this student"
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
  end

  def require_admin_logged_in!
    redirect_to sign_in_path, alert: "You must be an admin to do that." if Current.user.nil? || Current.user.admin == false
  end
end
