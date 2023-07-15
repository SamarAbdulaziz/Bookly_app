import 'package:bookly_app_tharwat/core/utils/app_router.dart';
import 'package:bookly_app_tharwat/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CutomAppBar extends StatelessWidget {
  const CutomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 18),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
