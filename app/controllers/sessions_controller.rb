class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin == true
        redirect_to admin_path, notice: "Signed in successfully as an admin!"
      else
        redirect_to root_path, notice: "Signed in successfully!"
      end
    else
      redirect_to sign_in_path, alert: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully Signed Out!"
  end
end
