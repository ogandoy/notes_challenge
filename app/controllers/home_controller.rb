class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :redirect_if_logged_in, only: [:index]

  def index; end

  def dashboard
    authorize! :read, :dashboard

    set_user_data
    set_average_metrics
  end

  private

  def redirect_if_logged_in
    return unless user_signed_in?

    redirect_to(current_user.admin? ? dashboard_path : notes_path)
  end

  def set_average_metrics
    @average_notes_per_user = User.average_notes_per_user(@total_users).round(2)
    @average_words_per_note = Note.average_word_count(@total_notes)
  end

  def set_user_data
    @total_users = User.count
    @total_notes = Note.count

    @user_with_most_notes = User.with_most_notes.first.full_name
    @user_with_longest_note = Note.with_longest_text.first.user.full_name
  end
end
