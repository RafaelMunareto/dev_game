import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/thaisa/thaisa_sprite_sheet.dart';

import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/identity_widget.dart';
import 'package:flutter/material.dart';

class ThaisaFriend extends SimplePlayer
    with ObjectCollision, Lighting, AutomaticRandomMovement, TapGesture {
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
            title: "Thaísa - TBN",
            responsabilidade: "PJ AG. 647",
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
