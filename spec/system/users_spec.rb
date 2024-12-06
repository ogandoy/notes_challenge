require 'rails_helper'

RSpec.describe 'User Management', type: :system do
  let!(:admin) { create(:admin) }
  let!(:reader) { create(:user) }
  let!(:reader2) { create(:user) }
  let!(:note) { create(:note, user: admin) }
  let!(:other_note) { create(:note, user: admin) }

  before do |scenario|
    login_as(send(scenario.metadata[:login_as])) if scenario.metadata[:login_as]
  end

  context 'when logged in as a regular user', login_as: :reader do
    it 'does not show the "User Managment" option in the navbar' do
      visit root_path
      expect(page).not_to have_link('User Managment')
    end

    it 'cannot access the manage user page' do
      visit users_path
      expect(page).to have_content('You are not authorized to view this page.')
    end
  end

  context 'when logged in as an admin user', login_as: :admin do
    it "allows the admin to change a user's role from reader to admin" do
      visit users_path

      expect(reader.role).to eq('reader')
      expect(reader2.role).to eq('reader')

      within("tr#user_#{reader.id}") do
        find("input[type='radio'][value='admin']").set(true)
        click_button 'Save'
      end

      within("tr#user_#{reader2.id}") do
        find("input[type='radio'][value='admin']").set(true)
        click_button 'Save'
      end

      expect(page).to have_content('Role was successfully updated.')

      expect(reader.reload.role).to eq('admin')
      expect(reader2.reload.role).to eq('admin')
    end

    it "allows the admin to change a user's role from admin to reader" do
      visit users_path

      expect(admin.role).to eq('admin')

      within("tr#user_#{admin.id}") do
        find("input[type='radio'][value='reader']").set(true)
        click_button 'Save'
      end

      expect(page).to have_content('Role was successfully updated.')

      expect(admin.reload.role).to eq('reader')
    end
  end
end
