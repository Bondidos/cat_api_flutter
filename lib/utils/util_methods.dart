import '../models/cat_model.dart';
import '../remote_service/network_constants.dart';

Uri createUri(int page) {
  return Uri.https(
    baseUrl,
    path,
    <String, String>{
      'limit': '$limit',
      'page': '$page',
      'order': order,
    },
  );
}

List<Cat> createCatListFromJson(List<dynamic> list) {
  List<Cat> catList = [];
  for (var element in list) {
    catList.add(Cat.fromJson(element));
  }
  return catList;
}