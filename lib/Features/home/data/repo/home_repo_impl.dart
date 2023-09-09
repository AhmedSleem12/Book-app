import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/data/repo/home_repo.dart';
import 'package:bookely_app/core/utils/api_service.dart';
import 'package:bookely_app/core/utils/errors/faliures.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Faliure, List<BookModel>>> fetchBestSeller() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=subject:programming&Sorting=newest&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchFuturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchSmillerBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=category:$category&Sorting=relevance&Filtering=free-ebooks");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
