import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/leo/leo_sprite_sheet.dart';
import 'package:dev_game/friends/thiago/thiago_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class ThiagoFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  ThiagoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleRight: ThiagoSpriteSheet.thiagoCadeira,
              runRight: ThiagoSpriteSheet.thiagoCadeira,
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
  void onTap() {
    TalkDialog.show(context, [
      Say(
          text: [
            const TextSpan(text: "Bom dia, chefe!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: LeoSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "E aí Thiago?"),
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
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyThiago')) {
      FollowerWidget.show(
          identify: 'identifyThiago',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Leo - Ass. Master",
            responsabilidade: "Frontend",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyThiago');
  }

  @override
  void onMouseCancel() {}

  @override
  void onMouseTapLeft() {}

  @override
  void onMouseTapMiddle() {}

  @override
  void onMouseTapRight() {}

  @override
  void onScroll(int pointer, Vector2 position, Vector2 scrollDelta) {}
}
