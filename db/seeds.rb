# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

River.where(url: 'http://www.mynewsdesk.com/partner/api/1_0/LY6eZJ5rZDqDuzBQWBHbVA/channel/607/material/list').first_or_create(name: 'Nile')
Rake::Task['rivers:fetch_pearls'].invoke
