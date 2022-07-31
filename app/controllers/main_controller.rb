class MainController < ApplicationController
  def index
    if !Current.user.nil?
      @notification = Current.user.notifications.order(id: :desc)
    end
    puts @notification
  end

  def notify
  end

  private

  def notif_params
    params.require(:notification).permit(:user_id, :message)
  end
end
