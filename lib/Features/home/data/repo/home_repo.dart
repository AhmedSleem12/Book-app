import 'package:bookely_app/core/utils/errors/faliures.dart';
import 'package:dartz/dartz.dart';

import '../data_model/book/book.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> fetchFuturedBooks();
  Future<Either<Faliure, List<BookModel>>> fetchBestSeller();
  Future<Either<Faliure, List<BookModel>>> fetchSmillerBooks(
      {required String category});
}
