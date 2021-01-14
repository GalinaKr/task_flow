class RegistrationsController < Devise::RegistrationsController
  before_action :check_signed_in
  before_action :configure_sign_up_params, only: [:create]

  def new
    super
  end

  def create
    super
  end

  protected

  def check_signed_in
    redirect_to projects_path(current_user) if signed_in?
  end

  def after_sign_in_path_for(_resource)
    projects_path(current_user)
  end

  def after_sign_up_path_for(_resource)
    projects_path(current_user)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name email])
  end
end