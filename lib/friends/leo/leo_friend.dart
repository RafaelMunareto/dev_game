import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/leo/leo_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class LeoFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  LeoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: LeoSpriteSheet.heroIdLeft,
              idleRight: LeoSpriteSheet.heroIdRight,
              idleUp: LeoSpriteSheet.heroIdUp,
              idleDown: LeoSpriteSheet.heroIdDown,
              runRight: LeoSpriteSheet.heroRunRight,
              runLeft: LeoSpriteSheet.heroRunLeft,
              runUp: LeoSpriteSheet.heroRunUp,
              runDown: LeoSpriteSheet.heroRunDown,
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
            const TextSpan(text: "E aí Leo?"),
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
  @override
  void onHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyLeo')) {
      FollowerWidget.show(
          identify: 'identifyLeo',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Leo - Consultor",
            responsabilidade: "SRE",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyLeo');
  }

  @override
  void onMouseCancel() {
    // TODO: implement onMouseCancel
  }

  @override
  void onMouseTapLeft() {
    // TODO: implement onMouseTapLeft
  }

  @override
  void onMouseTapMiddle() {
    // TODO: implement onMouseTapMiddle
  }

  @override
  void onMouseTapRight() {
    // TODO: implement onMouseTapRight
  }

  @override
  void onScroll(int pointer, Vector2 position, Vector2 scrollDelta) {
    // TODO: implement onScroll
  }
}
