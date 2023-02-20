// ignore_for_file: use_build_context_synchronously
import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/roriz/roriz_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/conversas/conversas_normais.dart';
import 'package:dev_game/utils/widgets/action_friend/popUpDados.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class RorizFriend extends SimpleEnemy
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  bool celular = true;
  RorizFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: RorizSpriteSheet.heroIdLeft,
              idleRight: RorizSpriteSheet.heroIdRight,
              idleUp: RorizSpriteSheet.heroIdUp,
              idleDown: RorizSpriteSheet.heroIdDown,
              runRight: RorizSpriteSheet.heroRunRight,
              runLeft: RorizSpriteSheet.heroRunLeft,
              runUp: RorizSpriteSheet.heroRunUp,
              runDown: RorizSpriteSheet.heroRunDown,
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
    seePlayer(
      radiusVision: 72,
      observed: (value) {
        FollowerWidget.remove('dados');
        FollowerWidget.remove('identifyRoriz');
        canMove = false;

        animation?.play(SimpleAnimationEnum.idleDown);
        var say = ConversasNormais(
            spriteFriend: RorizSpriteSheet.heroIdDown.asWidget(),
            spriteHero: HeroSpriteSheet.heroIdDown.asWidget());
        TalkDialog.show(context, [
          // ...say.talkNormal('Fala meu Gigante favorito!', 'Bom dia, Muna!'),
          // ...say.talkNormal('Tô precisando de uns dados para um sistema.',
          //     'Legal! o que vocês vão fazer?'),
          ...say.talkNormal(
              'Estamos fazendo um sistema para o chefe, vc tem alguns dados que pode compartilhar?',
              'Tenho sim, deixa eu ver aqui no celular ...')
        ], onFinish: () {
          celular = true;
          if (!FollowerWidget.isVisible('dados')) {
            FollowerWidget.show(
                identify: 'dados',
                context: context,
                align: alignDados,
                target: this,
                child: const PopUpDadosWidget(
                  action: "Quais dados vc quer?",
                  dado1: "Base do Pronampe para arrumar a esteira? 2 dados.",
                  dado2:
                      "Base do Microcrédito para um portal de acompanhamento? 1 dado.",
                  dado3:
                      "Base dos melhores posicionados no varejo PJ? 1 dados.",
                ));
          }
          canMove = true;
        });
      },
    );
  }

  @override
  void update(double dt) {
    if (celular) {
      celular = false;
      animation!.playOnce(RorizSpriteSheet.celular);
    }
    seePlayer(
        observed: (_) {},
        notObserved: () {
          if (canMove) {
            runRandomMovement(dt);
          }
        });

    super.update(dt);
  }

  @override
  void onTapCancel() {}

  @override
  void onMouseTap(MouseButton button) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onMouseHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyRoriz')) {
      FollowerWidget.show(
          identify: 'identifyRoriz',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Roriz - GCI",
            responsabilidade: "GETAT - PJ",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyRoriz');
  }

  @override
  void onMouseCancel() {}
}
