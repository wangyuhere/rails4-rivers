# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
River.delete_all
Pearl.delete_all

River.create(name: "Nile", api_key: 'LY6eZJ5rZDqDuzBQWBHbVA', channel_ids: [607])
Rake::Task['rivers:fetch_pearls'].invoke
