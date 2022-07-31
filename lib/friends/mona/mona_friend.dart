import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/mona/mona_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class MonaFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  MonaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: MonaSpriteSheet.heroIdLeft,
              idleRight: MonaSpriteSheet.heroIdRight,
              idleUp: MonaSpriteSheet.heroIdUp,
              idleDown: MonaSpriteSheet.heroIdDown,
              runRight: MonaSpriteSheet.heroRunRight,
              runLeft: MonaSpriteSheet.heroRunLeft,
              runUp: MonaSpriteSheet.heroRunUp,
              runDown: MonaSpriteSheet.heroRunDown,
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
