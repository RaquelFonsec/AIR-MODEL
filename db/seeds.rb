
if Rails.env.development?
User.destroy_all
Flat.destroy_all
Booking.destroy_all
Comment.destroy_all
    user1 = User.create( first_name: 'João', email: 'joao@hotmail.com', password: '123456' )
    user2 = User.create(first_name: 'Maria', email: 'maria@hotmail.com', password: '123456')
   user3 = User.create(first_name: 'Pedro', email: 'pedro@hotmail.com', password: '123456')





    flat1 = Flat.create(title: 'Apartamento aconchegante', price: 100, user: user1)
    flat2 = Flat.create(title: 'Casa espaçosa', price: 200, user: user2)
    flat3 = Flat.create(title: 'Chalé nas montanhas', price: 150, user: user3)




      booking1 = Booking.create(start_date: Date.new(2023,03,10), end_date: Date.new(2023,03,15), total_price: 100, user: user1, flat: flat1)
  booking2 = Booking.create(start_date: Date.new(2023,03,20), end_date: Date.new(2023,03,25), total_price: 200, user: user2, flat: flat1)
  booking3 = Booking.create(start_date: Date.new(2023,03,15), end_date: Date.new(2023,03,20), total_price: 300, user: user3, flat: flat3)



  comment1 = Comment.create(user: user1, content: 'Excelente apartamento, recomendo!', flat: flat1)
comment2 = Comment.create(user: user2, content: 'Fiquei muito satisfeita com a hospedagem, voltarei com certeza.', flat: flat1)
comment3 = Comment.create(user: user3, content: 'Ótima localização, próximo de tudo que eu precisava.', flat: flat3)





    #description1 = Description.create(title: 'Apartamento aconchegante', content: 'Ótimo apartamento de 2 quartos',  city: 'Rio de Janeiro', flat: flat1)
    #description2 = Description.create(title: 'Casa espaçosa', content: 'Casa ampla de 3 quartos', city: 'São Paulo', flat: flat2)
    #description3 = Description.create(title: 'Chalé nas montanhas', content: 'Chalé rústico em meio à natureza', city: 'Gramado', flat: flat3)
end
