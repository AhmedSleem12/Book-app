part of 'simller_books_cubit_cubit.dart';

abstract class SimllerBooksCubitState extends Equatable {
  const SimllerBooksCubitState();

  @override
  List<Object> get props => [];
}

class SimllerBooksCubitInitial extends SimllerBooksCubitState {}

class SimllerBooksCubitLoadingState extends SimllerBooksCubitState {}

class SimllerBooksCubitSuccessState extends SimllerBooksCubitState {
  final List<BookModel> books;

  const SimllerBooksCubitSuccessState(this.books);
}

class SimllerBooksCubitFaliure extends SimllerBooksCubitState {
  final String errorMesage;

  const SimllerBooksCubitFaliure(this.errorMesage);
}
