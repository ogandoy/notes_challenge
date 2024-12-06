class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: I18n.t('errors.access_denied')
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
  end
end
