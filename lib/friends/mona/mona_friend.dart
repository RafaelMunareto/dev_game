import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/mona/mona_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class MonaFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
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
            const TextSpan(text: "Bom dia, Chefe!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: MonaSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "Oi Mona!"),
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
    if (!FollowerWidget.isVisible('identifyMona')) {
      FollowerWidget.show(
          identify: 'identifyMona',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Mona - Consultora",
            responsabilidade: "Administrativo",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyMona');
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
