require "faker"
require "open-uri"

puts "Nettoyage de la base..."
Comment.destroy_all
Article.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("users")
ActiveRecord::Base.connection.reset_pk_sequence!("articles")
ActiveRecord::Base.connection.reset_pk_sequence!("comments")


puts "Création des utilisateurs..."
password = 'password'

user = User.create!(username: 'rosa', email: 'test@test.com', password: password, password_confirmation: password)

users = 5.times do
  User.create!(username: Faker::Internet.username,
    email: Faker::Internet.email, password: password, password_confirmation: password
  )
end

allUsers = User.all

puts "Création des articles avec images..."

30.times do
  article = Article.create!(
    title: Faker::Book.title,
    content: Faker::JapaneseMedia::StudioGhibli.quote + " " + Faker::TvShows::Friends.quote + " " + Faker::TvShows::SouthPark.quote,
    user: allUsers.sample,
    is_private: [true, false].sample
  )

  rand(1..3).times do
    file = URI.open("https://picsum.photos/800/600")
    article.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  end

    rand(1..5).times do
    Comment.create!(
      content: Faker::Quote.famous_last_words,
      user: allUsers.sample,
      article: article
    )
  end
end

puts "Seeds terminés ✅"
