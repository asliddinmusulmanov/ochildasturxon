import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ochildasturxon/src/core/style/app_colors.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view/widgets/interactive_progress_bar_widget.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view/widgets/notification_button_widget.dart';
import 'package:ochildasturxon/src/feature/ofitsiant/view_model/vm/ofitsiant_vm.dart';

class OfitsiantPage extends ConsumerStatefulWidget {
  const OfitsiantPage({super.key});

  @override
  ConsumerState<OfitsiantPage> createState() => _OfitsiantPageState();
}

class _OfitsiantPageState extends ConsumerState<OfitsiantPage> {
  TextEditingController nameController = TextEditingController();
  String appBarTitle = "Carla"; // Boshlang'ich ism

  @override
  Widget build(BuildContext context) {
    var ctr = ref.read(ofitsiantVmProvider);
    ref.watch(ofitsiantVmProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffFFB130),
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: SvgPicture.asset("assets/icons/edit.svg"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Your Name"),
                          content: TextField(
                            controller: nameController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: "Enter your name",
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (nameController.text.isNotEmpty) {
                                  setState(() {
                                    appBarTitle = nameController.text;
                                  });
                                }
                                Navigator.of(context).pop();
                                nameController.clear();
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(13)),
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
          appBarTitle, // Yangilanadigan sarlavha
          style: GoogleFonts.kaushanScript(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        flexibleSpace: Stack(
          children: [
            Image.asset("assets/images/atlas.png", fit: BoxFit.fill),
            Image.asset("assets/images/lagan1.png"),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/lagan2.png",
                height: MediaQuery.of(context).size.height * 0.11,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(1, (index) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ctr.tapped(index: 0); // Tugma bosilganda
                      },
                      // splashColor: Colors.red,
                      child: NotificationButton(
                        ctr.buttons.elementAt(0),
                        () {
                          ctr.tapped(index: 0); // Tugma bosilganda
                        },
                        svgText: "assets/icons/notification_icon.svg",
                        textName: "     Yangi\nBuyurtmalar",
                      ),
                    ),
                    10.horizontalSpace,
                    InkWell(
                      onTap: () {
                        ctr.tapped(index: 1); // Tugma bosilganda
                      },
                      // splashColor: Colors.red,
                      child: NotificationButton(
                        ctr.buttons.elementAt(1),
                        () {
                          ctr.tapped(index: 1); // Tugma bosilganda
                        },
                        svgText: "assets/icons/confirm_icon.svg",
                        textName: "Tasdiqlangan\n Buyurtmalar",
                      ),
                    ),
                    10.horizontalSpace,
                    InkWell(
                      onTap: () {
                        ctr.tapped(index: 2); // Tugma bosilganda
                      },
                      // splashColor: Colors.red,
                      child: NotificationButton(
                        ctr.buttons.elementAt(2),
                        () {
                          ctr.tapped(index: 2); // Tugma bosilganda
                        },
                        svgText: "assets/icons/history_icon.svg",
                        textName: "Buyurtmalar\n     Tarixi",
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: ctr.pageController,
              onPageChanged: (index) {
                ctr.page = index; // Faqat page qiymatini yangilash
                ctr.updateButtons(index); // Tugmalarni yangilash
              },
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
                                    const Text("Osh"),
                                    const Text("Kabob - 2ta"),
                                    const Text("Tandir go'sht"),
                                    const Text("Bahoriy salat"),
                                    const Text("Non - 2ta"),
                                    const Text("Ko'k choy"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("10:20"),
                                    InteractiveProgressBar(
                                      onConfirmComplete: () {
                                        ctr.pageController.animateToPage(
                                          1, // 2-indexga o'tish (Tasdiqlangan buyurtmalar)
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      onReadyComplete: () {
                                        ctr.pageController.animateToPage(
                                          2, // 3-indexga o'tish (Yakunlangan buyurtmalar)
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
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
