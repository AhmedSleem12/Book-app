import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/rating_widget.dart';
import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
  const BookDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery * .23),
          child: Hero(
            tag: book.volumeInfo.title!,
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks.thumbnail,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          book.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 9),
        Text(
          book.volumeInfo.authors?[0] ?? "",
          textAlign: TextAlign.center,
          style: Styles.textStyle18
              .copyWith(color: whtieWithOpacity, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 18),
        RatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          count: book.volumeInfo.ratingsCount ?? 0,
          rating: book.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(height: 35),
        const BooksAction(),
      ],
    );
  }
}
