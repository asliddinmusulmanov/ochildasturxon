import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashVmProvider = ChangeNotifierProvider((ref) => SplashVm());

class SplashVm extends ChangeNotifier {}
