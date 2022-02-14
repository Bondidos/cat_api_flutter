import 'package:cat_api_tas4_flutter/bloc/cat_list_bloc/cat_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cat_model.dart';

class CatListWidget extends StatefulWidget {
  final List<Cat> data;
  const CatListWidget({Key? key, required this.data}) : super(key: key);

  @override
  State createState() => CatListState(data);
}

class CatListState extends State<CatListWidget>{
  final List<Cat> data;
  CatListState(this.data);

  @override
  Widget build(BuildContext context) {
    var catCubit = BlocProvider.of<CatListCubit>(context);
    catCubit.test();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cute cats"),
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification){
            print('${scrollNotification.depth}');

            // print("index is; $index, catLength is: ${data.length}");
           /* if(scrollNotification.metrics.atEdge) {
              setState(() {
                catCubit.nextPage();
              });

            }*/
            return false;
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(6.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.0, crossAxisSpacing: 6),
            itemCount: data.length,
            itemBuilder: (
              context,
              int index,
            ) {

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: GestureDetector(
                  onTap: (){
                    print("tap on the $index element");
                  },
                  child: Image.network(
                    data[index].url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


}
