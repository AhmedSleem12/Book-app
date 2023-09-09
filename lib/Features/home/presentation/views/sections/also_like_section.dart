import 'package:bookely_app/Features/home/presentation/views/widgets/you_can_also_like_list_view.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AlsoLikeSection extends StatelessWidget {
  const AlsoLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        const SimllerYouCanLikeAlsoListView(),
      ],
    );
  }
}
