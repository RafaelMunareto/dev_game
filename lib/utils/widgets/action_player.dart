import 'package:dev_game/utils/widgets/list_tile_action_player.dart';
import 'package:flutter/material.dart';

class ActionPlayerWidget extends StatelessWidget {
  const ActionPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'O que você deseja fazer?',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    ListTileActionWidget(
                      action: 'Fazer reunião de gestão?',
                      tempo: '-3',
                      gestao: '+4',
                      qualidade: '+2',
                      velocidade: '+1',
                      aprendizado: '+1',
                      clima: '0',
                    ),
                    ListTileActionWidget(
                      action: 'Bolar um sistema novo?',
                      tempo: '-2',
                      gestao: '+1',
                      qualidade: '+1',
                      velocidade: '-1',
                      aprendizado: '+3',
                      clima: '+1',
                    ),
                    ListTileActionWidget(
                      action: 'Estruturar refatoração de algum sistema?',
                      tempo: '+1',
                      gestao: '+2',
                      qualidade: '+4',
                      velocidade: '+2',
                      aprendizado: '+2',
                      clima: '+2',
                    ),
                    ListTileActionWidget(
                      action:
                          'Organizar confraternização ou alguma ação temática?',
                      tempo: '-2',
                      gestao: '+2',
                      qualidade: '0',
                      velocidade: '+2',
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
