# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

land1 = Land.create(name: "Kalotaszeg", img_name: "kalo.png")
land2 = Land.create(name: "Mezőség", img_name: "mezo.png")

Record.create(title: "Széles az Isonzó vize", lyrics: "Széles az Isonzó vize,\nNem tudom tovább a szövegééét...",land: land1, uploader: "admin", created_at: DateTime.new(2023, 4, 14, 17, 38, 53), updated_at: DateTime.new(2023, 4, 14, 17, 38, 53), date: Date.new(2023, 4, 14))
Record.create(title: "Be sok eső, be sok sár", link: "https://www.youtube.com/watch?v=CWf4kuk7NRo&list=RDCWf4kuk7NRo&start_radio=1&pp=ygUXYmUgc29rIGVzxZEgYmUgc29rIHPDoXKgBwE%3D", land: land2, uploader: "oszombati", created_at: DateTime.new(2023, 4, 14, 17, 38, 53), updated_at: DateTime.new(2023, 4, 14, 17, 38, 53), date: Date.new(2023, 4, 14))
