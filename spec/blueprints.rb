require 'faker'

Sham.name         { Faker::Name.name }
Sham.description  { Faker::Lorem.paragraph }
Sham.tonnage      { (100..10000).to_a.rand  }
Sham.tech_level   { (8..15).to_a.rand }
Sham.jumpdrive    { (1..6).to_a.rand }
Sham.thrust       { (1..6).to_a.rand }
Sham.power        { (1..6).to_a.rand }


Ship.blueprint do
  name
  description
  tonnage
  tech_level
  created_at Date.today
  jumpdrive
  thrust  
  power  
  troops 100
  staterooms 10
end

