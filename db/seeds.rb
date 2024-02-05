# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cats = [
  {
    name: 'Sir Whiskerton the Brave',
    age: 2,
    enjoys: 'Knighted for his bravery against vacuums, Sir Whiskerton seeks a tuna-loving hero with box-sitting prowess. Dislikes dogs, loves can-opening allies.',
    image: 'http://tinyurl.com/22357jc4'
  },
  {
    name: 'Lord Fluffington',
    age: 4,
    enjoys: 'Opera singer by night, sunbeam aficionado by day, Lord Fluffington wants a silent judge of vet escapes and a connoisseur of chin scratches and gourmet treats.',
    image: 'http://tinyurl.com/3j77astf'
  },
  {
    name: 'Professor Paws',
    age: 6,
    enjoys: 'Scholar of napology and bird-watching, Professor Paws looks for a curious mind ready to debate the red dot mystery and explore cardboard box universes.',
    image: 'http://tinyurl.com/5574p428'
  }
]

cats.each do |cat|
  Cat.create cat
  puts "creating cat #{cat}"
end