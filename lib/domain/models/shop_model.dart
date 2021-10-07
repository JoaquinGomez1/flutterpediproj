import 'package:pediprojflutter/domain/models/location_model.dart';

class ShopModel {
  final int id;
  final String name;
  final Location location;
  final String imageUrl;
  final String description;

  ShopModel({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
  });
}
