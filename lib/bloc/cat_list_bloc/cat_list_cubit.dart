import 'package:cat_api_tas4_flutter/remote_service/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../models/cat_model.dart';
import '../../utils/util_methods.dart';

part '../cat_list_bloc/cat_list_state.dart';

class CatListCubit extends Cubit<ListState> {
  CatListCubit() : super(const ListInitial());

  List<Cat> catList = [];
  int page = 1;

  void test() => print("page number is: $page");
  Future<void> nextPage() async {
    page++;
    Uri uri = createUri(page);
    CatApiService catApiService = CatApiService(uri: uri);
    var buffer = createCatListFromJson(await catApiService.getCatListResponse());
    catList.addAll(buffer);
    emit(ListLoaded(list: catList));
  }

  Future<void> getCatList() async {
    emit(const ListLoading());

    Uri uri = createUri(page);

    CatApiService catApiService = CatApiService(uri: uri);
    catList =
        createCatListFromJson(await catApiService.getCatListResponse());

    catList.isNotEmpty
        ? emit(ListLoaded(list: catList))
        : emit(const LoadingError(message: "Network problems"));
  }
}

