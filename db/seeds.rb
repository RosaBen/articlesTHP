require "faker"

Article.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('articles')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

password = 'password'

user = User.create!(username: 'rosa', email: 'test@test.com', password: password, password_confirmation: password)

users = 5.times do
  User.create!(username: Faker::Internet.username,
    email: Faker::Internet.email, password: password, password_confirmation: password
  )
end

allUsers = User.all

30.times do
  Article.create!(
    title: Faker::Book.title,
    content: Faker::JapaneseMedia::StudioGhibli.quote + " " + Faker::TvShows::Friends.quote + " " + Faker::TvShows::SouthPark.quote,
    user: allUsers.sample,
    is_private: [true, false].sample
  )
end
