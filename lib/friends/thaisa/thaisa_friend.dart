import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/thaisa/thaisa_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';

import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class ThaisaFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
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
            speed: velocidadeGamers) {
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
    TalkDialog.show(context, [
      Say(
          text: [
            const TextSpan(text: "Oi Rafa!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: ThaisaSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "Oi Negrinha!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: HeroSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT)
    ]);
  }

  @override
  void onTapCancel() {}

  @override
  void onMouseTap(MouseButton button) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onMouseHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyThaisa')) {
      FollowerWidget.show(
          identify: 'identifyThaisa',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Thaísa - Assistente",
            responsabilidade: "AG. 647",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyThaisa');
  }

  @override
  void onMouseCancel() {}
}
