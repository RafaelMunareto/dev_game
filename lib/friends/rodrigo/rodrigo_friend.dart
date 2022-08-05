import 'package:bonfire/bonfire.dart';
import 'package:dev_game/friends/rodrigo/rodrigo_sprite_sheet.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/conversas/conversas_normais.dart';
import 'package:dev_game/utils/widgets/action_friend/popUpPaginas.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class RodrigoFriend extends SimpleEnemy
    with
        ObjectCollision,
        Lighting,
        AutomaticRandomMovement,
        TapGesture,
        MouseGesture {
  bool movePosition = false;
  Vector2 positionTarget = Vector2(84, 754);
  RodrigoFriend(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: RodrigoSpriteSheet.heroIdLeft,
              idleRight: RodrigoSpriteSheet.heroIdRight,
              idleUp: RodrigoSpriteSheet.heroIdUp,
              idleDown: RodrigoSpriteSheet.heroIdDown,
              runRight: RodrigoSpriteSheet.heroRunRight,
              runLeft: RodrigoSpriteSheet.heroRunLeft,
              runUp: RodrigoSpriteSheet.heroRunUp,
              runDown: RodrigoSpriteSheet.heroRunDown,
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

        animation?.play(SimpleAnimationEnum.idleDown);
        var say = ConversasNormais(
            spriteFriend: RodrigoSpriteSheet.heroIdDown.asWidget(),
            spriteHero: HeroSpriteSheet.heroIdDown.asWidget());
        TalkDialog.show(context, [
          ...say.talkNormal('Fala Vicentão !', 'E aí Mumu!'),
          ...say.talkNormal(
              'Bora fazer uns trens aí.',
              !timerPaginas.finished && paginasAction
                  ? 'Tô fazendos as páginas, devo ter feito ${(timerPaginas.progress * 100).toStringAsFixed(0)} %'
                  : fase.processados == 0
                      ? 'Precisamos processar alguns dados para fazer as páginas! Troca uma ideia com o Rafinha.'
                      : 'Quer que eu faça as páginas ?'),
        ], onFinish: () {
          if (fase.processados > 0) {
            if (!FollowerWidget.isVisible('paginasRodrigo')) {
              FollowerWidget.show(
                  identify: 'paginasRodrigo',
                  context: context,
                  align: alignProcessamento,
                  target: this,
                  child: const PopUpPaginasWidget());
            }
          }
        });
      },
    );
  }

  moves(Vector2 target) {
    if (position.x == target.x && position.y == target.y) {
      movePositionRodrigoPaginas = false;
      size = Vector2.all(0);
    }
    if (movePositionRodrigoPaginas) {
      animation!.play(SimpleAnimationEnum.runUp);
      position.moveToTarget(Vector2(target.x, target.y), 0.7);
    }
  }

  @override
  void update(double dt) {
    timerPaginas.update(dt);
    if (paginasAction) {
      life = (timerPaginas.progress * 100);
      if (timerPaginas.progress == 1) {
        paginasAction = false;
        FlameAudio.play('paginas_sound.mp3');
        fase.paginas = fase.processados;
        fase.processados = 0;
      }
    }
    if (movePositionRodrigoPaginas) {
      moves(positionTarget);
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
    if (!FollowerWidget.isVisible('identifyRodrigo')) {
      FollowerWidget.show(
          identify: 'identifyRodrigo',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Rodrigo - CPM",
            responsabilidade: "Chefe do Frontend",
          ));
    }
  }

  @override
  void render(Canvas canvas) {
    if (position.x == positionTarget.x &&
        position.y == positionTarget.y &&
        paginasAction) {
      drawDefaultLifeBar(
        canvas,
        borderWidth: 2,
        width: 35,
        height: 8,
        borderRadius: BorderRadius.circular(5),
        align: const Offset(0, -5),
      );
    }
    super.render(canvas);
  }

  @override
  void onHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identifyRodrigo');
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
