import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/cadu/cadu_sprite_sheet.dart';
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
              idleLeft: RafaSpriteSheet.heroIdLeft,
              idleRight: RafaSpriteSheet.heroIdRight,
              idleUp: RafaSpriteSheet.heroIdUp,
              idleDown: RafaSpriteSheet.heroIdDown,
              runRight: RafaSpriteSheet.heroRunRight,
              runLeft: RafaSpriteSheet.heroRunLeft,
              runUp: RafaSpriteSheet.heroRunUp,
              runDown: RafaSpriteSheet.heroRunDown,
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
        canMove = false;
        FollowerWidget.remove('processamento');
        FollowerWidget.remove('identityRafa');

        animation?.play(SimpleAnimationEnum.idleDown);
        var say = ConversasNormais(
            spriteFriend: RafaSpriteSheet.heroIdDown.asWidget(),
            spriteHero: HeroSpriteSheet.heroIdDown.asWidget());
        TalkDialog.show(context, [
          ...say.talkNormal('E aí Rafinha', 'E aí, Muna!'),
          ...say.talkNormal(
              'Como tá aí?',
              dados == 0
                  ? 'Precisamos de alguns dados para processar, fiquei sabendo que o Roriz tem algum.'
                  : 'Quer que eu processe os $dados dados ?'),
        ], onFinish: () {
          if (!FollowerWidget.isVisible('processamento') && dados > 0) {
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
        processados = dados;
        dados = 0;
      }
    }
    seePlayer(
        observed: (_) {},
        notObserved: () {
          if (canMove) {
            runRandomMovement(dt);
          }
        });

    timerProcessamento.update(dt);
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (processamentoAction) {
      drawDefaultLifeBar(
        canvas,
        borderWidth: 2,
        width: 30,
        height: 5,
        align: const Offset(0, -5),
      );
    }
    super.render(canvas);
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
