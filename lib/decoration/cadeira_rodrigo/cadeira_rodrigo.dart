// ignore_for_file: unused_element

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/decoration/cadeira_munareto/cadeira_munareto_decoration_sprit_sheet.dart';
import 'package:dev_game/decoration/cadeira_rodrigo/cadeira_rodrigo_decoration_sprit_sheet.dart';
import 'package:dev_game/friends/rodrigo/rodrigo_friend.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:dev_game/utils/widgets/action_friend/popUpPaginas.dart';
import 'package:dev_game/utils/widgets/action_player/action_player.dart';

import 'package:flutter/material.dart';

class CadeiraRodrigo extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClosed = false;

  Sprite? cadeira, cadeiraLogado;

  CadeiraRodrigo(Vector2 position)
      : super.withSprite(
            sprite: CadeiraRodrigoDecorationSpritSheet.cadeira,
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
    seeComponentType<RodrigoFriend>(
        observed: (player) {
          if (!_playerIsClosed) {
            _playerIsClosed = true;
          }
        },
        notObserved: () {
          _playerIsClosed = false;
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
    cadeira = await CadeiraRodrigoDecorationSpritSheet.cadeira;
    cadeiraLogado = await CadeiraRodrigoDecorationSpritSheet.cadeiraLogada;

    return super.onLoad();
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
