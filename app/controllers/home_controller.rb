class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all.where(:user_id => current_user.id)
    @events = Event.all.order("updated_at DESC").where(start_time: Date.today.beginning_of_day..Date.today.end_of_day)
    @medical = Medical.all
    @conversations = current_user.mailbox.conversations
  end
end
