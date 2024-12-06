require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:admin) { create(:admin) }
  let(:reader) { create(:user) }
  let(:note) { create(:note, user: admin) }
  let(:other_note) { create(:note, user: reader) }

  describe "GET #index" do
    it "allows admins to access the notes index" do
      sign_in admin
      get :index
      expect(response).to have_http_status(:success)
    end

    it "allows readers to access the notes index" do
      sign_in reader
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "allows admins to access their own note" do
      sign_in admin
      get :show, params: { id: note.id }
      expect(response).to have_http_status(:success)
    end

    it "allows readers to access any note" do
      sign_in reader
      get :show, params: { id: note.id }
      expect(response).to have_http_status(:success)
    end

    it "doesn't allow admins to access another user's note" do
      sign_in admin
      get :show, params: { id: other_note.id }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST #create" do
    it "allows admins to create a note" do
      sign_in admin
      post :create, params: { note: { title: "New Note", text: "Sample text" } }
      expect(Note.count).to eq(1)
      note = Note.last
      expect(response).to redirect_to(note_path(note))
    end

    it "prevents readers from creating a note" do
      sign_in reader
      post :create, params: { note: { title: "New Note", text: "Sample text" } }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to view this page.")
    end
  end

  describe "GET #edit" do
    it "allows admins to edit their own notes" do
      sign_in admin
      get :edit, params: { id: note.id }
      expect(response).to have_http_status(:success)
    end

    it "prevents admins from editing other users' notes" do
      sign_in admin
      get :edit, params: { id: other_note.id }
      expect(response).to redirect_to(notes_path)
      expect(flash[:alert]).to eq("The note you're looking for doesn't exist or may have been removed.")
    end

    it "prevents readers from editing any notes" do
      sign_in reader
      get :edit, params: { id: note.id }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to view this page.")
    end
  end

  describe "DELETE #destroy" do
    it "allows admins to delete their own notes" do
      sign_in admin
      delete :destroy, params: { id: note.id }
      expect(response).to redirect_to(notes_path)
      expect(flash[:notice]).to eq("Note was successfully destroyed.")
    end

    it "prevents admins from deleting other users' notes" do
      sign_in admin
      delete :destroy, params: { id: other_note.id }
      expect(response).to redirect_to(notes_path)
      expect(flash[:alert]).to eq("The note you're looking for doesn't exist or may have been removed.")
    end

    it "prevents readers from deleting any notes" do
      sign_in reader
      delete :destroy, params: { id: note.id }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to view this page.")
    end
  end
end
