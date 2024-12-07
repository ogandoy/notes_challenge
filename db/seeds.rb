# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_details = [
  { email: 'admin1@example.com', name: 'Alice', last_name: 'Smith' },
  { email: 'admin2@example.com', name: 'Bob', last_name: 'Brown' },
  { email: 'admin3@example.com', name: 'Charlie', last_name: 'Johnson' }
]

admins = admin_details.map do |details|
  User.find_or_create_by!(email: details[:email]) do |user|
    user.name = details[:name]
    user.last_name = details[:last_name]
    user.password = 'password123'
    user.password_confirmation = 'password123'
    user.role = 'admin'
  end
end

reader_details = [
  { email: 'reader1@example.com', name: 'David', last_name: 'Williams' },
  { email: 'reader2@example.com', name: 'Ella', last_name: 'Davis' }
]

reader_details.each do |details|
  User.find_or_create_by!(email: details[:email]) do |user|
    user.name = details[:name]
    user.last_name = details[:last_name]
    user.password = 'password123'
    user.password_confirmation = 'password123'
    user.role = 'reader'
  end
end

10.times do |i|
  Note.find_or_create_by!(
    title: "Note #{i + 1}",
    text: "This is the content of note #{i + 1}.",
    user: admins.sample
  )
end
