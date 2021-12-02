db.restaurant.find({})
db.restaurant.find( {}, {restaurant_id:1,name:1, borough:1, cuisine:1} )
db.restaurant.find( {}, {_id:0, restaurant_id:1, name:1, borough:1, cuisine:1} )
db.restaurant.find( {}, {restaurant_id:1, name:1, borough:1, 'address.zipcode':1} )
db.restaurant.find( {borough:"Bronx"} )
db.restaurant.find( {borough:"Bronx"} ).limit(5)
db.restaurant.find( {borough:"Bronx"} ).skip(5).limit(5)
db.restaurant.find( {'grades.score': {$gt:90}} )
db.restaurant.find( {'grades.score': {$gt:80,$lt:100}} )
db.restaurant.find( {'address.coord.0': {$lt: -95.754168}} ) 
db.restaurant.find({cuisine: {$ne: 'American '}, 'grades.score': {$gt:70}, 'address.coord.0': {$lt:-65.754168}})
db.restaurant.find({cuisine: {$ne: 'American '}, 'grades.grade': 'A', borough: {$ne: 'Brooklyn'}} ).sort( { cuisine: -1 })
db.restaurant.find({name: {$regex: 'Wil'}}, {restaurant_id:1,name:1, borough:1, cuisine:1})
db.restaurant.find({name: {$regex: 'ces$'}}, {restaurant_id:1,name:1, borough:1, cuisine:1})//chequear
db.restaurant.find({name: {$regex: 'Reg', $options:'$i'}}, {restaurant_id:1,name:1, borough:1, cuisine:1})//chequear
db.restaurant.find({$and: [{borough:'Bronx'}, {$or: [{cuisine: 'American '}, {cuisine: 'Chinese'}]}]}, {restaurant_id:1,name:1, borough:1, cuisine:1})
db.restaurant.find({$or: [{borough:'Staten Island'}, {borough: 'Queens'}, {borough: 'Bonx'}]}, {restaurant_id:1,name:1, borough:1, cuisine:1})
db.restaurant.find({borough: {$nin: ['Staten Island', 'Queens', 'Bronx', 'Brooklyn']}}, {restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurant.find({'grades.score': {$not: {$gt: 10}}}, {restaurant_id:1, name:1, borough:1, cuisine:1})
db.restaurant.find({$or:[{$and:[{cuisine:'Seafood'}, {cuisine: {$nin: ['American ','Chinese']}}]}, {name:{$regex:'^Will'}}]}, {restaurant_id:1, name:1, borough:1, cuisine:1}) //no funciona filtro de 'Will'
db.restaurant.find({$and:[{'grades.grade':'A'}, {'grades.score': 11}, {'grades.date': ISODate ('2014-08-11T00:00:00Z')}]}, {restaurant_id:1, name:1, grades:1})
db.restaurant.find({$and: [{'grades.grade':'A'}, {'grades.score': 9}, {'grades.date': ISODate('2014-08-11T00:00:00Z')}]}, {restaurant_id:1, name:1, grades:1})
db.restaurant.find({'address.coord.1': {$gt:42,$lt:52}}, {restaurant_id:1, name:1, address:1})
db.restaurant.find({}).sort({name:1})
db.restaurant.find({}).sort({name:-1})
db.restaurant.aggregate([{$group:{ _id:{borough:"$borough"},cuisine: {$addToSet:'$cuisine'}}}]).sort({name:1, borough:-1})
db.restaurant.find({ 'address.street': { $exists: false } })
db.restaurant.find( { address: {$elemMatch:{ coord : { $type : "double" }}} } )
db.restaurant.find({ 'grades.score': { $mod: [ 7, 0 ] } }, {restaurant_id:1, name:1, 'grades.grade':1})
db.restaurant.find({name: {$regex : 'mon', $options:'i'}}, {name: 1, borough:1, 'address.coord': 1, cuisine:1})
db.restaurant.find({name: {$regex: '^Mad'}}, {name:1, borough:1, 'address.coord':1, cuisine:1})
