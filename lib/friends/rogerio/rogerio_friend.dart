import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/rogerio/rogerio_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class RogerioFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  RogerioFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: RogerioSpriteSheet.heroIdLeft,
              idleRight: RogerioSpriteSheet.heroIdRight,
              idleUp: RogerioSpriteSheet.heroIdUp,
              idleDown: RogerioSpriteSheet.heroIdDown,
              runRight: RogerioSpriteSheet.heroRunRight,
              runLeft: RogerioSpriteSheet.heroRunLeft,
              runUp: RogerioSpriteSheet.heroRunUp,
              runDown: RogerioSpriteSheet.heroRunDown,
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
            child: RogerioSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "E aí Véio?"),
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
    if (!FollowerWidget.isVisible('identifyRogerio')) {
      FollowerWidget.show(
          identify: 'identifyRogerio',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Rogério - CPM",
            responsabilidade: "Chefe do SRE",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyRogerio');
  }

  @override
  void onMouseCancel() {}
}
