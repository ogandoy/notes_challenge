class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :redirect_if_logged_in, only: [:index]

  def index; end

  def dashboard
    authorize! :read, :dashboard
  end

  private

  def redirect_if_logged_in
    return unless user_signed_in?

    redirect_to(current_user.admin? ? dashboard_path : notes_path)
  end
end
