import 'package:bookely_app/Features/home/presentation/view_model/newestBooks/cubit/newest_books_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookely_app/core/utils/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBestSellerListView extends StatelessWidget {
  const BuildBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
          );
        } else if (state is NewestBooksFaliureState) {
          return CustomErrorWidget(errorMessage: state.msg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
