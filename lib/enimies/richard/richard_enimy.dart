import 'package:bonfire/bonfire.dart';
import 'package:dev_game/enimies/richard/richard_sprint_sheet.dart';
import 'package:dev_game/utils/attack/attack_sprite.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/cupertino.dart';

class RichardEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement, UseBarLife {
  bool canMove = true;

  RichardEnemy(Vector2 position)
      : super(
            position: position,
            size: Vector2(
              tileSize + 2,
              tileSize + 2,
            ),
            animation: SimpleDirectionAnimation(
                idleLeft: RichardEnemySpriteSheet.heroIdLeft,
                idleRight: RichardEnemySpriteSheet.heroIdRight,
                runRight: RichardEnemySpriteSheet.heroRunRight,
                runLeft: RichardEnemySpriteSheet.heroRunLeft),
            speed: 60) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize - 4, tileSize),
            align: Vector2(2, 2),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    if (canMove) {
      seePlayer(observed: (player) {
        seeAndMoveToPlayer(
            closePlayer: (player) {
              _executeAttack();
            },
            radiusVision: tileSize * 4,
            margin: 4);
      }, notObserved: () {
        runRandomMovement(dt);
      });
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    // drawDefaultLifeBar(canvas,
    //     borderRadius: BorderRadius.circular(5),
    //     borderWidth: 2.0,
    //     height: 2,
    //     align: const Offset(0, -3));
    super.render(canvas);
  }

  @override
  void die() {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(RichardEnemySpriteSheet.dieLeft, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    } else {
      animation?.playOnce(RichardEnemySpriteSheet.dieRight, runToTheEnd: true,
          onFinish: () {
        removeFromParent();
      });
    }
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    if (!isDead) {
      canMove = false;
      if (lastDirectionHorizontal == Direction.left) {
        animation?.playOnce(RichardEnemySpriteSheet.recevieDamageLeft,
            runToTheEnd: true, onFinish: () {
          canMove = true;
        });
      } else {
        animation?.playOnce(RichardEnemySpriteSheet.recevieDamageRight,
            runToTheEnd: true, onFinish: () {
          canMove = true;
        });
      }
      super.receiveDamage(attacker, damage, identify);
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
}
