import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cat_list_bloc/cat_list_cubit.dart';
import '../bloc/models/cat_model.dart';
import '../remote_service/network_helper.dart';

class CatList extends StatelessWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatListCubit, ListState>(
      builder: (context, state) {
        if (state is ListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ListLoaded) {
          return CatListWidget(data: state.list);
        }
        if (state is LoadingError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}

class CatListWidget extends StatelessWidget {
  final List<Cat> data;
  const CatListWidget({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cute cats"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 6
            ),
            itemCount: data.length,
            itemBuilder: (
              context,
              int index,
            ) {
              return Image.network(
                data[index].url,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
