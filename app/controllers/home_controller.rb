class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all.where(:user_id => current_user.id)
    @events = Event.all
    @medical = Medical.all
    @conversations = current_user.mailbox.conversations
  end
end
