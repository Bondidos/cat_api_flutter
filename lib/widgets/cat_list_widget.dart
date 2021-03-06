import 'package:cat_api_tas4_flutter/bloc/cat_list_bloc/cat_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/cat_model.dart';

class CatListWidget extends StatefulWidget {
  final List<Cat> data;

  const CatListWidget({Key? key, required this.data}) : super(key: key);

  @override
  State createState() => CatListState(data);
}

class CatListState extends State<CatListWidget> {
  final List<Cat> data;
  final CatListCubit cubit;
  CatListState(this.data): cubit = GetIt.I<CatListCubit>();

  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(
      () async {
        if (_controller!.offset == _controller?.position.maxScrollExtent) {
          await cubit.nextPage();
          setState(() {});
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cute cats"),
      ),
      body: SafeArea(
        child: GridView.builder(
          controller: _controller,
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
              child: Image.network(
                data[index].url,
                loadingBuilder: (context,child,progress){
                  return progress == null
                      ? child
                      : CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: Theme.of(context).backgroundColor,
                    color: Theme.of(context).primaryColor,
                  );
                },
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
