import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton(this.isExpanded, this.onTap, {required this.svgText, required this.textName, super.key});
  final bool isExpanded;
  final VoidCallback onTap;
  final String svgText;
  final String textName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: isExpanded ? 20 : 12, vertical: 10),
        decoration: BoxDecoration(
          color: isExpanded ? AppColors.cAmber : AppColors.cGrey,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(Icons.notifications, color: Colors.black),
            SvgPicture.asset(svgText),
            if (isExpanded) ...[
              8.horizontalSpace,
              Text(
                textName,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
