part of 'featured_list_view_cubit.dart';

abstract class FeaturedListViewState extends Equatable {
  const FeaturedListViewState();

  @override
  List<Object> get props => [];
}

class FeaturedListViewInitial extends FeaturedListViewState {}

class FeaturedListViewLoadingState extends FeaturedListViewState {}

class FeaturedListViewSuccessState extends FeaturedListViewState {
  final List<BookModel> books;

  const FeaturedListViewSuccessState(this.books);
}

class FeaturedListViewFaliedState extends FeaturedListViewState {
  final String msg;

  const FeaturedListViewFaliedState(this.msg);
}
