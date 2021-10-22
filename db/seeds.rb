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
  photo_title: "bouquet3",
  price: 30,
  quantity: 10,
  disponibility: true,
  florist: florist1,
  size: ""
  )
compo1.save!

puts "#{compo1.quantity} '#{compo1.name}' is created at #{compo1.price} euros"

compo2 = Composition.new(
  name: "Amour pour toujours",
  photo_title: "bouquet4",
  price: 25,
  quantity: 10,
  disponibility: true,
  florist: florist1,
  size: ""
  )
compo2.save!

puts "#{compo2.quantity} '#{compo2.name}' is created at #{compo2.price} euros"

puts "#{Composition.count} composition(s) created"

puts "#{Relai.count} relai(s) are up"
puts "#{Florist.count} florist(s) are up"
puts "#{Composition.count} composition(s) are up"

puts "Done."
