Composition.destroy_all
Relai.destroy_all
Florist.destroy_all

puts "#{Relai.count} relai(s) are up"
puts "#{Florist.count} florist(s) are up"
puts "#{Composition.count} composition(s) are up"

puts "Creating the first Relai:"

relai1 = Relai.new(
  name: "Villa Augusta",
  address: "14 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  longitude: "44.34531",
  latitude: "4.766563"
)
relai1.save!

puts "name : #{relai1.name}, au #{relai1.address}"
puts "Creating the second Relai:"

relai2 = Relai.new(
  name: "Maison Buffet gourmet",
  address: "29 Av. frédéric Mistral, Saint Paul 3 Châteaux",
  longitude: "44.349240",
  latitude: "4.774910"
)
relai2.save!

puts "name : #{relai2.name}, au #{relai2.address}"

puts 'creating a Master Florist:'

florist1 = Florist.new(
  name: "Fleurs de Provence",
  address: "12 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  email: "sarl.vdb@wanadoo.fr",
  phone: "0475973030",
  description: "Magasin principale",
  longitude: "44.34632",
  latitude: "4.76651"
)
florist1.save!

puts "name: #{florist1.name}, au #{florist1.address}"

puts 'Creating Compositions:'

compo1 = Composition.new(
  name: "Rose des vents",
  photo_title: "bouquet3.png",
  base_price: 30,
  quantity: 10,
  disponibility: true,
  florist: florist1
  # size: "S"
  )
compo1.save!

puts "creating #{compo1.name} at #{compo1.base_price}€"

compo2 = Composition.new(
  name: "Amour pour toujours",
  photo_title: "bouquet4.png",
  base_price: 25,
  quantity: 10,
  disponibility: true,
  florist: florist1
  # size: "S"
  )
compo2.save!

puts "creating #{compo2.name} at #{compo2.base_price}€"

compo3 = Composition.new(
  name: "Iris magique",
  photo_title: "bouquet5.png",
  base_price: 35,
  quantity: 10,
  disponibility: true,
  florist: florist1
  # size: "S"
  )
compo3.save!

puts "Creating Sizes"

sizeSmall = Size.create(
  name: "S"
)
sizeMedium = Size.create(
  name: "M"
)
sizeLarge = Size.create(
  name: "L"
)

puts 'Sizes created'

puts "#{Composition.count} compositions created & #{Composition.count} compositions are up"
puts "#{Size.count} sizes created & #{Size.count} Sizes are up"
puts "#{Florist.count} florist(s) created & #{Florist.count} florist(s) are up"
puts "#{Relai.count} relais created & #{Relai.count} relais are up"

puts "Done."
