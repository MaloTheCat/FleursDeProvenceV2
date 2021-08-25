Relai.destroy_all
Florist.destroy_all
Composition.destroy_all

puts "Creating the first Relais:"

relai1 = Relai.new(
  name: "Villa Augusta",
  address: "14 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  longitude: "44.34531",
  latitude: "4.766563",
)
relai1.save!

puts "name : #{relai1.name}, au #{relai1.address}"

puts 'creating a Master Florist:'

florist1 = Florist.new(
  name: "Fleurs de Provence",
  address: "12 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  email: "sarl.vdb@wanadoo.fr",
  phone: "0475973030",
  description: "Magasin principale",
  longitude: "44.34632",
  latitude: "4.76651",
)
florist1.save!

puts "name: #{florist1.name}, au #{florist1.address}"

puts 'Creating Compositions:'

composition1 = Composition.new(
  name: "Rose des vents",
  photo_title: "bouquet3",
  price: 30,
  quantity: 10,
  disponibility: true
  )

puts "#{composition1.quantity} '#{composition1.name}' is created at #{composition1.price} euros"

puts "Done."
