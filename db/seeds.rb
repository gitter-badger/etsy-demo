
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Create Users"
Stripe.api_key = ENV["STRIPE_API_KEY"]

u=User.create!(:name => "Filipe Rocha", :email => "filiperocha@gmail.com", :password => "ripsonix")
# if u.recipient.blank?
#   Stripe.api_key = ENV["STRIPE_API_KEY"]
#       # token = params[:stripeToken]

#       recipient = Stripe::Recipient.create(
#         :name => u.name,
#         :type => "individual",
#         :bank_account => token
#         )

#       current_user.recipient = recipient.id
#       current_user.save
#     end

puts u.name


# 3.times {|i| u=User.create!(:name => Faker::Name.name, :email => Faker::Internet.email, :password => "ripsonix");  puts u.name}
# puts "@done"
# puts "Create Listings"

# User.all.each{|u| u.recipient=Stripe::Recipient.create(:name => u.name, :type => "individual").id; u.save!}
# # Listing.populate 100 do |l|
# #   randm=rand(3)+1
# #   l.name=Faker::Lorem.words(rand(3)+1).join(" ")
# #   l.description=Faker::Lorem.paragraphs(randm).join(" ")
# #   l.price = Faker::Number.number(randm.to_f+rand.round(2)+1)
# #   l.image = File.open(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample)
# # end
# # Listing.all.each { |l| l.image = File.open(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample); puts l.name; puts l.save! }

# 10.times do |i|
#   image=File.new(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample,'rb')
#   randm=rand(3)+1
#   l=Listing.new
#   l.image=File.open(Dir.glob(File.join(Rails.root, 'db/seeds', '*')).sample)
#   l.name=Faker::Lorem.words(randm).join(" ").titleize
#   l.description=Faker::Lorem.paragraphs(randm).join(" ")
#   l.price = Faker::Number.number(randm.to_f+rand.round(2)).to_f+1
#   l.user_id =User.all[rand(3)].id
#   l.save!
#   puts l.name
# end
puts "@done"