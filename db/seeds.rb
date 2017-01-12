# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dish.create(name: 'Pan con Ajo', allergens: 'Gluten', description: 'Pan con ajos', image: 'plato1.png', category: 'Entrantes', price: 2.5, active: 1)
Dish.create(name: 'Papas Arrgugadas', allergens: 'Apio', description: 'Papas arrugadas con mojo picon', image: 'plato2.png', category: 'Entrante', price: 3.0, active: 1)
Dish.create(name: 'Gambas al Ajillo', allergens: 'Marisco', description: 'Gambas al Ajillo', image: 'plato3.png', category: 'Entrante', price: 4.5, active: 1)
Dish.create(name: 'Sopa de Pollo', allergens: 'Gluten,Apio', description: 'Sopa casera', image: 'plato1.png', category: 'Primeros', price: 5, active: 1)
Dish.create(name: 'Sopa de Marisco', allergens: 'Gluten,Apio', description: 'Sopa casera', image: 'plato2.png', category: 'Primeros', price: 5.5, active: 1)
Dish.create(name: 'Sopa Jardinera', allergens: 'Gluten,Apio', description: 'Sopa casera', image: 'plato3.png', category: 'Primeros', price: 5, active: 1)
Dish.create(name: 'Pollo a la Plancha', allergens: '', description: 'Pollo a la plancha con salsa de curry', image: 'plato1.png', category: 'Segundos', price: 6, active: 1)
Dish.create(name: 'Vueltas a la Casera', allergens: '', description: 'Vueltas a la casera', image: 'plato2.png', category: 'Segundos', price: 6.5, active: 1)
Dish.create(name: 'Chuletas de Cordero', allergens: '', description: 'Chuletas de Cordero a la brasa', image: 'plato3.png', category: 'Segundos', price: 7, active: 1)
Dish.create(name: 'Helado de Vainilla', allergens: 'Leche,Huevo', description: 'Helado casero', image: 'plato1.png', category: 'Postres', price: 2.5, active: 1)
Dish.create(name: 'Helado de Fresa', allergens: 'Leche,Huevo', description: 'Helado casero', image: 'plato2.png', category: 'Postres', price: 2.5, active: 1)
Dish.create(name: 'Helado de Chocolate', allergens: 'Leche,Huevo', description: 'Helado casero', image: 'plato3.png', category: 'Postres', price: 2.5, active: 1)

Restaurant.create(name: 'COC-Maspalomas', location: '', description: '', phone: '', address: '', provincia: 'Las Palmas', localidad: 'Maspalomas')
Restaurant.create(name: 'COC-San Mateo', location: '', description: '', phone: '', address: '', provincia: 'Las Palmas', localidad: 'San Mateo')
Restaurant.create(name: 'COC-La Laguna', location: '', description: '', phone: '', address: '', provincia: 'Santa Cruz de Tenerife', localidad: 'La Laguna')
