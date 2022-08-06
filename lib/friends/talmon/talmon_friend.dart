import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/talmon/talmon_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/conversas/conversas_normais.dart';
import 'package:dev_game/utils/widgets/action_friend/popUpPadrao.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class TalmonFriend extends SimpleEnemy
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;
  TalmonFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: TalmonSpriteSheet.heroIdLeft,
              idleRight: TalmonSpriteSheet.heroIdRight,
              idleUp: TalmonSpriteSheet.heroIdUp,
              idleDown: TalmonSpriteSheet.heroIdDown,
              runRight: TalmonSpriteSheet.heroRunRight,
              runLeft: TalmonSpriteSheet.heroRunLeft,
              runUp: TalmonSpriteSheet.heroRunUp,
              runDown: TalmonSpriteSheet.heroRunDown,
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
        FollowerWidget.remove('agiliza');
        FollowerWidget.remove('identityTalmon');

        var say = ConversasNormais(
            spriteFriend: TalmonSpriteSheet.heroIdDown.asWidget(),
            spriteHero: HeroSpriteSheet.heroIdDown.asWidget());
        TalkDialog.show(context, [
          ...say.talkNormal('E aí Muriçoca', 'E aí, cabeça de grilo!'),
          ...say.talkNormal(
              'Como tá aí?',
              agiliza
                  ? "Você já pediu para agilizar uma vêz somente na próxima fase."
                  : !timerProcessamento.finished && !timerPaginas.finished
                      ? 'Posso ajudar o Rafa ou o Rodrigo mas eles não estão em nenhum projeto'
                      : 'Quer eu agilize a criação das páginas ou o processamento ?'),
        ], onFinish: () {
          if (!FollowerWidget.isVisible('agiliza') && !agiliza) {
            FollowerWidget.show(
                identify: 'agiliza',
                context: context,
                align: alignProcessamento,
                target: this,
                child: const PopUpPadraoWidget(
                  title: 'Quer que eu agilize o que os meninos estão fazendo?',
                  subTitle:
                      'Ganho de processamento ou página, pode usar somente uma vez.',
                  setAction: setAgiliza,
                ));
          }
          canMove = true;
        });
      },
    );
  }

  @override
  void update(double dt) {
    if (agiliza) {
      if (fase.dados > 0) {
        fase.processados = fase.dados;
        fase.dados = 0;
      }
      if (fase.processados > 0) {
        fase.processados = 0;
        fase.paginas = 1;
        FlameAudio.play('agiliza.mp3');
      }
    }
    super.update(dt);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyTalmon')) {
      FollowerWidget.show(
          identify: 'identifyTalmon',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Talmon - GE",
            responsabilidade: "Chefe do Desenvolvimento",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyTalmon');
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
