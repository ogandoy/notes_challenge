class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def update_role
    user = User.find(params[:id])
    if user.update(role: params[:user][:role])
      redirect_to user.admin? ? users_path : root_path, notice: I18n.t('notices.user.role_updated')
    else
      redirect_to users_path, alerts: I18n.t('notices.user.update_failed')
    end
  end
end
