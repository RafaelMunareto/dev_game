import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/japa/japa_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class JapaFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  JapaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: JapaSpriteSheet.heroIdLeft,
              idleRight: JapaSpriteSheet.heroIdRight,
              idleUp: JapaSpriteSheet.heroIdUp,
              idleDown: JapaSpriteSheet.heroIdDown,
              runRight: JapaSpriteSheet.heroRunRight,
              runLeft: JapaSpriteSheet.heroRunLeft,
              runUp: JapaSpriteSheet.heroRunUp,
              runDown: JapaSpriteSheet.heroRunDown,
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
            child: JapaSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "E aí Japa?"),
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
    if (!FollowerWidget.isVisible('identifyJapa')) {
      FollowerWidget.show(
          identify: 'identifyJapa',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Japa - Consultor",
            responsabilidade: "Célula do Backend",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyJapa');
  }

  @override
  void onMouseCancel() {}
}
