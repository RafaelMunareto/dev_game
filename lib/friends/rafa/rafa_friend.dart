import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/rafa/rafa_sprit_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class RafaFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  RafaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: RafaSpriteSheet.heroIdLeft,
              idleRight: RafaSpriteSheet.heroIdRight,
              idleUp: RafaSpriteSheet.heroIdUp,
              idleDown: RafaSpriteSheet.heroIdDown,
              runRight: RafaSpriteSheet.heroRunRight,
              runLeft: RafaSpriteSheet.heroRunLeft,
              runUp: RafaSpriteSheet.heroRunUp,
              runDown: RafaSpriteSheet.heroRunDown,
            ),
            speed: 75) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSizePerson - 4, tileSizePerson - 4),
            align: Vector2(2, 8),
          ),
        ],
      ),
    );

    setupLighting(LightingConfig(
        radius: tileSize * 1.5,
        color: Colors.transparent,
        withPulse: false,
        blurBorder: 16));
  }

  @override
  void update(double dt) {
    runRandomMovement(dt);
    super.update(dt);
  }
}
