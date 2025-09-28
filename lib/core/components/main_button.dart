import 'package:flutter/material.dart';
import 'package:tmdb/config/app_colors.dart';
import 'package:tmdb/core/utils/file_utility.dart';

class MainButton extends StatelessWidget {
  final bool isLoading;
  final bool isDisabled;
  final bool hasTextStyle;
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final TextStyle? textStyle;

  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;

  final String title;
  final String? svgButton;

  final bool isLight;
  final double height;
  final double width;
  final double fontSize;
  final double elevation;

  const MainButton({
    this.textStyle,
    this.backgroundColor = AppColorsLight.primaryColor,
    this.foregroundColor = AppColorsLight.secondaryColor,
    required this.title,
    this.isLoading = false,
    this.isDisabled = false,
    this.hasTextStyle = false,
    required this.onPressed,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    super.key,
    this.svgButton,
    this.isLight = false,
    this.height = 48,
    this.fontSize = 16,
    this.width = 0,
    this.textColor = AppColorsLight.onPrimaryColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      child: isDisabled
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: elevation,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                disabledBackgroundColor: AppColorsLight.lightGray,
                disabledForegroundColor: foregroundColor,
                minimumSize: Size(width != 0 ? width : double.infinity, height),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
              ),
              onPressed: null,
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(color: AppColorsLight.secondaryColor, strokeWidth: 2),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (svgButton != null) renderSvg(svgButton!, color: AppColorsLight.secondaryColor),
                        if (svgButton != null) const SizedBox(width: 8),
                        Text(title, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: textColor)),
                      ],
                    ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: elevation,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                disabledBackgroundColor: backgroundColor,
                disabledForegroundColor: foregroundColor,
                minimumSize: Size(width != 0 ? width : double.infinity, height),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
              ),
              onPressed: !isLoading ? onPressed : null,
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(color: AppColorsLight.secondaryColor, strokeWidth: 2),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (svgButton != null) renderSvg(svgButton!, width: 24, height: 24),
                        if (svgButton != null) const SizedBox(width: 8),
                        Text(title, style: Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)),
                      ],
                    ),
            ),
    );
  }
}
