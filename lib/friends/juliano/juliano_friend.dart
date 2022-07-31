import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/juliano/juliano_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class JulianoFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  JulianoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: JulianoSpriteSheet.heroIdLeft,
              idleRight: JulianoSpriteSheet.heroIdRight,
              idleUp: JulianoSpriteSheet.heroIdUp,
              idleDown: JulianoSpriteSheet.heroIdDown,
              runRight: JulianoSpriteSheet.heroRunRight,
              runLeft: JulianoSpriteSheet.heroRunLeft,
              runUp: JulianoSpriteSheet.heroRunUp,
              runDown: JulianoSpriteSheet.heroRunDown,
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
