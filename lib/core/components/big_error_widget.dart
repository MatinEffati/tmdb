import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tmdb/core/components/main_button.dart';
import '../utils/file_utility.dart';

class LargeErrorContainer extends StatelessWidget {
  final String? titleActionButton;
  final String title;
  final String? subtitle;
  final String svgThumbnail;
  final String? svgActionButton;
  final VoidCallback onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final bool activeLargeButton;

  const LargeErrorContainer({
    required this.onPressed,
    required this.title,
    this.titleActionButton,
    this.svgActionButton,
    required this.svgThumbnail,
    super.key,
    this.subtitle,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.activeLargeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Lottie.asset(svgThumbnail, width: 200, height: 200, fit: BoxFit.fill),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: activeLargeButton ? 40 : 24),
          activeLargeButton
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MainButton(title: titleActionButton!, onPressed: onPressed),
                )
              : svgActionButton != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MainButton(title: titleActionButton!, onPressed: onPressed, svgButton: svgActionButton),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
