FactoryBot.define do
  factory :note do
    title { "Sample Note Title" }
    text { "This is the text of the note." }
    association :user, factory: :user

    factory :note_with_admin do
      association :user, factory: :admin
    end
  end
end
