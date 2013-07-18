# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name


Cocktail.create(user_id: '1', name: "Mojito", description: "Great drink if you have mint lying around.", instructions: "Muddle mint, add all ingredients, DONT SHAKE, stir.")
Cocktail.create(user_id: '1', name: "Cape Fizz", description: "Kind of a girly drink.", instructions: "Put twice as much alcohol in and you won't even taste it..")

