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
ModelType.create(:name => 'Model')
ModelType.create(:name => 'Solo')