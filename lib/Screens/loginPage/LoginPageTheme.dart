import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color.fromARGB(255,	21, 176, 151);
  static const Color loginGradientEnd = const Color.fromARGB(255, 113, 247, 159);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 8.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

