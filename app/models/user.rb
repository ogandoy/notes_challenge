class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy

  validates :name, :last_name, presence: true

  enum role: { reader: 'reader', admin: 'admin' }

  scope :with_most_notes, lambda {
    joins(:notes)
      .group(:id)
      .order("COUNT(notes.id) DESC")
      .limit(1)
  }

  def self.average_notes_per_user(total_users)
    return 0 if total_users.zero?

    joins(:notes)
      .group('users.id')
      .count
      .values
      .sum / total_users.to_f
  end

  def full_name
    "#{name} #{last_name}"
  end
end
