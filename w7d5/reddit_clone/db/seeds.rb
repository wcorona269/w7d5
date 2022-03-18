# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

u1 = User.create(username: Faker::Music::Hiphop.artist, password: 'password')
u2 = User.create(username: Faker::Music::Hiphop.artist, password: 'password')
u3 = User.create(username: Faker::Music::Hiphop.artist, password: 'password')

sub1 = Sub.create(title: Faker::Music::Hiphop.subgenres, description: Faker::TvShows::BojackHorseman.tongue_twister, moderator_id: u1.id)
sub2 = Sub.create(title: Faker::Music::Hiphop.subgenres, description: Faker::TvShows::BojackHorseman.tongue_twister, moderator_id: u2.id)
sub3 = Sub.create(title: Faker::Music::Hiphop.subgenres, description: Faker::TvShows::BojackHorseman.tongue_twister, moderator_id: u3.id)

post1 = Post.create(title: Faker::TvShows::BojackHorseman.character,
                    content: Faker::TvShows::BojackHorseman.quote,
                    sub_id: sub1.id,
                    author_id: u1.id
                    )

post2 = Post.create(title: Faker::TvShows::BojackHorseman.character,
                    content: Faker::TvShows::BojackHorseman.quote,
                    sub_id: sub1.id,
                    author_id: u2.id
                    )