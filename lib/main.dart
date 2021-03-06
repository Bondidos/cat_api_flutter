import 'package:cat_api_tas4_flutter/bloc/cat_list_bloc/cat_list_cubit.dart';
import 'package:cat_api_tas4_flutter/pages/cat_details.dart';
import 'package:cat_api_tas4_flutter/pages/cat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<CatListCubit>(CatListCubit());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatListCubit>(
      create: (BuildContext context) => GetIt.I<CatListCubit>()..getCatList(),
      child: MaterialApp(
        title: 'Cat Api Flutter',
        routes: {
          'list':(context) => const CatList(),
          'details':(context) => const CatDetails(),
        },
        initialRoute: 'list',
        theme: ThemeData.dark(),
      ),
    );
  }
}
