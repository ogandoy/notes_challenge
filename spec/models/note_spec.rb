require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    note = Note.new(title: "Sample Title", text: "Sample text", user: user)
    expect(note).to be_valid
  end

  it "is invalid without a title" do
    note = Note.new(title: nil, text: "Sample text", user: user)
    expect(note).to_not be_valid
  end

  it "is invalid without text" do
    note = Note.new(title: "Sample Title", text: nil, user: user)
    expect(note).to_not be_valid
  end

  it "is invalid without a user" do
    note = Note.new(title: "Sample Title", text: "Sample text", user: nil)
    expect(note).to_not be_valid
  end
end
