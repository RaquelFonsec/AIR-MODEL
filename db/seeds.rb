

User.create([
  { name: 'João', email: 'joao@hotmail.com', password: '123456' },
  { name: 'Maria', email: 'maria@hotmail.com', password: '123456' },
  { name: 'Pedro', email: 'pedro@hotmail.com', password: '123456' },
])


Flat.create([
  { title: 'Apartamento aconchegante', summary: 'Ótimo apartamento de 2 quartos', price_per_night: 100, user_id: 1 },
  { title: 'Casa espaçosa', summary: 'Casa ampla de 3 quartos', price_per_night: 200, user_id: 2 },
  { title: 'Chalé nas montanhas', summary: 'Chalé rústico em meio à natureza', price_per_night: 150, user_id: 3 },
])


Reservation.create([
  { checkin_date: '2023-03-10', checkout_date: '2023-03-15', guest_number: 2, user_id: 1, flat_id: 2 },
  { checkin_date: '2023-03-20', checkout_date: '2023-03-25', guest_number: 4, user_id: 2, flat_id: 1 },
  { checkin_date: '2023-03-15', checkout_date: '2023-03-20', guest_number: 2, user_id: 3, flat_id: 3 },
])


Comment.create([
  { user_name: 'João', comment_text: 'Excelente apartamento, recomendo!', flat_id: 2 },
  { user_name: 'Maria', comment_text: 'Fiquei muito satisfeita com a hospedagem, voltarei com certeza.', flat_id: 1 },
  { user_name: 'Pedro', comment_text: 'Ótima localização, próximo de tudo que eu precisava.', flat_id: 3 },
])


Description.create([
  { title: 'Apartamento aconchegante', summary: 'Ótimo apartamento de 2 quartos', property_type: 'Apartamento', room_number: 2, guest_number: 4, city: 'Rio de Janeiro', state: 'RJ', country: 'Brasil', flat_id: 1 },
  { title: 'Casa espaçosa', summary: 'Casa ampla de 3 quartos', property_type: 'Casa', room_number: 3, guest_number: 6, city: 'São Paulo', state: 'SP', country: 'Brasil', flat_id: 2 },
  { title: 'Chalé nas montanhas', summary: 'Chalé rústico em meio à natureza', property_type: 'Chalé', room_number: 1, guest_number: 2, city: 'Gramado', state: 'RS', country: 'Brasil', flat_id: 3 }
])
