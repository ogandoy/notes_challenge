require 'rails_helper'

RSpec.feature "Dashboard", type: :system do
  let!(:admin) { create(:admin) }
  let!(:admin2) { create(:admin) }
  let!(:note) { create(:note, text: "This is another note, with more words.", user: admin) }
  let!(:other_note) { create(:note, text: "This is a test note.", user: admin2) }
  let!(:note3) { create(:note, text: "This is a another test note.", user: admin2) }

  scenario "Verifying dashboard" do
    login_as(admin)
    visit dashboard_path

    expect(page).to have_content("Total users")
    expect(page).to have_content(2)

    expect(page).to have_content("Total notes")
    expect(page).to have_content(3)

    expect(page).to have_content("Average notes per user")
    expect(page).to have_content(1.5)

    expect(page).to have_content("Average words per note")
    expect(page).to have_content(6)

    expect(page).to have_content("User with Most Notes")
    expect(page).to have_content(admin2.full_name)

    expect(page).to have_content("User with Longest Note")
    expect(page).to have_content(admin.full_name)
  end
end
