// ignore_for_file: unused_element

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/decoration/decoration_sprit_sheet.dart';
import 'package:dev_game/decoration/mushroom.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flutter/material.dart';

class Chess extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClosed = false;

  Sprite? chess, chessOpen;

  Chess(Vector2 position)
      : super.withSprite(
            sprite: DecorationSpritSheet.chess,
            position: position,
            size: Vector2(16, 32)) {
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
      sprite = chessOpen;
    } else {
      sprite = chess;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    chess = await DecorationSpritSheet.chess;
    chessOpen = await DecorationSpritSheet.chessOpen;
    return super.onLoad();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content: const Text('Esse baú possuí 22 moedas de ouro!'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'))
              ]);
        });
  }

  @override
  void onTap() {
    if (_playerIsClosed) {
      gameRef.add(MushRoom(position.translate(tileSize, 0)));
    }
  }

  @override
  void onTapCancel() {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
