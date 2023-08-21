import 'collection_detail_model.dart';

class CollectionModel {
  final String name, price, description, imagePath;
  final List<String> categories;
  bool isBookmarked;
  final List<CollectionDetailsModel> collectionProducts;
  CollectionModel({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.collectionProducts,
    required this.categories,
    this.isBookmarked = false,
  });
}
