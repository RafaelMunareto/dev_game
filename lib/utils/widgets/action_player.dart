import 'package:bonfire/base/bonfire_game_interface.dart';
import 'package:dev_game/player/game_hero.dart';
import 'package:dev_game/utils/widgets/list_tile_action_player.dart';
import 'package:flutter/material.dart';

class ActionPlayerWidget extends StatelessWidget {
  final BonfireGameInterface game;
  const ActionPlayerWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: SingleChildScrollView(
        child: Card(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Wrap(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTileActionWidget(
                      game: game,
                      action: 'Fazer reunião de gestão?',
                      tempo: '-3',
                      qualidade: '+2',
                      aprendizado: '+1',
                      clima: '0',
                    ),
                    ListTileActionWidget(
                      game: game,
                      action: 'Bolar um sistema novo?',
                      tempo: '-2',
                      qualidade: '+1',
                      aprendizado: '+3',
                      clima: '+1',
                    ),
                    ListTileActionWidget(
                      game: game,
                      action: 'Estruturar refatoração de algum sistema?',
                      tempo: '+1',
                      qualidade: '+4',
                      aprendizado: '+2',
                      clima: '+2',
                    ),
                    ListTileActionWidget(
                      game: game,
                      action:
                          'Organizar confraternização ou alguma ação temática?',
                      tempo: '-2',
                      qualidade: '0',
                      aprendizado: '0',
                      clima: '+4',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
