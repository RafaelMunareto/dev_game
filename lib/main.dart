import 'package:dev_game/game.dart';
import 'package:dev_game/utils/fade_page_transitions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.linux: FadePageTransition(),
            },
          )),
      debugShowCheckedModeBanner: false,
      home: const Game(),
    ),
  );
}
