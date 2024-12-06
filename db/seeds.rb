# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.name = 'Admin'
  user.last_name = 'Admin'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'admin'
end

User.find_or_create_by!(email: 'reader1@example.com') do |user|
  user.name = 'John'
  user.last_name = 'Doe'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'reader'
end

User.find_or_create_by!(email: 'reader2@example.com') do |user|
  user.name = 'Kaci'
  user.last_name = 'Doe'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'reader'
end

admin_user = User.find_by(email: 'admin@example.com')

if admin_user
  10.times do |i|
    Note.find_or_create_by!(
      title: "Note #{i + 1}",
      text: "This is the content of note #{i + 1}.",
      user: admin_user
    )
  end
end
