import '../models/collection_model.dart';

List<CollectionModel> indexToData(List<CollectionModel> fullData, int index) {
  switch (index) {
    case 0:
      // all
      return fullData;
    case 1:
      // trending
      return fullData.where((element) => element.categories.contains("Trending")).toList();
    case 2:
      // new
      return fullData.where((element) => element.categories.contains("New")).toList();

    case 3:
      // female
      return fullData.where((element) => element.categories.contains("Female")).toList();

    case 4:
      // male
      return fullData.where((element) => element.categories.contains("Man")).toList();

    default:
      return fullData;
  }
}
