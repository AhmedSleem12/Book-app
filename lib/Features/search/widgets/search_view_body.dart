import 'package:bookely_app/Features/search/widgets/custom_search_bar.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchBar(),
          SizedBox(height: 40),
          Text(
            "Search Results",
            style: Styles.textStyle18,
          ),
          SizedBox(height: 25),
          Expanded(child: BuildSearchResultListview()),
        ],
      ),
    );
  }
}

class BuildSearchResultListview extends StatelessWidget {
  const BuildSearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          // child: BestSellerListViewItem(),
          child: Container(),
        );
      },
    );
  }
}
