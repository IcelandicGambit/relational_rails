# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Manufacturer.destroy_all
Bicycle.destroy_all
trek = Manufacturer.create!(name: 'Trek', year_founded: 1922, manufactured_in_us?: true)
bianchi = Manufacturer.create!(name: 'Bianchi',  year_founded: 1888, manufactured_in_us?: false)
motobecane = Manufacturer.create!(name: 'Motobecane',  year_founded: 1920,  manufactured_in_us?: false)
lynskey = Manufacturer.create!(name: 'Lynskey',  year_founded: 1960,  manufactured_in_us?: true)
kona = Manufacturer.create!(name: 'Kona',  year_founded: 1950,  manufactured_in_us?: true)

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
