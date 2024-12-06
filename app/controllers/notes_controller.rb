class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @notes = current_user.admin? ? current_user.notes : Note.all
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note, notice: I18n.t('notices.note_created')
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: I18n.t('notices.note_updated')
    else
      render 'edit'
    end
  end

  def destroy
    if @note.destroy
      redirect_to notes_path, notice: I18n.t('notices.note_destroyed')
    else
      redirect_to notes_path, alert: I18n.t('alerts.destroy_error')
    end
  end

  private

  def find_note
    @note = if current_user.admin?
              current_user.notes.find_by(id: params[:id])
            else
              Note.find_by(id: params[:id])
            end

    redirect_to notes_path, alert: I18n.t('alerts.note_not_found') unless @note
  end

  def note_params
    params.require(:note).permit(:title, :text)
  end
end
