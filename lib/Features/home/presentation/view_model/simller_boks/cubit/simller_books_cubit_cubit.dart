import 'package:bloc/bloc.dart';
import 'package:bookely_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/data_model/book/book.dart';

part 'simller_books_cubit_state.dart';

class SimllerBooksCubitCubit extends Cubit<SimllerBooksCubitState> {
  final HomeRepo homeRepo;
  SimllerBooksCubitCubit(this.homeRepo) : super(SimllerBooksCubitInitial());

  Future<void> fetchSimllerBooks({required String category}) async {
    emit(SimllerBooksCubitLoadingState());
    final result = await homeRepo.fetchSmillerBooks(category: category);

    result.fold((faliure) {
      emit(SimllerBooksCubitFaliure(faliure.msgError));
    }, (data) {
      emit(SimllerBooksCubitSuccessState(data));
    });
  }
}
