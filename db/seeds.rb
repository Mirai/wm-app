# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
ModelType.create(:name => 'Warcaster')
ModelType.create(:name => 'Light Warjack')
ModelType.create(:name => 'Heavy Warjack')
ModelType.create(:name => 'Unit')
ModelType.create(:name => 'Solo')

Role.create(:name => 'admin')
Role.create(:name => 'guest')

User.create(:email => 'admin@wmapp.com', :password => 'pass123', :password_confirmation => 'pass123')