# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: "test@activeadmin.com", password: "ActiveNowSecret", password_confirmation: "ActiveNowSecret")

10.times do |i|
  Project.create(name: "Testowy projekt #{i}", user: User.last)
end

6.times do |i|
  Task.create(title: "Testowe zadanie #{i}",
              description: "Testowy opis do zadania #{i}, do wykonania jest testowy podpunkt",
              status: :todo,
              due_date: Date.today + 7.days,
              project: Project.last)
end

3.times do |i|
  Task.create(title: "Testowe zadanie #{i}",
              description: "Testowy opis do zadania #{i}, do wykonania jest testowy podpunkt",
              status: :todo,
              due_date: Date.today + 7.days,
              project: Project.first)
end
