part of '../cat_list_bloc/cat_list_cubit.dart';

@immutable
abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {
  const ListInitial();
}

class ListLoading extends ListState {
  const ListLoading();
}

class ListLoaded extends ListState {
  final List<Cat> list;

  const ListLoaded({required this.list});

  @override
  List<Object> get props => [list];
}

class LoadingError extends ListState {
  final String message;

  const LoadingError({required this.message});

  @override
  List<Object> get props => [message];
}
