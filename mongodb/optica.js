//Suppliers
db.supplier.insertMany([{
  name: 'supp1',
  address: {
    street:'address', 
    number: 123, 
    floor: 2, 
    city: 'Barcelona',
    postcode: '08012',
    country: 'Spain',
    door: 3},
  phoneNumber: 123123123,
  fax: 123123123,
  nif: 123123123
},
{
  name: 'supp2',
  address: {
    street:'address', 
    number: 123, 
    floor: 2, 
    city: 'Madrid',
    postcode: '08030',
    country: 'Spain',
    door: 3},
  phoneNumber: 123123123,
  fax: 123123123,
  nif: 123123123
},
{
  name: 'supp3',
  address: {
    street:'address', 
    number: 123, 
    floor: 2, 
    city: 'Barcelona',
    postcode: '08012',
    country: 'Spain',
    door: 3},
  phoneNumber: 123123123,
  fax: 123123123,
  nif: 123123123
}])

//Clients
db.client.insertMany([{
  name: 'client1',
  postcode: '08012',
  telephone: '111222333',
  email: 'client@mail.com',
  registrationDate: new Date('Jun 23, 2020'),
  recommendedBy: 'client2', 
  glassesPurchased: [
    {
      brand: 'brand',
      grad_rigth: 1.25,
      grad_left: 1.25,
      frame: 'pasta',
      frame_color: 'red',
      glass_color: 'blue',
      price: 89.80,
      supplier: 'supp1',
      salesPerson: 'employee1'
    },
    {
      brand: 'brand1',
      grad_rigth: 2.25,
      grad_left: 1.25,
      frame: 'flotant',
      frame_color: 'yellow',
      glass_color: 'blue',
      price: 80,
      supplier: 'supp2',
      salesPerson:'employee2'
    }
  ]
},
{
  name: 'client2',
  postcode: '08012',
  telephone: '111222333',
  email: 'client@mail.com',
  registrationDate: new Date('Jun 23, 2021'),
  recommendedBy: 'client1',
  glassesPurchased: [
    {
      brand: 'brand2',
      grad_rigth: 0.25,
      grad_left: 0.50,
      frame: 'metal',
      frame_color: 'black',
      glass_color: 'brown',
      price: 180,
      supplier: 'supp3',
      salesPerson: 'employee1'
    }
  ]
},
{
  name: 'client3',
  postcode: '08012',
  telephone: '111222333',
  email: 'client@mail.com',
  registrationDate: new Date('Oct 23, 2020'),
  glassesPurchased: [
    {
      brand: 'brand2',
      grad_rigth: 0.25,
      grad_left: 0.50,
      frame: 'metal',
      frame_color: 'black',
      glass_color: 'brown',
      price: 180,
      supplier: 'supp3',
      salesPerson: 'employee3'
    }, 
    {
      brand: 'brand1',
      grad_rigth: 2.25,
      grad_left: 1.25,
      frame: 'flotant',
      frame_color: 'yellow',
      glass_color: 'blue',
      price: 80,
      supplier: 'supp2',
      salesPerson: 'employee1'
    }
  ]
}])


