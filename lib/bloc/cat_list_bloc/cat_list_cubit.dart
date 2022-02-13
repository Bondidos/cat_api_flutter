import 'package:cat_api_tas4_flutter/bloc/models/cat_model.dart';
import 'package:cat_api_tas4_flutter/remote_service/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../remote_service/network_constants.dart';

part '../cat_list_bloc/cat_list_state.dart';

class CatListCubit extends Cubit<ListState> {
  CatListCubit() : super(const ListInitial());
/***streams*/




  Future<void> getCatList(int page) async {
    emit(const ListLoading());

    var uri = Uri.https(
      baseUrl,
      path,
      <String, String>{
        'limit': '$limit',
        'page': '$page',
        'order': order,
      },
    );

    CatApiService catApiService = CatApiService(uri: uri);
    List<Cat> catList = _createCatList(await catApiService.getCatListResponse());

    catList.isNotEmpty
        ? emit(ListLoaded(list: catList))
        : emit(const LoadingError(message: "Network problems"));
  }

  List<Cat> _createCatList(List<dynamic> list) {
    List<Cat> catList = [];
    for (var element in list) {
      catList.add(Cat.fromJson(element));
    }
    return catList;
  }
}
