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

class CatListState extends State<CatListWidget> {
  final List<Cat> data;

  CatListState(this.data);

  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller?.addListener(
      () async {
        if (_controller!.offset == _controller?.position.maxScrollExtent) {
          await BlocProvider.of<CatListCubit>(this.context).nextPage();
          setState(() {});
        }
        // print("${_controller?.offset}");
        // _controller?.position.maxScrollExtent  253.90909090909088
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
    CatListCubit catCubit = BlocProvider.of<CatListCubit>(context);
    bool isNextPageTriggered = false;

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
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
