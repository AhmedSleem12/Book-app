import 'package:bookely_app/Features/home/presentation/view_model/featured_list_view/cubit/featured_list_view_cubit.dart';
import 'package:bookely_app/Features/home/presentation/view_model/newestBooks/cubit/newest_books_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/features_list_view.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookely_app/core/utils/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await BlocProvider.of<FeaturedListViewCubit>(context)
              .fetchFeaturedBooks();
          await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
        },
        color: const Color(0xffEF8262),
        child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
          builder: (context, state) {
            if (state is NewestBooksSuccessState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    const FeaturedListView(),
                    const SizedBox(height: 55),
                    const Text(
                      "Newest Books",
                      style: Styles.textStyle18,
                    ),
                    const SizedBox(height: 23),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: BestSellerListViewItem(
                              book: state.books[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is NewestBooksFaliureState) {
              return CustomErrorWidget(errorMessage: state.msg);
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ));
  }
}
