import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/fernando/fernando_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class FernandoFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  FernandoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: FernandoSpriteSheet.heroIdLeft,
              idleRight: FernandoSpriteSheet.heroIdRight,
              idleUp: FernandoSpriteSheet.heroIdUp,
              idleDown: FernandoSpriteSheet.heroIdDown,
              runRight: FernandoSpriteSheet.heroRunRight,
              runLeft: FernandoSpriteSheet.heroRunLeft,
              runUp: FernandoSpriteSheet.heroRunUp,
              runDown: FernandoSpriteSheet.heroRunDown,
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
