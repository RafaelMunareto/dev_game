// ignore_for_file: unused_element

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/decoration/cadeira_munareto/cadeira_munareto_decoration_sprit_sheet.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/action_player/action_player.dart';

import 'package:flutter/material.dart';

class CadeiraMunareto extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClosed = false;

  Sprite? cadeira, cadeiraLogado;

  CadeiraMunareto(Vector2 position)
      : super.withSprite(
            sprite: CadeiraMunaretoDecorationSpritSheet.cadeira,
            position: position,
            size: Vector2(24, 48)) {
    setupCollision(CollisionConfig(
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(12, 14),
          align: Vector2(2, 14),
        )
      ],
    ));
  }
  @override
  void update(double dt) {
    seeComponentType<GameHero>(
        observed: (player) {
          if (!_playerIsClosed) {
            _playerIsClosed = true;
            gameRef.player!.size = Vector2.all(0);
            _showDialog();
          }
        },
        notObserved: () {
          _playerIsClosed = false;
          gameRef.player!.size = Vector2.all(tileSizePerson);
          FollowerWidget.remove('actionPlayer');
        },
        radiusVision: tileSize);
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_playerIsClosed) {
      sprite = cadeiraLogado;
    } else {
      sprite = cadeira;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    cadeira = await CadeiraMunaretoDecorationSpritSheet.cadeira;
    cadeiraLogado = await CadeiraMunaretoDecorationSpritSheet.cadeiraLogada;

    return super.onLoad();
  }

  void _showDialog() {
    if (!FollowerWidget.isVisible('actionPlayer')) {
      FollowerWidget.show(
        identify: 'actionPlayer',
        context: context,
        align: alignActionPlayers,
        target: this,
        child: ActionPlayerWidget(
          game: gameRef,
        ),
      );
    }
  }

  @override
  void onTap() {}

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
