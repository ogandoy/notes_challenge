class Note < ApplicationRecord
  belongs_to :user

  validates :title, :text, presence: true
end
