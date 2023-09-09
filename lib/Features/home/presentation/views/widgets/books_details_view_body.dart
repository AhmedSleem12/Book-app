import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/presentation/views/sections/also_like_section.dart';
import 'package:bookely_app/Features/home/presentation/views/sections/book_details_section.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_app_bar_books_details.dart';
import 'package:flutter/material.dart';

class BooksDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BooksDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2),
      child: Column(
        children: [
          const CustomAppBarBookDetails(),
          const SizedBox(height: 32),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      BookDetailsSection(book: book),
                      const Expanded(child: SizedBox(height: 50)),
                      const AlsoLikeSection(),
                      const SizedBox(height: 34),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
