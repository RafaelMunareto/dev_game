import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:dev_game/game.dart';
import 'package:dev_game/pages/home_page.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;
  final int stage;
  bool changeMusic = true;
  bool fimDoTimer = false;
  MyGameController(this.stage);

  @override
  onLoad() async {
    FlameAudio.bgm.play('musica_ambiente_2.mp3', volume: 0.4);

    super.onLoad();
  }

  @override
  void update(double dt) async {
    // if (timerinitial.progress.toStringAsFixed(2) == '0.05') {
    //   FlameAudio.bgm.play('musica_ambiente.mp3', volume: 0.4);
    // }
    // if (timerinitial.progress.toStringAsFixed(2) == '0.35') {
    //   FlameAudio.bgm.play('musica_ambiente_2.mp3', volume: 0.4);
    // }
    // if (timerinitial.progress.toStringAsFixed(2) == '0.70') {
    //   FlameAudio.bgm.play('musica_ambiente_3.mp3', volume: 0.4);
    // }

    timerinitial.update(dt);

    if (timerinitial.finished && !fimDoTimer) {
      fimDoTimer = true;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            content: const Text(
              'Acabou o jogo',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _goHome();
                },
                child: const Text('Reiniciar'),
              )
            ],
          );
        },
      );
    }

    // if (checkInterval('end game', 500, dt)) {
    //   if (gameRef.livingEnemies().isEmpty && !endGame) {
    //     endGame = true;
    //     if (stage == 3) {
    //       showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: const Text('Parabéns você zerou o game'),
    //             actions: [
    //               TextButton(
    //                 onPressed: () {
    //                   _goHome();
    //                 },
    //                 child: const Text('Ir para o início'),
    //               )
    //             ],
    //           );
    //         },
    //       );
    //     } else {
    //       showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             content: const Text('Parabéns você ganhou'),
    //             actions: [
    //               TextButton(
    //                 onPressed: () {
    //                   _goStage(stage + 1);
    //                 },
    //                 child: const Text('Próximo'),
    //               )
    //             ],
    //           );
    //         },
    //       );
    //     }
    //   }
    // }

    // if (checkInterval('gameover', 500, dt)) {
    //   if (gameRef.player?.isDead == true && !gameOver) {
    //     gameOver = true;
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           content: const Text('GAME OVER'),
    //           actions: [
    //             TextButton(
    //               onPressed: () {
    //                 _goStage(stage);
    //               },
    //               child: const Text('Tentar novamente'),
    //             ),
    //             TextButton(
    //               onPressed: () {
    //                 _goHome();
    //               },
    //               child: const Text('Ir para o início'),
    //             )
    //           ],
    //         );
    //       },
    //     );
    //   }
    // }

    super.update(dt);
  }

  // void _goStage(int newStage) {
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) {
  //       return Game(
  //         stage: newStage,
  //       );
  //     }),
  //     (route) => false,
  //   );
  // }

  void _goHome() {
    timerinitial.reset();
    timerinitial = timeinitialReset;
    dados = 0;
    processados = 0;
    paginas = 0;
    clima = 0;
    qualidade = 0;
    aprendizado = 0;
    tempo = 0;
    timerinitial.start();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const Game();
      }),
      (route) => false,
    );
  }
}
