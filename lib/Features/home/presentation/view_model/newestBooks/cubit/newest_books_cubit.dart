import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final HomeRepo homeRepo;
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchBestSeller();

    result.fold((faliure) {
      emit(NewestBooksFaliureState(faliure.msgError));
    }, (done) {
      emit(NewestBooksSuccessState(done));
    });
  }
}
