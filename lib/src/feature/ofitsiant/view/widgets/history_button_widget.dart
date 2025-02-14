import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';

class HistoryButtonWidget extends StatefulWidget {
  const HistoryButtonWidget({super.key});

  @override
  State<HistoryButtonWidget> createState() => _HistoryButtonWidgetState();
}

class _HistoryButtonWidgetState extends State<HistoryButtonWidget> {
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
            SvgPicture.asset("assets/icons/history_icon.svg"),
            if (isExpanded) ...[
              8.horizontalSpace,
              const Text(
                "Buyurtmalar\n     Tarixi",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
