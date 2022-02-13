import 'package:http/http.dart' as http;
import 'dart:convert';

class CatApiService {
  final Uri uri;

  CatApiService({required this.uri});

  Future<List<dynamic>> getCatListResponse() async {
    List<dynamic> catList = [];

    http.Response response = await http.get(uri);
    (response.statusCode == 200) ? catList = json.decode(response.body) : null;
    return catList;
  }
}
