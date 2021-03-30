# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bicycle.destroy_all
Manufacturer.destroy_all
Book.destroy_all
Author.destroy_all


trek = Manufacturer.create!(name: 'Trek', year_founded: 1922, manufactured_in_us: true)
bianchi = Manufacturer.create!(name: 'Bianchi',  year_founded: 1888, manufactured_in_us: false)
motobecane = Manufacturer.create!(name: 'Motobecane',  year_founded: 1920,  manufactured_in_us: false)
lynskey = Manufacturer.create!(name: 'Lynskey',  year_founded: 1960,  manufactured_in_us: true)
kona = Manufacturer.create!(name: 'Kona',  year_founded: 1950,  manufactured_in_us: true)

trek.bicycles.create!(model: 'Wander Lust', price: 1200,  has_rack_mount: true)
trek.bicycles.create!(model: 'Bomber', price: 2500,  has_rack_mount: false)
kona.bicycles.create!(model: 'Rove Ti', price: 5000,  has_rack_mount: true)
kona.bicycles.create!(model: 'Coiler', price: 1000,  has_rack_mount: false)
motobecane.bicycles.create!(model: 'Kilo TT', price: 500,  has_rack_mount: false)
motobecane.bicycles.create!(model: 'Cafe', price: 750,  has_rack_mount: false)
lynskey.bicycles.create!(model: 'R150', price: 4000,  has_rack_mount: false)
lynskey.bicycles.create!(model: 'R500', price: 8000,  has_rack_mount: false)
bianchi.bicycles.create!(model: 'Zolder Pro', price: 3500,  has_rack_mount: true)
bianchi.bicycles.create!(model: 'Aria', price: 3500,  has_rack_mount: false)


noam_chomsky = Author.create!(name: 'Noam Chomsky', age: 92, is_alive: true)
james_joyce = Author.create!(name: 'James Joyce', age: 58, is_alive: false)
gabriel_garcia_marquez = Author.create!(name: 'Gabriel Garcia Marquez', age: 87, is_alive: false)
david_berman = Author.create!(name: 'David Berman', age: 52, is_alive: false)
peter_kropotkin = Author.create!(name: 'Peter Kropotkin', age: 78, is_alive: false)
jennifer_egan = Author.create!(name: 'Jennifer Egan', age: 58, is_alive: true)
patrick_radden_keefe = Author.create!(name: 'Patrick Radden Keefe', age: 45, is_alive: true)
joan_didion = Author.create!(name: 'Joan Didion', age: 86, is_alive: true)

noam_chomsky.books.create!(title: 'Understanding Power', number_of_pages: 416,  digital: false)
noam_chomsky.books.create!(title: 'Manufacturing Consent', number_of_pages: 480,  digital: false)
james_joyce.books.create!(title: 'Ulysses', number_of_pages: 730,  digital: true)
gabriel_garcia_marquez.books.create!(title: 'One Hundred Years Of Solitude', number_of_pages: 417,  digital: true)
david_berman.books.create!(title: 'Actual Air', number_of_pages: 93,  digital: false)
peter_kropotkin.books.create!(title: 'The Conquest Of Bread', number_of_pages: 304,  digital: false)
patrick_radden_keefe.books.create!(title: 'Say Nothing', number_of_pages: 464,  digital: true)
jennifer_egan.books.create!(title: 'A Visit From The Goon Squad', number_of_pages: 288,  digital: true)
joan_didion.books.create!(title: 'The Year Of Magical Thinking', number_of_pages: 240,  digital: true)
joan_didion.books.create!(title: 'Blue Nights', number_of_pages: 268,  digital: true)
