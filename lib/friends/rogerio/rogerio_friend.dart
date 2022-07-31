import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/rogerio/rogerio_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class RogerioFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  RogerioFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: RogerioSpriteSheet.heroIdLeft,
              idleRight: RogerioSpriteSheet.heroIdRight,
              idleUp: RogerioSpriteSheet.heroIdUp,
              idleDown: RogerioSpriteSheet.heroIdDown,
              runRight: RogerioSpriteSheet.heroRunRight,
              runLeft: RogerioSpriteSheet.heroRunLeft,
              runUp: RogerioSpriteSheet.heroRunUp,
              runDown: RogerioSpriteSheet.heroRunDown,
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
