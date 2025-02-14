import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ofitsiantVmProvider = ChangeNotifierProvider((ref) => OfitsiantVm());

class OfitsiantVm extends ChangeNotifier {
  int page = 0;
  final PageController pageController = PageController();

  void nextPage(int index) {
    page = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
