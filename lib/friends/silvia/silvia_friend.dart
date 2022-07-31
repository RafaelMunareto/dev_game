import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/silvia/silvia_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class SilviaFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement {
  bool canMove = true;
  SilviaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: SilviaSpriteSheet.heroIdLeft,
              idleRight: SilviaSpriteSheet.heroIdRight,
              idleUp: SilviaSpriteSheet.heroIdUp,
              idleDown: SilviaSpriteSheet.heroIdDown,
              runRight: SilviaSpriteSheet.heroRunRight,
              runLeft: SilviaSpriteSheet.heroRunLeft,
              runUp: SilviaSpriteSheet.heroRunUp,
              runDown: SilviaSpriteSheet.heroRunDown,
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
