import 'package:bonfire/bonfire.dart';
import 'package:dev_game/player/hero_sprint_sheet.dart';
import 'package:dev_game/utils/attack/attack_sprite.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/comum/identity_widget.dart';
import 'package:flutter/material.dart';

class GameHero extends SimplePlayer
    with ObjectCollision, Lighting, TapGesture, MouseGesture {
  bool canMove = true;
  GameHero(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSizePerson,
              tileSizePerson,
            ),
            animation: SimpleDirectionAnimation(
              idleLeft: HeroSpriteSheet.heroIdLeft,
              idleRight: HeroSpriteSheet.heroIdRight,
              idleUp: HeroSpriteSheet.heroIdUp,
              idleDown: HeroSpriteSheet.heroIdDown,
              runRight: HeroSpriteSheet.heroRunRight,
              runLeft: HeroSpriteSheet.heroRunLeft,
              runUp: HeroSpriteSheet.heroRunUp,
              runDown: HeroSpriteSheet.heroRunDown,
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
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 32) {
      _executeAttack();
    }

    super.joystickAction(event);
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    canMove = false;
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(HeroSpriteSheet.recevieDamageLeft, runToTheEnd: true,
          onFinish: () {
        canMove = true;
      });
    } else {}
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (canMove) {
      super.joystickChangeDirectional(event);
    }
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      size: Vector2(tileSize, tileSize),
      sizePush: tileSize / 2,
      animationRight: AttackSpritesSheet.attackRight,
    );
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(HeroSpriteSheet.dieLeft, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    } else {
      animation?.playOnce(HeroSpriteSheet.dieRight, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    }
    super.die();
  }

  @override
  void onTap() {}

  @override
  void onTapCancel() {}

  @override
  void onMouseTap(MouseButton button) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}

  @override
  void onMouseHoverEnter(int pointer, Vector2 position) {
    if (!FollowerWidget.isVisible('identify')) {
      FollowerWidget.show(
          identify: 'identify',
          context: context,
          align: alignIdentity,
          target: this,
          child: const IdentityWidget(
            title: "Munareto - GN",
            responsabilidade: "Chefe da área",
          ));
    }
  }

  @override
  void onMouseHoverExit(int pointer, Vector2 position) {
    FollowerWidget.remove('identify');
  }

  @override
  void onMouseCancel() {}
}
