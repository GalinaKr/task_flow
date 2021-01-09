class JoinController < ApplicationController
  before_action :check_signed_in

  def index; end

  def check_signed_in
    redirect_to current_signup_step_url if user_signed_in?
  end
end
