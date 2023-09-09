import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/core/utils/assets_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10, top: 50, bottom: 30),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManger.logo,
            height: 20,
            width: 75,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchView);
            },
            iconSize: 21,
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          )
        ],
      ),
    );
  }
}
