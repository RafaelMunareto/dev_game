import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/thaisa/thaisa_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class ThaisaFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  ThaisaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: ThaisaSpriteSheet.heroIdLeft,
              idleRight: ThaisaSpriteSheet.heroIdRight,
              idleUp: ThaisaSpriteSheet.heroIdUp,
              idleDown: ThaisaSpriteSheet.heroIdDown,
              runRight: ThaisaSpriteSheet.heroRunRight,
              runLeft: ThaisaSpriteSheet.heroRunLeft,
              runUp: ThaisaSpriteSheet.heroRunUp,
              runDown: ThaisaSpriteSheet.heroRunDown,
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
