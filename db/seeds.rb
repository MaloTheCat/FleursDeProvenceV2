Florist.destroy_all
Relai.destroy_all

puts "#{Florist.count} florist(s) are up"
puts "#{Relai.count} relai(s) are up"

puts "Creating Relais:"

Relai.create!(
  name: "Villa Augusta",
  address: "14 Rue du Serre Blanc, Saint Paul 3 Châteaux",
  longitude: "4.7661659",
  latitude: "44.3451691"
  )

Relai.create!(
  name: "Maison Buffet gourmet",
  address: "29 Av. frédéric Mistral, Saint Paul 3 Châteaux",
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
  longitude: "4.76651",
  latitude: "44.34632"
  )
florist1.save!

puts 'Florist done'

puts "#{Florist.count} florist(s) created"
puts "#{Relai.count} relais created"

puts "Finished. Exit"
