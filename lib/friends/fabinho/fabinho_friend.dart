import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/fabinho/fabinho_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class FabinhoFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  FabinhoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: FabinhoSpriteSheet.heroIdLeft,
              idleRight: FabinhoSpriteSheet.heroIdRight,
              idleUp: FabinhoSpriteSheet.heroIdUp,
              idleDown: FabinhoSpriteSheet.heroIdDown,
              runRight: FabinhoSpriteSheet.heroRunRight,
              runLeft: FabinhoSpriteSheet.heroRunLeft,
              runUp: FabinhoSpriteSheet.heroRunUp,
              runDown: FabinhoSpriteSheet.heroRunDown,
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
