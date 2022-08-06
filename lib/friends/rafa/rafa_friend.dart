import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/rafa/rafa_sprit_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/conversas/conversas_normais.dart';
import 'package:dev_game/utils/widgets/action_friend/popUpProcessamento.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class RafaFriend extends SimpleEnemy
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool canMove = true;

  RafaFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              runRight: RafaSpriteSheet.cadeiraRight,
              idleRight: RafaSpriteSheet.cadeiraRight,
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
        FollowerWidget.remove('processamento');
        FollowerWidget.remove('identityRafa');
        animation?.playOnce(RafaSpriteSheet.cadeiraDown);
        var say = ConversasNormais(
            spriteFriend: RafaSpriteSheet.cadeiraDown.asWidget(),
            spriteHero: HeroSpriteSheet.heroIdDown.asWidget());
        TalkDialog.show(context, [
          ...say.talkNormal('E aí Rafinha', 'E aí, Muna!'),
          ...say.talkNormal(
              'Como tá aí?',
              processamentoAction && !timerProcessamento.finished
                  ? 'Estou processandos os dados segura aí já estou acabando'
                  : fase.dados == 0
                      ? 'Precisamos de alguns dados para processar, fiquei sabendo que o Roriz tem algum.'
                      : 'Quer que eu processe esses ${fase.dados} dados ?'),
        ], onFinish: () {
          if (!FollowerWidget.isVisible('processamento') &&
              fase.dados > 0 &&
              timerProcessamento.finished) {
            FollowerWidget.show(
                identify: 'processamento',
                context: context,
                align: alignProcessamento,
                target: this,
                child: const PopUpProcessamentoWidget());
          }
          canMove = true;
        });
      },
    );
  }

  @override
  void update(double dt) {
    if (processamentoAction) {
      life = (timerProcessamento.progress * 100);
      if (timerProcessamento.progress == 1) {
        processamentoAction = false;
        FlameAudio.play('processamento_sound.mp3');
        fase.processados = fase.dados;
        fase.dados = 0;
      }
    }
    timerProcessamento.update(dt);
    super.update(dt);
  }

  // moves(Vector2 target) {
  //   var positionXAtual = position.x;
  //   var positionYAtual = position.y;

  //   if (position.x == target.x && position.y == target.y) {
  //     movePosition = false;
  //   }
  //   if (movePosition) {
  //     if ((positionXAtual - target.y).abs() <=
  //         (positionYAtual - target.y).abs()) {
  //       if (positionYAtual > (position.y * 0.1)) {
  //         animation!.play(SimpleAnimationEnum.runUp);
  //       } else if (positionYAtual < (position.y * 0.1)) {
  //         animation!.play(SimpleAnimationEnum.runDown);
  //       }
  //       position.moveToTarget(Vector2(target.x, target.y), 0.7);
  //     } else {
  //       if (positionXAtual > (position.x * 0.1)) {
  //         animation!.play(SimpleAnimationEnum.runRight);
  //       } else if (positionXAtual < (position.x * 0.1)) {
  //         animation!.play(SimpleAnimationEnum.runLeft);
  //       }
  //       position.moveToTarget(Vector2(target.x, target.y), 0.7);
  //     }
  //   }
  // }

  @override
  void render(Canvas canvas) {
    if (processamentoAction) {
      drawDefaultLifeBar(
        canvas,
        borderWidth: 2,
        width: 35,
        height: 8,
        borderRadius: BorderRadius.circular(2),
        align: const Offset(0, -5),
      );
    }
    super.render(canvas);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
  @override
  void onHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identifyRafa')) {
      FollowerWidget.show(
          identify: 'identifyRafa',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Rafa - CPM",
            responsabilidade: "Chefe do Backend",
          ));
    }
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyRafa');
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
