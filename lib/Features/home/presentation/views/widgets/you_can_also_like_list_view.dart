import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/widgets/error_widget.dart';
import '../../view_model/simller_boks/cubit/simller_books_cubit_cubit.dart';

class SimllerYouCanLikeAlsoListView extends StatelessWidget {
  const SimllerYouCanLikeAlsoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimllerBooksCubitCubit, SimllerBooksCubitState>(
      builder: (context, state) {
        if (state is SimllerBooksCubitSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(
                        AppRouter.detailsBookView,
                        extra: state.books[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                      radius: 7,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimllerBooksCubitFaliure) {
          return CustomErrorWidget(errorMessage: state.errorMesage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
