import 'package:bookely_app/Features/home/presentation/view_model/featured_list_view/cubit/featured_list_view_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookely_app/core/utils/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedListViewCubit, FeaturedListViewState>(
      builder: (context, state) {
        if (state is FeaturedListViewSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.detailsBookView,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedListViewFaliedState) {
          return CustomErrorWidget(errorMessage: state.msg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
