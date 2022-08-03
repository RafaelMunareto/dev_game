import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/silvia/silvia_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class SilviaFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
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
            const TextSpan(text: "Bom dia, Sr. Munareto!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: SilviaSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "Bom dia, Dona Silvia!"),
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
    if (!FollowerWidget.isVisible('identifySilvia')) {
      FollowerWidget.show(
          identify: 'identifySilvia',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Silvia - Copeira",
            responsabilidade: "Alimentação",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifySilvia');
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
