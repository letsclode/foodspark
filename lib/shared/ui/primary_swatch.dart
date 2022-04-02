//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToLight = const MaterialColor(
    0xff2fb4d2, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff44bcd7), //10%
      100: const Color(0xff59c3db), //20%
      200: const Color(0xff6dcbe0), //30%
      300: const Color(0xff82d2e4), //40%
      400: const Color(0xff97dae9), //50%
      500: const Color(0xfface1ed), //60%
      600: const Color(0xffc1e9f2), //70%
      700: const Color(0xffd5f0f6), //80%
      800: const Color(0xffeaf8fb), //90%
      900: const Color(0xffffffff), //100%
    },
  );
} // yo
