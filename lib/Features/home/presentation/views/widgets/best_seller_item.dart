import 'package:bookely_app/Features/home/data/data_model/book/book.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/rating_widget.dart';
import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  final BookModel book;
  const BestSellerListViewItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detailsBookView, extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Builder(builder: (ctx) {
              return Hero(
                tag: book.volumeInfo.title!,
                child: CustomBookImage(
                  imageUrl: book.volumeInfo.imageLinks.thumbnail,
                  radius: 7,
                ),
              );
            }),
            const SizedBox(width: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        book.volumeInfo.title!,
                        maxLines: 2,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      book.volumeInfo.authors![0],
                      style: Styles.textStyle14.copyWith(
                        color: whtieWithOpacity,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        RatingWidget(
                            rating: book.volumeInfo.averageRating ?? 0,
                            count: book.volumeInfo.ratingsCount ?? 0)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
