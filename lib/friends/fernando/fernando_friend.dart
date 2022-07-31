import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/fernando/fernando_sprite_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/identity_widget.dart';
import 'package:flutter/material.dart';

class FernandoFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement, TapGesture {
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
            size: colisaoSizePersonagens,
            align: colisaoAlignPersonagens,
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

  @override
  void onTap() {
    if (FollowerWidget.isVisible('identify')) {
      FollowerWidget.remove('identify');
    } else {
      FollowerWidget.show(
          identify: 'identify',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Fernando - Consultor",
            responsabilidade: "BACKEND",
          ));
    }
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Vector2 position) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Vector2 position) {
    // TODO: implement onTapUp
  }
}
