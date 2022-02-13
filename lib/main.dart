import 'package:cat_api_tas4_flutter/pages/cat_details.dart';
import 'package:cat_api_tas4_flutter/pages/cat_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Api Flutter',
      routes: {
        'list':(context) => const CatList(),
        'details':(context) => const CatDetails(),
      },
      initialRoute: 'list',
      theme: ThemeData.dark(),
    );
  }
}
