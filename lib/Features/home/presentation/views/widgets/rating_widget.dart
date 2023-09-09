import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingWidget extends StatelessWidget {
  final int count;
  final double rating;
  const RatingWidget(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.count,
      required this.rating});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        const SizedBox(width: 6),
        Text(
          "$rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 4),
        Text(
          "$count",
          style: Styles.textStyle14.copyWith(
            color: whtieWithOpacity,
          ),
        )
      ],
    );
  }
}
