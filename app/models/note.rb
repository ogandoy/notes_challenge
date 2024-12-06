class Note < ApplicationRecord
  belongs_to :user

  validates :title, :text, presence: true

  scope :with_longest_text, lambda {
    order("LENGTH(text) DESC").limit(1)
  }

  def self.average_word_count(total_notes)
    total_words = Note.pluck(:text).sum { |text| text.split.size }
    total_notes.zero? ? 0 : total_words / total_notes.to_f
  end
end
