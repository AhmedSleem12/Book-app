import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errorMessage,
      textAlign: TextAlign.center,
      style: Styles.textStyle18,
    ));
  }
}
