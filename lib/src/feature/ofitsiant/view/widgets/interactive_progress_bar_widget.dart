import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';

class InteractiveProgressBar extends StatefulWidget {
  final VoidCallback onConfirmComplete;
  final VoidCallback onReadyComplete;

  const InteractiveProgressBar({
    super.key,
    required this.onConfirmComplete,
    required this.onReadyComplete,
  });

  @override
  _InteractiveProgressBarState createState() => _InteractiveProgressBarState();
}

class _InteractiveProgressBarState extends State<InteractiveProgressBar> {
  double progress = 1.0;
  bool isAnimating = false;
  String buttonText = "Tasdiqlash";

  void startProgress() {
    if (isAnimating) return;

    setState(() {
      isAnimating = true;
      buttonText = "Tayyorlanmoqda";
      progress = 0.0;
    });

    widget.onConfirmComplete();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        buttonText = "Tayyor";
      });

      Future.delayed(const Duration(seconds: 1), () {
        widget.onReadyComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startProgress,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 5),
        tween: Tween<double>(begin: 1.0, end: progress),
        builder: (context, double value, child) {
          return Stack(
            children: [
              SizedBox(
                height: 30.h,
                width: 142.w,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.cGrey2,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
                width: 142.w * value,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.cGreen,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// InteractiveProgressBar chaqiruvi
Widget buildInteractiveProgressBar(controller) {
  return InteractiveProgressBar(
    onConfirmComplete: () {
      controller.pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    },
    onReadyComplete: () {
      controller.pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    },
  );
}
