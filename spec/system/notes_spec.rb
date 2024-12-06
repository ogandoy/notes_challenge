# spec/features/notes_spec.rb
require 'rails_helper'

RSpec.feature 'Notes', type: :system do
  let(:admin) { create(:admin) }
  let(:reader) { create(:user) }
  let(:note) { create(:note, user: admin) }
  let(:other_note) { create(:note, user: admin) }

  before do |scenario|
    login_as(send(scenario.metadata[:login_as])) if scenario.metadata[:login_as]
  end

  scenario 'User with admin role can create a note', login_as: :admin do
    visit new_note_path

    expect(page).to have_selector('h1', text: 'Add Note')

    fill_in 'Title', with: 'New Note'
    fill_in 'Text', with: 'Content of the new note'
    click_button 'Save'

    expect(page).to have_current_path(note_path(Note.last))
    expect(Note.count).to eq(1)

    expect(page).to have_content('New Note')
    expect(page).to have_content('Content of the new note')
    expect(page).to have_content('Note was successfully created.')
  end

  scenario 'User with reader role is not allowed to create a note', login_as: :reader do
    visit new_note_path

    expect(page).to have_content('You are not authorized to view this page.')
    expect(current_path).to eq(notes_path)
  end

  scenario 'User with reader role is not allowed to update a note', login_as: :reader do
    visit edit_note_path(note)

    expect(page).to have_content('You are not authorized to view this page.')
    expect(current_path).to eq(notes_path)
  end

  scenario 'User with admin role can update his own note', login_as: :admin do
    visit edit_note_path(note)

    expect(page).to have_selector('h1', text: 'Edit Note')

    fill_in 'Title', with: 'Updated note title'
    fill_in 'Text', with: 'Updated text note'
    click_button 'Save'

    expect(page).to have_current_path(note_path(note))
    expect(page).to have_content('Note was successfully updated.')
    expect(page).to have_content('Updated note title')
    expect(page).to have_content('Updated text note')
  end
end
