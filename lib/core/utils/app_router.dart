import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:bookely_app/Features/home/presentation/view_model/simller_boks/cubit/simller_books_cubit_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/home_screen.dart';
import 'package:bookely_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/SplashView/presentation/views/splash_view.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/search/search_view.dart';

abstract class AppRouter {
  static const homeView = "/homeView";
  static const detailsBookView = "/detailsBookView";
  static const searchView = "/searchView";
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, _) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: detailsBookView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimllerBooksCubitCubit(getIt.get<HomeRepoImpl>()),
          child: BooksDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      )
    ],
  );
}
