import 'package:bonfire/base/bonfire_game_interface.dart';
import 'package:bonfire/bonfire.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/constantes.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class ListTileActionWidget extends StatefulWidget {
  final String action;
  final String clima;
  final String tempo;
  final String qualidade;
  final BonfireGameInterface game;
  final String aprendizado;
  const ListTileActionWidget({
    Key? key,
    required this.action,
    required this.clima,
    required this.tempo,
    required this.qualidade,
    required this.aprendizado,
    required this.game,
  }) : super(key: key);

  @override
  State<ListTileActionWidget> createState() => _ListTileActionWidgetState();
}

class _ListTileActionWidgetState extends State<ListTileActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.action,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clima: ${widget.clima}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    Text(
                      'Tempo: ${widget.tempo}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    Text(
                      'Qualidade: ${widget.qualidade}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    Text(
                      'Aprendizado: ${widget.aprendizado}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Divider(color: Colors.white),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                )),
            Flexible(
                child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
                  onPressed: () {
                    setState(() {
                      aprendizado = aprendizado + int.parse(widget.aprendizado);
                      tempo = tempo + int.parse(widget.tempo);
                      qualidade = aprendizado + int.parse(widget.qualidade);
                      aprendizado = aprendizado + int.parse(widget.aprendizado);
                      clima = clima + int.parse(widget.clima);
                      var currentTime = timerinitial.limit;
                      timerinitial.reset();
                      timerinitial =
                          Timer(currentTime - (int.parse(widget.tempo) * 60));
                      FlameAudio.play('risada.mp3');
                      FollowerWidget.remove('actionPlayer');
                    });
                  },
                  child: const Text('Selecionar')),
            ))
          ],
        )
      ],
    );
  }
}
