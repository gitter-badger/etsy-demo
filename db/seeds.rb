
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create Users"

u=User.create!(:name => "User 2", :email => ENV["SPVS_EMAIL"] , :password => ENV["USER_PASSWD"])
puts u.name
u=User.create!(:name => "User 1", :email => ENV["GMAIL_EMAIL"], :password => ENV["USER_PASSWD"])
puts u.name

puts "@done"
puts "Create Listings"

Stripe.api_key = ENV["STRIPE_API_KEY"]
User.all.each{|u| u.recipient=Stripe::Recipient.create(:name => u.name, :type => "individual").id; u.save!}

50.times do |i|
  image=File.new(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample,'rb')
  randm=rand(2)+1
  l=Listing.new
  l.image=File.open(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample)
  l.name=Faker::Lorem.words(randm).join(" ").titleize
  l.description=Faker::Lorem.paragraphs(randm).join(" ")
  l.price = Faker::Number.number(randm.to_f+rand.round(2)).to_f+1
  l.user_id =User.find(rand(2)+1).id
  l.save!
  puts l.name
end
puts "@done"