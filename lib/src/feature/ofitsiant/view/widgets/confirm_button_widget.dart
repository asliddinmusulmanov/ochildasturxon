import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';

class ConfirmButtonWidget extends StatefulWidget {
  const ConfirmButtonWidget({super.key});

  @override
  State<ConfirmButtonWidget> createState() => _ConfirmButtonWidgetState();
}

class _ConfirmButtonWidgetState extends State<ConfirmButtonWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
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
            SvgPicture.asset("assets/icons/confirm_icon.svg"),
            if (isExpanded) ...[
              8.horizontalSpace,
              const Text(
                "Tasdiqlangan\n Buyurtmalar",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
