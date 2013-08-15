# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

River.where(api_key: 'LY6eZJ5rZDqDuzBQWBHbVA').first_or_create(name: 'Nile', channel_ids: [607])
Rake::Task['rivers:fetch_pearls'].invoke
