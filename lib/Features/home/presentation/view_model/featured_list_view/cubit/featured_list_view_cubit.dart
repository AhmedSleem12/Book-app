import 'package:bloc/bloc.dart';
import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'featured_list_view_state.dart';

class FeaturedListViewCubit extends Cubit<FeaturedListViewState> {
  final HomeRepo homeRepo;
  FeaturedListViewCubit(this.homeRepo) : super(FeaturedListViewInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedListViewLoadingState());
    var result = await homeRepo.fetchFuturedBooks();
    result.fold((faliure) {
      emit(FeaturedListViewFaliedState(faliure.msgError));
    }, (done) {
      emit(FeaturedListViewSuccessState(done));
    });
  }
}
