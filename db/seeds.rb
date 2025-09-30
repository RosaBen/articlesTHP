require "faker"

Article.destroy_all

30.times do
  Article.create!(
    title: Faker::Book.title,
    content: Faker::JapaneseMedia::StudioGhibli.quote + " , " + Faker::TvShows::Friends.quote + " , "+Faker::TvShows::SouthPark.quote
  )
end
