import 'package:pediprojflutter/domain/models/location_model.dart';
import 'package:pediprojflutter/domain/models/product_model.dart';
import 'package:pediprojflutter/domain/models/shop_model.dart';

List<ProductModel> products = [
  ProductModel(
      id: 1,
      imageUrl:
          "https://betos.com.ar/wp-content/uploads/2019/08/Pizza-Betos-3.png",
      name: "Pizza",
      price: 15.0,
      description: "Irure officia Lorem occaecat.",
      category: "Pizza"),
  ProductModel(
      id: 2,
      imageUrl:
          "https://i.pinimg.com/originals/d9/43/0c/d9430c5a965ca05f2581d104e0e257b3.png",
      name: "Fried Chicken",
      price: 12.0,
      description: "Irure officia Lorem occaecat.",
      category: "Meals"),
  ProductModel(
      id: 3,
      imageUrl:
          "https://www.diageobaracademy.com/uploads/photos/d41d8cd98f00b204e9800998ecf8427e1165418029f13d1ba139341726204b123898248c3aa80dbb09fdac3a14ff1286_thumbnail.png",
      name: "Beer",
      price: 4.0,
      description: "Irure officia Lorem occaecat.",
      category: "Drinks"),
  ProductModel(
    id: 4,
    imageUrl:
        "https://image.freepik.com/free-photo/sticks-french-fries-beer-salt-white-plate_113913-332.jpg",
    name: "French fries and beer",
    price: 8.50,
    description: "Irure officia Lorem occaecat.",
    category: "Meals",
  ),
];

//http://thebarbeer.co/wp-content/uploads/2018/04/Exp_01.jpg
List<ShopModel> shopsList = [
  ShopModel(
    id: 1,
    description: 'Cillum nisi laborum ipsum do amet id excepteur culpa.',
    imageUrl:
        'https://media-cdn.tripadvisor.com/media/photo-s/06/33/e8/0f/vidon-bar.jpg',
    location: Location(latitude: '', longitude: ''),
    name: 'Vidon bar',
  ),
  ShopModel(
    id: 2,
    description: 'Cillum nisi laborum ipsum do amet id excepteur culpa.',
    imageUrl: 'http://thebarbeer.co/wp-content/uploads/2018/04/Exp_01.jpg',
    location: Location(latitude: '', longitude: ''),
    name: 'BarBeer',
  ),
  ShopModel(
    id: 3,
    description: 'Cillum nisi laborum ipsum do amet id excepteur culpa.',
    imageUrl:
        'https://media-cdn.tripadvisor.com/media/photo-s/13/37/5e/6b/photo2jpg.jpg',
    location: Location(latitude: '', longitude: ''),
    name: 'Patagonia',
  ),
];
