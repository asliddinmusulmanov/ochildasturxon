import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view/widgets/confirm_button_widget.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view/widgets/history_button_widget.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view/widgets/notification_button_widget.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view_model/vm/ofitsiant_vm.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OfitsiantPage extends ConsumerWidget {
  const OfitsiantPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctr = ref.read(ofitsiantVmProvider);
    ref.watch(ofitsiantVmProvider);

    final PageController _pageController = PageController(
      initialPage: ctr.page,
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFB130),
        // toolbarHeight: 108,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: SvgPicture.asset("assets/icons/edit.svg"),
                  onTap: () {},
                ),
                10.verticalSpace,
                InkWell(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/profile_icon.svg",
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Carla",
          style: GoogleFonts.kaushanScript(
            color: AppColors.white,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        flexibleSpace: Stack(
          children: [
            Image.asset(
              "assets/images/atlas.png",
              fit: BoxFit.fill,
            ),
            Image.asset("assets/images/lagan1.png"),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/lagan2.png",
                height: MediaQuery.of(context).size.height * 0.11.h,
              ),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    ctr.nextPage(0);
                  },
                  child: NotificationButton(),
                ),
                InkWell(
                  onTap: () {
                    ctr.nextPage(1);
                  },
                  child: const ConfirmButtonWidget(),
                ),
                InkWell(
                  onTap: () {
                    ctr.nextPage(2);
                  },
                  child: const HistoryButtonWidget(),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: ctr.pageController,
              onPageChanged: (index) => ctr.nextPage(index),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.21,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.sp),
                            ),
                            color: AppColors.cGrey,
                          ),
                          child: Padding(
                            padding: REdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${ctr.page}-stol",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text("Osh"),
                                    Text("Kabob - 2ta"),
                                    Text("Tandir go'sht"),
                                    Text("Bahoriy salat"),
                                    Text("Non - 2ta"),
                                    Text("Ko'k choy"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("10:20"),
                                    CircularPercentIndicator(
                                      radius: 50,
                                      lineWidth: 15,
                                      backgroundColor: AppColors.white,
                                      progressColor: AppColors.cGreen,
                                      animation: true,
                                      animationDuration: 2000,
                                      percent: 0.8,
                                      center: const Text("80%"),
                                      circularStrokeCap: CircularStrokeCap.round,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
