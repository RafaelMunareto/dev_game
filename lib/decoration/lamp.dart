import 'package:bonfire/bonfire.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class Lamp extends GameDecoration with Lighting {
  Lamp(Vector2 position)
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
        ) {
    setupLighting(LightingConfig(
        radius: tileSize * 1.5,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
        pulseVariation: 0.2));
  }
}
