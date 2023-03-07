
require "open-uri"
Comment.destroy_all
Booking.destroy_all
Flat.destroy_all
User.destroy_all


user1 = User.create!( first_name: 'João', email: 'joao@hotmail.com', password: '123456' )
user2 = User.create!(first_name: 'Maria', email: 'maria@hotmail.com', password: '123456')
user3 = User.create!(first_name: 'Pedro', email: 'pedro@hotmail.com', password: '123456')



flat1 = Flat.new(title: 'Apartamento aconchegante', price: 100, user: user1, category: Flat::CATEGORIES.sample.capitalize)
file = URI.open('https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147028/switzerland-gd7c33abfa_1920_pdyyuh.jpg')
flat1.photos.attach(io: file, filename: "flat.png", content_type: "image/png")
flat1.save!

flat2 = Flat.new(title: 'Casa espaçosa', price: 200, user: user2,category: Flat::CATEGORIES.sample.capitalize)
file = URI.open('https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147019/veranda-g7081c6da3_1920_gfq3rq.jpg')
flat2.photos.attach(io: file, filename: "flat.png", content_type: "image/png")
flat2.save!



flat3 = Flat.new(title: 'Chalé nas montanhas', price: 150, user: user3, category: Flat::CATEGORIES.sample.capitalize)
file = URI.open('https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147012/window-gf2ddb3221_1920_hjerfj.jpg')
flat3.photos.attach(io: file, filename: "flat.png", content_type: "image/png")
flat3.save!


booking1 = Booking.create!(start_date: Date.new(2023,03,10), end_date: Date.new(2023,03,15), total_price: 100, user: user1, flat: flat1)
booking2 = Booking.create!(start_date: Date.new(2023,03,20), end_date: Date.new(2023,03,25), total_price: 200, user: user2, flat: flat1)
#booking3 = Booking.create(start_date: Date.new(2023,03,15), end_date: Date.new(2023,03,20), total_price: 300, user: user3, flat: flat3)

comment1 = Comment.create!(user: user1, content: 'Excelente apartamento, recomendo!', flat: flat1)
comment2 = Comment.create!(user: user2, content: 'Fiquei muito satisfeita com a hospedagem, voltarei com certeza.', flat: flat1)
#comment3 = Comment.create(user: user3, content: 'Ótima localização, próximo de tudo que eu precisava.', flat: flat3)






  image_urls = ['https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147028/switzerland-gd7c33abfa_1920_pdyyuh.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147019/veranda-g7081c6da3_1920_gfq3rq.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678147012/window-gf2ddb3221_1920_hjerfj.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146981/pexels-vecislavas-popa-1571468_1_urdpq7.jpg1',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146958/love-god-g2011eada9_1920_qysdnl.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146948/indoor-g2eba2f296_1920_enbg4k.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146917/house-g0b15a0f13_1920_crllry.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146889/holiday-complex-gdb1596a47_1920_obkkyc.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146853/beach-house-gd7796f709_1920_p7ufto.jpg',
 'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146863/dining-room-gced1d8515_1280_lhyjn8.jpg',
  'https://res.cloudinary.com/dbtr2yaho/image/upload/v1678146842/architecture-ga96680134_1920_qpouv7.jpg'
 ]









#description1 = Description.create(title: 'Apartamento aconchegante', content: 'Ótimo apartamento de 2 quartos',  city: 'Rio de Janeiro', flat: flat1)
#description2 = Description.create(title: 'Casa espaçosa', content: 'Casa ampla de 3 quartos', city: 'São Paulo', flat: flat2)
#description3 = Description.create(title: 'Chalé nas montanhas', content: 'Chalé rústico em meio à natureza', city: 'Gramado', flat: flat3)
