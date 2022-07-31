import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/leo/leo_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class LeoFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  LeoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: LeoSpriteSheet.heroIdLeft,
              idleRight: LeoSpriteSheet.heroIdRight,
              idleUp: LeoSpriteSheet.heroIdUp,
              idleDown: LeoSpriteSheet.heroIdDown,
              runRight: LeoSpriteSheet.heroRunRight,
              runLeft: LeoSpriteSheet.heroRunLeft,
              runUp: LeoSpriteSheet.heroRunUp,
              runDown: LeoSpriteSheet.heroRunDown,
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
    //runRandomMovement(dt);
    super.update(dt);
  }
}
