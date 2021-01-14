class JoinController < ApplicationController
  before_action :check_signed_in

  def index; end

  private

  def check_signed_in
    redirect_to projects_path if user_signed_in?
  end
end
