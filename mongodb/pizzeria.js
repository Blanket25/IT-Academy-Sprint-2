//Orders
db.orders.insertMany([
  {
    client:
    {
        name: 'Rachel',
        surname: 'Green',
        address: 'somewhere 123',
        postcode: '08012',
        localidad: 'loc1',
        provincia: 'prov1',
        phoneNumber: 123456789
    },
    dateAndTime: new Date('2021-08-25 18:38:45'),
    type: 'take away',
    products: [
      {
        name: 'pizza',
        category: 'cat1',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 10.50
      },
      {
        name: 'drink',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 3
      }
    ],
    totalPrice: 13.50,
    shop: 
    {
      id: 1,
      address: 'somewhere 123',
      postcode: '08012',
      localitat: 'loc1',
      provincia: 'prov1'
    }
  },
  {
    client:  
    {
        name: 'Monica',
        surname: 'Geller',
        address: 'somewhere 123',
        postcode: '08012',
        localidad: 'loc2',
        provincia: 'prov1',
        phoneNumber: 123456789
    },
    dateAndTime: new Date('2021-08-25 18:38:45'),
    type: 'take away',
    products: [
      {
        name: 'burger',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 6.50
      },
      {
        name: 'drink',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 2.50
      }
    ],
    totalPrice: 9,
    shop: {
      id: 1,
      address: 'somewhere 123',
      postcode: '08012',
      localitat: 'loc1',
      provincia: 'prov1'
    }
  },
  {
    client:  
    {
        name: 'Chandler',
        surname: 'Bing',
        address: 'somewhere 123',
        postcode: '08012',
        localidad: 'loc1',
        provincia: 'prov2',
        phoneNumber: 123456789
    },
    dateAndTime: new Date('2021-08-25 18:38:45'),
    type: 'take away',
    products: [
      {
        name: 'burger1',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 6.50
      },
      {
        name: 'burger2',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 8.50
      },
      {
        name: 'drink',
        description: 'Lorem ipsum dolor sit amet',
        img: 'img.com',
        price: 2.50
      }
    ],
    totalPrice: 17.50,
    shop: 
    {
      id: 1,
      address: 'somewhere 123',
      postcode: '08012',
      localitat: 'loc1',
      provincia: 'prov1'
    }
  }
])

