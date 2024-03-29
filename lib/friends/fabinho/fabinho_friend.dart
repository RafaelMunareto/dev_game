import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/fabinho/fabinho_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class FabinhoFriend extends SimplePlayer
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  FabinhoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: FabinhoSpriteSheet.heroIdLeft,
              idleRight: FabinhoSpriteSheet.heroIdRight,
              idleUp: FabinhoSpriteSheet.heroIdUp,
              idleDown: FabinhoSpriteSheet.heroIdDown,
              runRight: FabinhoSpriteSheet.heroRunRight,
              runLeft: FabinhoSpriteSheet.heroRunLeft,
              runUp: FabinhoSpriteSheet.heroRunUp,
              runDown: FabinhoSpriteSheet.heroRunDown,
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
            const TextSpan(text: "Bom dia, Munareto!"),
          ],
          person: SizedBox(
            height: 150,
            width: 150,
            child: FabinhoSpriteSheet.heroIdDown.asWidget(),
          ),
          personSayDirection: PersonSayDirection.RIGHT),
      Say(
          text: [
            const TextSpan(text: "Fala Fabinho?"),
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
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onMouseHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyFabinho')) {
      FollowerWidget.show(
          identify: 'identifyFabinho',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Fabinho - Consultor",
            responsabilidade: "Célula do conquiste",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyFabinho');
  }

  @override
  void onMouseCancel() {}

  @override
  void onMouseTap(MouseButton button) {}
}
