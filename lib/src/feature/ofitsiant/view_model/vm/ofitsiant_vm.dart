import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ofitsiantVmProvider = ChangeNotifierProvider((ref) => OfitsiantVm());

class OfitsiantVm extends ChangeNotifier {
  int page = 0;
  List<bool> buttons = [true, false, false];
  final PageController pageController;

  OfitsiantVm() : pageController = PageController(initialPage: 0); // initialPage ni 0 ga o'zgartiring

  void tapped({required int index}) {
    if (page != index) {
      pageController.jumpToPage(index); // `animateToPage` o'rniga `jumpToPage`
    }
  }

  void animateToPage(int index) {
    page = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners(); // Faqat shu yerda notifyListeners() ni chaqiring
    debugPrint("page: $index");
  }

  void updateButtons(int index) {
    buttons = [false, false, false]; // Barcha tugmalarni o'chirish
    buttons[index] = true; // Faqat joriy sahifaga mos tugmani yoqish
    notifyListeners();
  }
}
