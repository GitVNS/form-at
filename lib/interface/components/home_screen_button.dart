import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({
    super.key,
    required this.title,
    required this.onTap,
    this.fillColor,
    this.borderColor,
    this.textColor,
  });

  final String title;
  final VoidCallback onTap;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkSparkle.splashFactory,
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: borderColor == null
                ? AppColors.secondary.shade500
                : borderColor!,
          ),
          color: fillColor == null ? AppColors.secondary.shade700 : fillColor!,
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: TextStyle(
            color: textColor == null ? AppColors.primary : textColor!,
          ),
        ),
      ),
    );
  }
}
