# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: Faker::Avatar.image
  )
  user.save!
end


10.times do
  yacht = Yacht.new(
    name: Faker::Pokemon.name,
    description: Faker::Lorem.sentence,
    location: ["Nice", "Monaco", "Cannes"].sample,
    price: (1000..40000).to_a.sample,
    photo_urls: ['https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/80_foot_motor_yacht_Alchemist_photo_D_Ramey_Logan.jpg/350px-80_foot_motor_yacht_Alchemist_photo_D_Ramey_Logan.jpg','https://www.yachtcharterfleet.com/resources/images/section-headers/superyacht-charter.jpg','http://masteryachts.com/wp-content/uploads/2015/05/slider-tablets.png','https://s-media-cache-ak0.pinimg.com/originals/8b/89/ec/8b89ec6f5d201c8b713cdfae2ec39cbe.jpg','https://www.moranyachts.com/sites/default/files/aurora_site.jpg','http://yachtforsaleturkey.net/wp-content/uploads/images/2013/08/yacht-for-sale-master-1350-625.jpg'].sample(3),
    length: (20..100).to_a.sample,
    cabins: (1..12).to_a.sample,
    width: (7..20).to_a.sample,
    capacity: (2..15).to_a.sample,
    available: [true, false].sample,
    air_c: [true, false].sample,
    crew: (1..6).to_a.sample,
    user_id: (1..5).to_a.sample
    )
    yacht.save!
  end




