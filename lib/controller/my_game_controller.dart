import 'package:bonfire/bonfire.dart';
import 'package:dev_game/controller/info.dart';
import 'package:dev_game/controller/options.dart';
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
    FlameAudio.bgm.play('musica_ambiente.mp3', volume: 0.4);
    showDialogInicio();

    super.onLoad();
  }

  @override
  void update(double dt) async {
    if (timerinitial.progress.toStringAsFixed(2) == '0.05') {
      FlameAudio.bgm.play('musica_ambiente.mp3', volume: 0.4);
    }
    if (timerinitial.progress.toStringAsFixed(2) == '0.35') {
      FlameAudio.bgm.play('musica_ambiente_2.mp3', volume: 0.4);
    }
    if (timerinitial.progress.toStringAsFixed(2) == '0.70') {
      FlameAudio.bgm.play('musica_ambiente_3.mp3', volume: 0.4);
    }

    timerinitial.update(dt);

    if (infoAction) {
      infoAction = false;
      showDialogInicio();
    }
    if (optionsAction) {
      optionsAction = false;
      showDialogOptions();
    }

    if (timerinitial.finished && !fimDoTimer) {
      FlameAudio.play('perdeu_sound.mp3');
      fimDoTimer = true;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            content: const Text(
              'Você Perdeu !!!',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  goHome(context);
                  infoAction = false;
                  optionsAction = true;
                },
                child: const Text('Recomeçar'),
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

  showDialogInicio() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          content: const InfoWidget(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            )
          ],
        );
      },
    );
  }

  showDialogOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          content: const OptionsWidget(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            )
          ],
        );
      },
    );
  }
}
