Composition.destroy_all
Size.destroy_all
Florist.destroy_all
Relai.destroy_all

puts "#{Composition.count} composition(s) are up"
puts "#{Size.count} composition(s) are up"
puts "#{Florist.count} florist(s) are up"
puts "#{Relai.count} relai(s) are up"

puts "Creating Relais:"

Relai.create!(
  name: "Villa Augusta",
  address: "14 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  # longitude: "44.34531",
  # latitude: "4.766563"
  longitude: "4.7661659",
  latitude: "44.3451691"
  )

Relai.create!(
  name: "Maison Buffet gourmet",
  address: "29 Av. frédéric Mistral, Saint Paul 3 Châteaux",
  # longitude: "44.349240",
  # latitude: "4.774910"
  longitude: "4.774910",
  latitude: "44.349240"
  )

puts 'Relais done'
puts 'creating a Florist:'

florist1 = Florist.new(
  name: "Fleurs de Provence",
  address: "12 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  email: "sarl.vdb@wanadoo.fr",
  phone: "0475973030",
  description: "Magasin principale",
  # longitude: "44.34632",
  # latitude: "4.76651"
  longitude: "4.76651",
  latitude: "44.34632"
  )
florist1.save!

puts 'Florist done'
puts 'Creating Compositions:'

Composition.create!(
  sku: 'RdV',
  name: "Rose des vents",
  photo_title: "bouquet3.png",
  price_cents: 3000,
  quantity: 10,
  disponibility: true,
  florist: florist1
  )

Composition.create!(
  sku: 'ApT',
  name: 'Amour pour toujours',
  photo_title: "bouquet4.png",
  price_cents: 2500,
  quantity: 10,
  disponibility: true,
  florist: florist1
  )

Composition.create!(
  sku: 'IM',
  name: "Iris magique",
  photo_title: "bouquet5.png",
  price_cents: 3500,
  quantity: 10,
  disponibility: true,
  florist: florist1
  )

puts "Compositions done"
puts "Creating Sizes:"

sizeSmall = Size.create(
  name: "S"
)
sizeMedium = Size.create(
  name: "M"
)
sizeLarge = Size.create(
  name: "L"
)

puts 'Sizes done'

puts "#{Composition.count} compositions created"
puts "#{Size.count} sizes created"
puts "#{Florist.count} florist(s) created"
puts "#{Relai.count} relais created"

puts "Finished. Exit"
