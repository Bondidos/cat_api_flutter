import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cat_list_bloc/cat_list_cubit.dart';
import '../widgets/cat_list_widget.dart';

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
